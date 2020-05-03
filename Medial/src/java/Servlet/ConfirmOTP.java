/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ConfirmOTP")
public class ConfirmOTP extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        int otp=Integer.parseInt(req.getParameter("otp1"));
        HttpSession hs=req.getSession();
        int Checkotp=(int)hs.getAttribute("otp2");
        String Email=(String)hs.getAttribute("Email");
        
        if(otp==Checkotp)
        {
            resp.sendRedirect("forgotPassword.jsp");
        }
        else
        {
            PrintWriter out=resp.getWriter();
            out.println("Email not found please register first.");
        }
       
    }
  
}

