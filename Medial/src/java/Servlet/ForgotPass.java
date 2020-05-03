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
import model.Userdata;

@WebServlet("/ForgotPass")
public class ForgotPass extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String pass=req.getParameter("password");
        String Confirm=(req.getParameter("confirm"));
        HttpSession hs=req.getSession();
        String email=(String) hs.getAttribute("email");
       try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");  
            PreparedStatement ps=con.prepareStatement("update userdata set Password=?,ConfirmPassword=? where Email=?");
            ps.setString(1, pass);
            ps.setString(2, Confirm);
            ps.setString(3, email);
            ps.executeUpdate();
            
                hs.setAttribute("user", ud);
		hs.setAttribute("msg", "Password Changed Successfully");
		hs.setAttribute("pagename", "Login.jsp");
		resp.sendRedirect("popup.jsp");
                resp.sendRedirect("Login.jsp");
        }
       catch(Exception e)
       {
           System.out.println(e);
       }
    }  
}
