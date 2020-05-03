<%-- 
    Document   : SearchProduct
    Created on : 26 Jan, 2020, 7:25:38 AM
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
        <jsp:include page="header.jsp"/>
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/medical"
                    user="root"
                    password="1234"
                    var="con"/>
    <c:if test="${param.productname!=null}">
 <sql:query dataSource="${con}" var="data">
     select * from products where Product_Name like '%' ? '%'
     <sql:param>${param.productname}</sql:param>
 </sql:query>
        </c:if>
     <c:if test="${param.company!=null}">
         <sql:query dataSource="${con}" var="data">
             select * from products  where company_name=? order by company_name
             <sql:param>${param.company}</sql:param>
         </sql:query>
     </c:if>
     <div id="site_content">
            <div class="container">
                <div class="row">
                    <jsp:include page="HomeAside.jsp"/> 
                    <div class="col-md-9 col-sm-8 col-xs-12 right_sidebar1">
                        <div id="right_part">
                            <div class="contentContainer">
                                <div class="contentText">
                                    <div class="breadcrumbs">
                                        <a href="home.jsp" class="headerNavigation"><i class="fa fa-home"></i></a>
                                        <c:if test="${param.productname!=null}">
                                        <a href="Category.jsp">${param.productname}</a>
                                        </c:if>
                                        <c:if test="${param.company!=null}">
                                        <a href="Category.jsp">${param.company}</a>
                                        </c:if>
                                    </div>
                                    </div>
                                
                                    <div class="contentText">                                
                                    <div class="row margin-top product-layout_width">  
                                        <c:forEach items="${data.rows}" var="row">
                                        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="product-thumb">
                                                <div class="image"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&category=${row.Category}&company=${row.company_name}"><img class="img-responsive"  src="ProductImage?Product_Id=${row.Product_Id}" width="200" height="200"></a>
                                                </div>
                                                    <div>
                                                    <div class="caption">
                                                        <h4 class="product_title"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&category=${row.Category}&company=${row.company_name}">${row.Product_Name}</a></h4>
                                                            <p>
                                                            ${row.Description}....</p>
                                                            <p class="price">
                                                                <span class="new_price">₹${row.Price}</span> 
                                                                <span class="old_price"></span>
                                                                <span class="price-tax"></span>
                                                            </p>
                                                    </div>
                                                              
                                            <!--<div class="button-group">!-->
                                                            <a class="btn book-btn btn-default reg_button" href="BuynowServlet?Product_Id=${row.Product_Id}&Price=${row.price}&Product_Name=${row.Product_name}&quantity=1">BUY NOW!</a>
                                                            <c:if test="${user.role=='admin'}">
                                                                <a class="btn book-btn btn-default reg_button" href="EditProduct.jsp?Product_Id=${row.Product_Id}">EDIT</a>
                                                            </c:if>
                                                            <div class="pull-right">
                                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-heart"></i></button>
                                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-exchange"></i></button>
                                                            </div>
                                            <!--</div>!-->
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        </div>  
                                </div>               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            <jsp:include page="footer.jsp"/>   
     </div>
    </body>
</html>
