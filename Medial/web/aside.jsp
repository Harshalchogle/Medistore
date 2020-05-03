<%-- 
    Document   : aside
    Created on : 14 Jan, 2020, 10:40:24 PM
    Author     : harshal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <aside class="col-sm-3 hidden-xs" id="column-left">
                        <div class="list-group">
                            <c:if test="${user==null}"> <a class="list-group-item" href="Login.jsp">Login</a></c:if>
                            <c:if test="${user!=null}"><a class="list-group-item" href="Login.jsp">Logout</a></c:if>
                            <c:if test="${user.role=='admin'}"><a class="list-group-item" href="Add Product.jsp">Add Product</a></c:if>
                            <c:if test="${user.role=='admin'}"><a class="list-group-item" href="view.jsp">View Products</a></c:if>
                            <c:if test="${user.role=='admin'}"><a class="list-group-item" href="View Contact.jsp">View Contacts</a></c:if>
                            <a class="list-group-item" href="Register.jsp">Register</a> 
                            <a class="list-group-item" href="Email.jsp">Forgotten Password</a>
                            <a class="list-group-item" href="Myaccount.jsp">My Account</a>
                            <a class="list-group-item" href="#">Address Book</a>
                            <a class="list-group-item" href="Wishlist.jsp">Wish List</a> 
                            <!--<a class="list-group-item" href="AddToCart.jsp">Cart</a>--> 
                            <a class="list-group-item" href="MyPrescription.jsp">My Prescription</a> 
                            <a class="list-group-item" href="Orders.jsp">My Orders</a> 
                            <!--<a class="list-group-item" href="">Exchange </a>--> 
                        </div>
            </aside>
    </body>
</html>
