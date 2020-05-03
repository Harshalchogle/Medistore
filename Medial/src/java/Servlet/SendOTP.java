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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Userdata;
import others.Email;
@WebServlet("/SendOTP")
public class SendOTP extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        ud.setEmail(req.getParameter("email"));
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("select * from userdata where email=?");
            ps.setString(1,ud.getEmail());
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                try 
                {
                    Random r=new Random();
                    int randomnumber=r.nextInt(8999)+1000;
                    HttpSession hs=req.getSession();
                    hs.setAttribute("otp2", randomnumber);
                    hs.setAttribute("email", ud.getEmail());
                    Email email=new Email(ud.getEmail(), "NEW OTP", "Your OTP is: "+randomnumber);
                        email.sendEmail();
                        resp.sendRedirect("enterOTP.jsp");
                    
                }
                catch (Exception e) 
                {
                    System.out.println(e);
                }
            }
            
          
            

            
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
    
    
}
