<%-- 
    Document   : home
    Created on : 21 Jan, 2020, 2:32:14 AM
    Author     : harshal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .example clr{color:green;}
        </style> 
    </head>
    <body>
         
 <sql:setDataSource driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/medical"
                    user="root"
                    password="1234"
                    var="con"/>


 <c:if test="${param.page!=null}">
    <sql:query dataSource="${con}" var="data">
                 select * from products where Category!=? and Category!=?  order by Product_Name limit ${(param.page*15)-(15)},  15
                   <sql:param>Special Products</sql:param>
                     <sql:param>Today Products</sql:param>
           </sql:query>
 </c:if>
 <c:if test="${param.page==null}">
    <sql:query dataSource="${con}" var="data">
                 select * from products where Category!=? and Category!=? order by Product_Name limit 15
                   <sql:param>Special Products</sql:param>
                     <sql:param>Today Products</sql:param>
           </sql:query>
                 </c:if>
            <sql:query dataSource="${con}" var="data1">
            select * from products where Category=?
            <sql:param>Special Products</sql:param>
        </sql:query>
            <sql:query dataSource="${con}" var="data2">
            select * from products where Category=?
            <sql:param>Today Products</sql:param>
        </sql:query>
        <jsp:include page="header.jsp"/>
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
                                        <a href="home.jsp">All Products</a>
                                        
                                    </div>
                                </div>
                                <!----slidder start-!-->
                                <div class="contentText">
                                    <div class="infoBoxHeading">Today Bestsellers</div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">  
                                            <div class="bg_best pagination-page">
                                                <div class="owl-carousel" >   
                                                    <c:forEach items="${data2.rows}" var="row">
                                                    <div class="item">
                                                        <span>
                                                            <a href="single-product.html">
                                                                <img class="carasoul_image" src="ProductImage?Product_Id=${row.Product_Id}" width="300" height="300">
                                                            </a></span>
                                                        <a class="btn btn-default"  href="?Product_Id=${row.Product_Id}" role="button" >
                                                            Buy Now!
                                                        </a>
                                                    </div>
                                                    </c:forEach>
                                                </div>
                                                <script>
                                                    $(document).ready(function () {
                                                        $('.owl-carousel').owlCarousel({
                                                            loop: true,
                                                            margin: 10,
                                                            responsiveClass: true,
                                                            responsive: {
                                                                0: {
                                                                    items: 2,
                                                                    nav: true
                                                                },
                                                                600: {
                                                                    items: 3,
                                                                    nav: false
                                                                },
                                                                1000: {
                                                                    items: 5,
                                                                    nav: true,
                                                                    loop: false,
                                                                    margin: 20
                                                                }

                                                            }
                                                        })
                                                    })
                                                </script>
                                            </div>
                                            <!--                                    </div>-->
                                        </div>
                                    </div>
                                </div>
                                
                                <!----slidder End-!-->
                                <!----content_1--!-->
<!--                                <div class="contentText Static">
                                    <h1>What is Lorem Ipsum?</h1>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s </p>
                                    <p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>-->
                                <!----content_1 End--!-->
                                <!----content_2 For New Products--!-->
                                <div class="contentText">
                                    <h1>New Products For December</h1>                                   
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
                                                                <a type="button" class="btn wish_button btn-default reg_button" href="AddToWishlist?Product_Id=${row.Product_ID}&Price=${row.Price}&Quantity=1"><i class="fa fa-heart"></i></a>
                                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-exchange"></i></button>
                                                            </div>
                                            <!--</div>!-->
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        </div>
                                        
                                </div> 
  <nav aria-label="Page navigation example">
  <ul class="pagination pagination-circle pg-blue">
      
            <sql:query dataSource="${con}" var="c">
                 select count(*) as count from products
           </sql:query>
 
      <c:forEach items="${c.rows}" var="r">
         
          <c:forEach var="i" begin="1" end="${r.count/13}">
              <c:if test="${param.page==i}">
              <li class="page-item active"><a class="page-link" href="home.jsp?page=${i}">${i}</a></li>
              </c:if>
              <c:if test="${param.page!=i}">
              <li class="page-item"><a class="page-link" href="home.jsp?page=${i}">${i}</a></li>
              </c:if>
         </c:forEach>
    </c:forEach>
    </ul>
</nav>
                                <!----content_2 End--!-->                                
                                <!----content_3--!-->                                
                                <div class="contentText">
                                    <h1>Specials</h1>
                                    <div class="row margin-top product-layout_width">  
                                        <c:forEach items="${data1.rows}" var="row">
                                        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">                                            
                                            <div class="product-thumb">
                                                <div class="image"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&Product_Name=${row.product_name}"><img class="img-responsive"  src="ProductImage?Product_Id=${row.Product_Id}" width="200" height="200"></a>
                                                </div>                                                    
                                                    <div class="caption">
                                                        <h4 class="product_title"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&Product_Name=${row.product_name}">${row.Product_Name}</a></h4>
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
                                                            <div class="pull-right">
                                                                <a class="btn wish_button btn-default reg_button" href="Wishlist.jsp"><i class="fa fa-heart"></i></a>
                                                                <button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-exchange"></i></button>
                                                            </div>
                                            <!--</div>!-->
                                                    </div>
                                                </div>    
                                                 </c:forEach>
                                            </div>  
                                    </form>
                                        </div>                                                            
                                </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
 <jsp:include page="footer.jsp"/>
</body>
</html>
