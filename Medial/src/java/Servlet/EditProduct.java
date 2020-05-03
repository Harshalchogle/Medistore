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
import javax.servlet.http.Part;
import model.Product;

@WebServlet("/EditProduct")
@MultipartConfig(maxFileSize = 90000000000000L)
public class EditProduct extends HttpServlet
{
    Product pr=new Product();
InputStream inputStream;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        pr.setProduct_Code(req.getParameter("PCode"));
        pr.setProduct_Id(Integer.parseInt(req.getParameter("Pid")));
        pr.setProduct_Name(req.getParameter("PName"));
        pr.setCompany_Name(req.getParameter("Company"));
        pr.setDescription(req.getParameter("Pdescription"));
        pr.setDescription2(req.getParameter("Pdescription2"));
        pr.setPrice(Double.parseDouble(req.getParameter("PPrice")));
        pr.setCategory(req.getParameter("category"));
        pr.setQuantity(Integer.parseInt(req.getParameter("PQuantity")));
        Part part=(Part)req.getPart("PPhoto");
        inputStream=part.getInputStream();
        Writedata();
        resp.sendRedirect("index.jsp");
    }
    public void Writedata()
    {
         try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("update products set Product_code=?,Product_Name=?,Company_Name=?,Description=?,Description2=?,Price=?,Category=?,Quantity=?,Product_Photo=? where Product_Id=?");
            ps.setString(1,pr.getProduct_Code());
            ps.setString(2,pr.getProduct_Name());
            ps.setString(3,pr.getCompany_Name());
            ps.setString(4,pr.getDescription());
            ps.setString(5,pr.getDescription2());
            ps.setDouble(6,pr.getPrice());
            ps.setString(7,pr.getCategory());
            ps.setInt(8,pr.getQuantity());
            ps.setBlob(9, inputStream);
            ps.setInt(10,pr.getProduct_Id());
            ps.executeUpdate();
        }
         catch(Exception e)
         {
             System.out.println(e);
         }
    }  
}
