/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

//import com.instamojo.wrapper.api.ApiContext;
//import com.instamojo.wrapper.api.Instamojo;
//import com.instamojo.wrapper.api.InstamojoImpl;
//import com.instamojo.wrapper.model.PaymentOrder;
//import com.instamojo.wrapper.model.PaymentOrderResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Userdata;

@WebServlet("/BuynowServlet")
public class BuynowServlet extends HttpServlet
{
    
    Product pr=new Product();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        pr.setQuantity(Integer.parseInt(req.getParameter("quantity")));
//        pr.setProduct_Id(Integer.parseInt(req.getParameter("Product_Id")));
        pr.setPrice(Double.parseDouble(req.getParameter("Price")));
//        pr.setProduct_Name(req.getParameter("Product_Name"));
        String product_id[]=req.getParameterValues("Product_Id");
        HttpSession hs=req.getSession();
        Userdata userdata=(Userdata) hs.getAttribute("user");
        
//        String products="";
//        for (String p : product_id)
//        {
//            products=p;
//        }
        String cartid[]=req.getParameterValues("cartid"); 
        for (String s : cartid)

            try
            {
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps=con.prepareStatement("delete from cart where Cart_Id=?");
            ps.setInt(1,(Integer.parseInt(s)));
            ps.executeUpdate();
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
     
            for (String p : product_id) {
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","1234");
            PreparedStatement ps1=con.prepareStatement("insert into orders(Product_Id,userid,quantity,Price) values(?,?,?,?)");
            ps1.setInt(1,Integer.parseInt(p));
            ps1.setInt(2, userdata.getUserid());
            ps1.setInt(3,pr.getQuantity());
            ps1.setDouble(4,pr.getPrice());
            ps1.executeUpdate();
            hs.setAttribute("msg","Order successfully");
            hs.setAttribute("pagename","Orders.jsp");
            resp.sendRedirect("popup.jsp");
            resp.sendRedirect("Orders.jsp");
            }
            
            catch(Exception e)
            {
                System.out.println(e);
            }
    }
            
        }
}
//      
//        
//        pr.setQuantity(Integer.parseInt(req.getParameter("quantity")));
        
//        hs.setAttribute("product",pr);
//        try 
//        {
//            //Enter your client id and client secret
//            ApiContext context = ApiContext.create("test_0zjLXzsz8KEKeeu09dmIfWjeZkdvdMxyYm6", "test_JKCZGl73EY4hcA7ILkV4MkedRcDH684JzklL5RO7yQDZ0XTHXdzDyiqIZvXnYlWs4bzRwW9XFxibVwczjHO8dni2fbbnzideLsstBqJvYVPEGTrwwljnOPnOLuz", ApiContext.Mode.TEST);
//            Instamojo api = new InstamojoImpl(context);
//
//            PaymentOrder order = new PaymentOrder();
//            order.setName(userdata.getFname());
//            order.setEmail(userdata.getEmail());
//            order.setPhone(userdata.getTelephone().toString());
//            order.setCurrency("INR");
//            order.setAmount(pr.getPrice());
//            order.setDescription(pr.getProduct_Name());
//            order.setRedirectUrl("https://www.google.com");
//            order.setWebhookUrl("https://www.google.com");
//            order.setTransactionId(UUID.randomUUID().toString());
//            PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
//            resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
//        }
//        catch (Exception e) 
//        {
//            System.out.println(e);
//        }
//    }


