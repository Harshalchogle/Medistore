/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/BuynowServlet","/Myaccount.jsp","/Contact us.jsp","/UploadPresc.jsp","/MyPrescription.jsp","/Cart.jsp","/checkout.jsp","/AddToCart","/AddToWishlist"})
public class Loginfilter implements Filter
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException 
    {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse resp=(HttpServletResponse)response;
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        HttpSession hs=req.getSession();
        if(hs.getAttribute("user")==null)
        {
            resp.sendRedirect("Login.jsp");
        }
        chain.doFilter(request, response);

    }

    @Override
    public void destroy()
    {
        
        
    }
    
}
