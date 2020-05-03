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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        ud.setEmail(req.getParameter("email"));
        ud.setPass(req.getParameter("password"));
       try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");  
            PreparedStatement ps=con.prepareStatement("select * from userdata where Email=? and Password=?");
            ps.setString(1, ud.getEmail());
            ps.setString(2, ud.getPass());
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                ud.setUserid(rs.getInt("userid"));
              ud.setFname(rs.getString("First_Name"));
              ud.setLname(rs.getString("Last_Name"));
              ud.setEmail(rs.getString("Email"));
              ud.setTelephone(rs.getLong("telephone"));
              ud.setPass(rs.getString(2));
              ud.setRole(rs.getString("Role"));
              ud.setStatus(rs.getString("status"));
                if(ud.getStatus().equals("P"))
                {
                    try 
                    {
                        Random r=new Random();
			int randomnumber=r.nextInt(8999)+1000;
			HttpSession hs=req.getSession();
			hs.setAttribute("otp", randomnumber);
			hs.setAttribute("em", ud.getEmail());
                        Email email=new Email(ud.getEmail(), "NEW OTP", "Your OTP is: "+randomnumber);
                        email.sendEmail();
                        resp.sendRedirect("OTP.jsp");
                    }
                    catch (Exception e) 
                    {
                        System.out.println(e);
                    }
                } 
                else 
                {
                HttpSession hs=req.getSession();
                hs.setAttribute("user", ud);
		hs.setAttribute("msg", "Login Successfully");
		hs.setAttribute("pagename", "home.jsp");
                hs.setAttribute("type", "success");
		resp.sendRedirect("popup.jsp");
                resp.sendRedirect("home.jsp");
                }
              
            }
            else
            {
                HttpSession hs=req.getSession();
                hs.setAttribute("user", ud);
		hs.setAttribute("type", "error");
		hs.setAttribute("msg", "Login Failed Incorrect Email or Password");
		hs.setAttribute("pagename", "Login.jsp");
		resp.sendRedirect("popup.jsp");
                resp.sendRedirect("Login.jsp");
            }
            
            
        }
        catch (Exception e) 
        {
            System.out.println(e);   
        }
        
    }
    
    
}
