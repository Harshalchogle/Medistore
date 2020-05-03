<%-- 
    Document   : Wishlist
    Created on : 26 Jan, 2020, 8:30:50 AM
    Author     : acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <sql:query dataSource="${con}" var="data">
        select * from wishlist where userid=?
        <sql:param>${user.userid}</sql:param>
    </sql:query>
        <jsp:include page="header.jsp"/>
        <div class="main-content">
            <div class="container cart-block-style">          
                <div class="breadcrumbs">
                    <a href="home.html"><i class="fa fa-home"></i></a>
                    <a href="#">Wishlist</a>
                </div>
                <div class="contentText">
                    <h1>Wishlist
                    </h1>
                </div>
                    <c:set value="0" var="t" scope="session"/>
                            <c:forEach items="${data.rows}" var="row">
		<sql:query dataSource="${con}" var="data2">
			select * from products where Product_Id=?
			<sql:param>${row.Product_Id}</sql:param>
		</sql:query>
<!--                        <form action="AddToCart">-->
                    <div class="table-responsive margin-top">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-left">PRODUCT NAME</td>
                                    <td class="text-left">CATEGORY</td>
                                    <td class="text-left">QUANTITY</td>
                                    <td class="text-right">UNIT PRICE</td>
                                    <td class="text-right">TOTAL</td>
                                    <td class="text-right"></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${data2.rows}" var="row2">
                                <tr>
                                    <td class="text-center">  <br>                                 
                                        <a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&category=${row2.Category}&company=${row2.company_name}">
                                            <img title="${row2.Product_Name}"  src="ProductImage?Product_Id=${row2.Product_Id}&category=${row2.Category}&company=${row2.company_name}" style="width: 100px; height: 80px;">
                                        </a>
                                    </td>
                                    <td class="text-left"><br><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}">${row2.Product_Name}</a>
                                    </td>
                                    <td class="text-left"><br>${row2.category}</td>
                                    <td class="text-left"><br><div style="max-width: 200px;" class="input-group btn-block">
                                            <input type="number" class="form-control input-sm" size="1" value="${row.quantity}" name="quantity">
                                            
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary" type="submit" data-original-title="Update"><i class="fa fa-refresh"></i></button>
                                                <button class="btn btn-danger"  type="button" data-original-title="Remove"><i class="fa fa-times-circle"></i></button>
                                            </span></div></td>
                                            <td class="text-right"><br><i class="fa fa-rupee">${row2.Price}</i></td>
                                    <td class="text-right"><br><i class="fa fa-rupee">${row.totalprice}</i></td>
                                    
                                <!--<input type="name" value=" name="Product_Id">-->
                                <!--<input type="name" value="">-->
                                <td class="text-center"><br><a href="DeleteWishlist?wishlist_Id=${row.wishlist_Id}"><i class="fa fa-trash"></i></a>
                                            
                                            <c:set value="${t+row.totalprice}"  var="t" scope="session"/>
                                </tr>
                            </c:forEach> 
                            </tbody>
                        </table>
                        <div class="pull-right"><a class="btn btn-primary reg_button" href="AddToCart?Product_Id=${row.Product_id}&Price=${row.totalprice}&Quantity=${row.Quantity}">Add To Cart</a></div>
                    </div>
                   
                        <div>
                        
                        </div>  
                  
                            </c:forEach>
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-8">
                        <table class="table table-bordered">
                            <tbody>
                                
                                <tr>
                            <strong style="font-size: 30px;float: right">Pricing Details</strong>
                            <td class="text-right"><strong>Sub-Total:</strong></td>
                            <td class="text-right"><i class="fa fa-rupee">${t}</i></td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Order Total:</strong></td>
                                <td class="text-right"><i class="fa fa-rupee">${t}</i></td>
                                ${row.wishlist_Id}
                            </tr>
                        
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="pull-left"><a class="btn btn-default" href="home.jsp"><i class="fa fa-caret-right"></i>&nbsp;Continue Shopping</a></div>
                    
                    
                </div>
                <!--</form>-->
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
