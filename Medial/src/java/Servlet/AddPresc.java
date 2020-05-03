/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.Part;
import model.Userdata;
@WebServlet("/AddPresc")
@MultipartConfig(maxFileSize = 900000000000000000L)
public class AddPresc extends HttpServlet
{
    
    InputStream inputStream;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    

        HttpSession hs=req.getSession();
        Userdata user=(Userdata) hs.getAttribute("user");
        Part part=(Part)req.getPart("PrPhoto");
        inputStream=part.getInputStream();
       
        try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
        PreparedStatement ps=con.prepareStatement("insert into prescription(userid,Presc_Photo,Email) values(?,?,?)");
        ps.setInt(1,user.getUserid());
        ps.setBlob(2,inputStream);
        ps.setString(3,user.getEmail());
        ps.executeUpdate();
        resp.sendRedirect("MyPrescription.jsp");
            
    }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}