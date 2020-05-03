<%-- 
    Document   : Continue
    Created on : 3 Feb, 2020, 7:41:39 AM
    Author     : acer
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/medical"
                    user="root"
                    password="1234"
                    var="con"/>
        <sql:query dataSource="${con}" var="data2">
         select * from cart where userid=?
         <sql:param>${user.userid}</sql:param>
     </sql:query>
        <jsp:include page="header.jsp"/>
        <div class="main-content">
            <div class="container checkout">
                <div class="breadcrumbs">
                    <a href="home.jsp"><i class="fa fa-home"></i></a>
                    <a href="checkout.jsp">Checkout</a>
                </div>
                <h2 class="text-center text-uppercase text-bold">checkout</h2>
                <hr class="small-line">
                <div id="accordion" class="panel-group margin-top">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-payment-address">Step 1: Account &amp; Billing Details <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <c:forEach items="${data2.rows}" var="row3">
                            <sql:query dataSource="${con}" var="data3">
                                select * from userdata where userid=?
                                <sql:param>${row3.userid}</sql:param>
                            </sql:query>
                        </c:forEach>
                        <div class="panel-collapse collapse in" id="collapse-payment-address" style="height: auto;">
                            <div class="panel-body"><div class="row">
                                    <div class="col-sm-6">
                                        <fieldset id="account">
                                            <legend>Your Personal Details</legend>
                                            <div style="display: none;" class="form-group">
                                                <label class="control-label">Customer Group</label>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" checked="checked" value="1" name="customer_group_id">
                                                        Default</label>
                                                </div>
                                            </div>
                                            <c:forEach items="${data3.rows}" var="row4">
                                            <div class="form-group required">
                                                <label for="input-payment-firstname" class="control-label">First Name</label>
                                                <input type="text" class="form-control" id="input-payment-firstname" placeholder="First Name" value="${row4.First_Name}" name="firstname">
                                            </div>
                                            <div class="form-group required">
                                                <label for="input-payment-lastname" class="control-label">Last Name</label>
                                                <input type="text" class="form-control" id="input-payment-lastname" placeholder="Last Name" value="${row4.Last_Name}" name="lastname">
                                            </div>
                                            <div class="form-group required">
                                                <label for="input-payment-email" class="control-label">E-Mail</label>
                                                <input type="text" class="form-control" id="input-payment-email" placeholder="E-Mail" value="${row4.Email}" name="email">
                                            </div>
                                            <div class="form-group required">
                                                <label for="input-payment-telephone" class="control-label">Telephone</label>
                                                <input type="text" class="form-control" id="input-payment-telephone" placeholder="Telephone" value="${row4.Telephone}" name="telephone">
                                            </div>                 
                                            </c:forEach>
                                          </fieldset>  
                                    </div>
                                    
                                </div>
                                
                                

                            </div>
                        </div>
                    </div>
                    <form action="BuynowServlet" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-parent="#accordion" data-toggle="collapse" href="#collapse-checkout-confirm" aria-expanded="true">Step 2: Confirm Order <i class="fa fa-caret-down"></i></a></h4>
                        </div>
                        <c:forEach items="${data2.rows}" var="row2">
                                                    <sql:query dataSource="${con}" var="data3">
                                                        select * from products where Product_Id=?
                                                        <sql:param>${row2.Product_Id}</sql:param>
                                                    </sql:query>
                        <div id="collapse-checkout-confirm" class="panel-collapse collapse in" aria-expanded="true" style="">
                            <div class="panel-body"><div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td class="text-left">Product Name</td>
                                                <td class="text-left">Category</td>
                                                <td class="text-right">Quantity</td>
                                                <td class="text-right">Unit Price</td>
                                                <td class="text-right">Total</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${data3.rows}" var="row4">
                                            <tr>       
                                                <td class="text-left"><a href="#">${row4.product_name}</a>
                                                </td>
                                                <td class="text-left">${row4.Category}</td>
                                                <td class="text-right">${row2.Quantity}</td>
                                            
                                            <input type="hidden" value="${row2.product_Id}" name="Product_Id">
                                            <input type="hidden" value="${row4.product_Name}" name="Product_Name">
                                            <input type="hidden" value="${row2.quantity}" name="quantity">
                                            <input type="hidden" value="${row2.cart_id}" name="cartid">
                                                <td class="text-right"><i class="fa fa-rupee">${row4.price}</i></td>
                                                <td class="text-right"><i class="fa fa-rupee">${row2.totalprice}</i></td>                                                        
                                            </tr>
                                        </tbody>
                                        </c:forEach>
                                    </c:forEach>
                                        <tfoot>
                                            <br>
                                            <tr>
                                                <td class="text-right" colspan="4"><strong>Sub-Total:</strong></td>
                                                <td class="text-right"><i class="fa fa-rupee">${t}</i></td>
                                            </tr>
                                          
                                            <tr>
                                                <td class="text-right" colspan="4">Flat Shipping Rate:</td>
                                                <td class="text-right"><i class="fa fa-rupee">5.00</i></td>
                                            </tr>
                                            <tr>
                                                <td class="text-right" colspan="4"><strong>Order Total:</strong></td>
                                                <td class="text-right"><i class="fa fa-rupee">${t+5}</i></td>
                                                <input type="hidden" value="${t+5}" name="Price">
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="buttons">
                                    <div class="pull-right">
                                        <input type="submit" class="btn btn-primary" value="Confirm order">                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <%--</c:forEach>--%>    
    </body>
</html>
