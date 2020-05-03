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
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet
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
        Double totalPrice=pr.getQuantity()*pr.getPrice();
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
          PreparedStatement ps2=con.prepareStatement("delete from wishlist where Product_Id=? and userid=?");
          ps2.setInt(1,pr.getProduct_Id());
          ps2.setInt(2,user.getUserid());
          ps2.executeUpdate();
          PreparedStatement ps1=con.prepareStatement("select * from cart where Product_Id=? and userid=?");
          ps1.setInt(1,pr.getProduct_Id());
          ps1.setInt(2,user.getUserid());
            ResultSet rs=ps1.executeQuery();
            if(rs.next())
            {
                int pq=rs.getInt("Quantity");
                int tq=pq+pr.getQuantity();
                PreparedStatement ps=con.prepareStatement("update cart set Quantity=?, totalprice=? where Product_Id=? and userid=?");
                ps.setInt(1, tq);
                ps.setDouble(2, tq*pr.getPrice());
                ps.setInt(3,pr.getProduct_Id());
                ps.setInt(4,user.getUserid());
                ps.executeUpdate();
                hs.setAttribute("msg","Cart Updated Successfully");
                hs.setAttribute("pagename","Cart.jsp");
                resp.sendRedirect("popup.jsp");
                resp.sendRedirect("Cart.jsp");
            }
            else
            {
          PreparedStatement ps=con.prepareStatement("insert into cart (Product_Id,userid,Quantity,totalprice) values(?,?,?,?)");
          ps.setInt(1,pr.getProduct_Id());
          ps.setInt(2,user.getUserid());
          ps.setInt(3,pr.getQuantity());
          ps.setDouble(4,totalPrice);
          ps.executeUpdate();
          hs.setAttribute("msg","Cart Added Successfully");
          hs.setAttribute("pagename","Cart.jsp");
          resp.sendRedirect("popup.jsp");
          resp.sendRedirect("Cart.jsp");
        }  
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
    
    
}