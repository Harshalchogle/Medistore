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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Userdata;

@WebServlet("/AddReview")
public class AddReview extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        ud.setFname(req.getParameter("name"));
        String Review=req.getParameter("text");
        String Rating=req.getParameter("rating");
        String Productname=req.getParameter("product_name");
        
        try 
        {
           Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("insert into review(Name,Review,Rating,Product_Name) values (?,?,?,?)");
            ps.setString(1, ud.getFname());
            ps.setString(2, Review);
            ps.setString(3, Rating);
            ps.setString(4, Productname);
            ps.executeUpdate();
            HttpSession hs=req.getSession();
            hs.setAttribute("msg","Your Review has been sent");
                hs.setAttribute("pagename","home.jsp");
                resp.sendRedirect("popup.jsp");
                resp.sendRedirect("home.jsp");
          
        } 
        catch (Exception e) 
        {
            
        }
    }
    
}
