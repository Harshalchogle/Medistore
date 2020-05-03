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

@WebServlet(name="RegisterServlet", urlPatterns ="/RegisterServlet")
public class RegisterServlet extends HttpServlet
{
    Userdata ud=new Userdata();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       ud.setFname(req.getParameter("firstname"));
       ud.setLname(req.getParameter("lastname"));
       ud.setEmail(req.getParameter("email"));
       ud.setTelephone(Long.parseLong(req.getParameter("telephone")));
//       ud.setFax(Integer.parseInt(req.getParameter("fax")));
       ud.setCompany(req.getParameter("company"));
       ud.setAdd1(req.getParameter("address_1"));
       ud.setAdd2(req.getParameter("address_2"));
       ud.setCity(req.getParameter("city"));
       ud.setPostcode(Integer.parseInt(req.getParameter("postcode")));
       ud.setCountry(req.getParameter("country_id"));
       ud.setRegion(req.getParameter("zone_id"));
       ud.setPass(req.getParameter("password"));
       ud.setCpass(req.getParameter("confirm"));
       ud.setRole("user");
       ud.setStatus("P");

        try 
        {

            Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
          PreparedStatement ps2=con.prepareStatement("select * from userdata where Email=?");
          ps2.setString(1,ud.getEmail());
          ResultSet rs1=ps2.executeQuery();
          if(rs1.next())
          {
                HttpSession hs=req.getSession();
                hs.setAttribute("user", ud);
                hs.setAttribute("type","error");
		hs.setAttribute("msg", "Email already exist,Please try Different Email");
		hs.setAttribute("pagename", "Register.jsp");
		resp.sendRedirect("popup.jsp");
                resp.sendRedirect("Register.jsp");
          }
          else
          {
            PreparedStatement ps=con.prepareStatement("insert into userdata(First_Name,Last_Name,Email,Telephone,Company,Add1,Add2,City,PostCode,Country,Region,Password,ConfirmPassword,Role,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,ud.getFname());
            ps.setString(2,ud.getLname());
            ps.setString(3,ud.getEmail());
            ps.setLong(4,ud.getTelephone());
            ps.setString(5,ud.getCompany());
            ps.setString(6,ud.getAdd1());
            ps.setString(7,ud.getAdd2());
            ps.setString(8,ud.getCity());
            ps.setInt(9,ud.getPostcode());
            ps.setString(10,ud.getCountry());
            ps.setString(11,ud.getRegion());
            ps.setString(12,ud.getPass());
            ps.setString(13,ud.getCpass());
            ps.setString(14,ud.getRole());
            ps.setString(15,ud.getStatus());
            int i=ps.executeUpdate();       
            try 
            {
                Random r=new Random();
                int randomnumber=r.nextInt(8999)+1000;
                HttpSession hs=req.getSession();
                hs.setAttribute("otp", randomnumber);
                hs.setAttribute("email", ud.getEmail());
                Email email=new Email(ud.getEmail(), "Welcome to Medi Store", "Thank You for register on Medi Store website. Your OTP is: "+randomnumber);
                email.sendEmail();
            } 
            catch (Exception e) 
            {
            System.out.println(e);
            }
                resp.sendRedirect("OTP.jsp");
            } 
        }
        catch (Exception e) 
        {
            System.out.println(e); 
        }
    }
}

