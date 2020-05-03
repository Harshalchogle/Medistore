
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
@WebServlet("/Checkotp")
public class Checkotp extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        int otp=Integer.parseInt(req.getParameter("otp"));
        HttpSession hs=req.getSession();
        int checkotp=(int)hs.getAttribute("otp");
        String email=(String)hs.getAttribute("email");
        if(otp==checkotp)
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("update userdata set status='A' where email=?");
            ps.setString(1, email);
            ps.executeUpdate();
            hs.setAttribute("user", ud);
            hs.setAttribute("type", "success");
            hs.setAttribute("msg", "Registerd Suceessfully");
            hs.setAttribute("pagename", "Login.jsp");
            resp.sendRedirect("popup.jsp");
            resp.sendRedirect("Login.jsp");
              
            
        } catch (Exception e) 
        {
            System.out.println(e);
        }
        
    }
    
    
    
}
