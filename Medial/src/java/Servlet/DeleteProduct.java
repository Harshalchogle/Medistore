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
import model.Product;

@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet
{
    Product pr=new Product();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        pr.setProduct_Id(Integer.parseInt(req.getParameter("Product_Id")));
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
          PreparedStatement ps=con.prepareStatement("delete from products where Product_Id=?");
          ps.setInt(1, pr.getProduct_Id());
          ps.executeUpdate();
          resp.sendRedirect("view.jsp");
            
        } 
        catch (Exception e) 
        {
            
        }
        
    }
    
    
}
