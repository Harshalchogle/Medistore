/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package others;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductImage")
public class ProductImage extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        int pid=Integer.parseInt(req.getParameter("Product_Id"));
        try 
        {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
          PreparedStatement ps=con.prepareStatement("select Product_Photo from products where Product_Id="+pid);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                Blob blob=rs.getBlob("Product_Photo");
                byte [] arr=blob.getBytes(1,(int)blob.length());
                resp.getOutputStream().write(arr);
            }
          

            
        } catch (Exception e)
        {
            System.out.println(e);
        }
        
    }
    
    
}
