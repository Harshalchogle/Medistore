/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Userdata;

@WebServlet("/AddToWishlist")
public class AddToWishlist extends HttpServlet
{   
Product pr=new Product();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        pr.setProduct_Id(Integer.parseInt(req.getParameter("Product_Id")));
        pr.setPrice(Double.parseDouble(req.getParameter("Price")));
        pr.setQuantity(Integer.parseInt(req.getParameter("Quantity")));
        HttpSession hs=req.getSession();
        Userdata user=(Userdata) hs.getAttribute("user");
        hs.setAttribute("product",pr);
        Double totalPrice=pr.getQuantity()*pr.getPrice();
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
          PreparedStatement ps1=con.prepareStatement("select * from wishlist where Product_Id=? and userid=?");
          ps1.setInt(1,pr.getProduct_Id());
          ps1.setInt(2,user.getUserid());
            ResultSet rs=ps1.executeQuery();
            if(rs.next())
            {
                int pq=rs.getInt("Quantity");
                int tq=pq+pr.getQuantity();
                PreparedStatement ps=con.prepareStatement("update wishlist set Quantity=?, totalprice=? where Product_Id=? and userid=?");
                ps.setInt(1, tq);
                ps.setDouble(2, tq*pr.getPrice());
                ps.setInt(3,pr.getProduct_Id());
                ps.setInt(4,user.getUserid());
                ps.executeUpdate();
                hs.setAttribute("msg","Wishlist Updated");
                hs.setAttribute("pagename","Wishlist.jsp");
                resp.sendRedirect("popup.jsp");
                resp.sendRedirect("Wishlist.jsp");
            }
            else
            {
          PreparedStatement ps=con.prepareStatement("insert into wishlist (Product_Id,userid,Quantity,totalprice) values(?,?,?,?)");
          ps.setInt(1,pr.getProduct_Id());
          ps.setInt(2,user.getUserid());
          ps.setInt(3,pr.getQuantity());
          ps.setDouble(4,totalPrice);
          ps.executeUpdate();
          hs.setAttribute("msg","Wishlist Added");
          hs.setAttribute("pagename","Wishlist.jsp");
          resp.sendRedirect("popup.jsp");
          resp.sendRedirect("Wishlist.jsp");
        }  
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
}

