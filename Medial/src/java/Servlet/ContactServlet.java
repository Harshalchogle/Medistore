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

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        ud.setFname(req.getParameter("name"));
        ud.setEmail(req.getParameter("email"));
        String Message=req.getParameter("message");
        
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("insert into contact(name,email,message) values (?,?,?)");
            ps.setString(1, ud.getFname());
            ps.setString(2, ud.getEmail());
            ps.setString(3,Message);
            ps.executeUpdate();
            
                HttpSession hs=req.getSession();
                hs.setAttribute("user", ud);
		hs.setAttribute("msg", "Your Message has been sent");
		hs.setAttribute("pagename", "home.jsp");
		resp.sendRedirect("popup.jsp");
                resp.sendRedirect("home.jsp");
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
        
    }
    
    
}
