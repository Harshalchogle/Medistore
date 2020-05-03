<%-- 
    Document   : SingleProduct
    Created on : 23 Jan, 2020, 3:45:02 PM
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
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://localhost:3306/medical"
                            user="root"
                            password="1234"
                            var="con"/>
        <sql:query dataSource="${con}" var="data">
            select * from Products where Product_Id=?
            <sql:param>${param.Product_Id}</sql:param>
        </sql:query>
            <sql:query dataSource="${con}" var="data2">
                select * from products where Category=? or company_name=?
                <sql:param>${param.category}</sql:param>
                <sql:param>${param.company}</sql:param>
            </sql:query>
                <sql:query dataSource="${con}" var="data3">
                    select count(*) as count from review where product_name=?
                    <sql:param>${param.Product_Name}</sql:param>
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
                                        <a href="Category.jsp?category=${param.category}">${param.category}</a>
                                        <a href="#">${param.Product_Name}</a>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                        <c:forEach items="${data.rows}" var="row">
                        <div class="row">                           
                            <div class="col-sm-6">
                                <ul class="thumbnails">
                                    <li><a  href="#" class="thumbnail fix-box"><img class="changeimg" src="ProductImage?Product_Id=${row.Product_Id}"></a></li>
<!--                                    <li class="image-additional"><a title="Dianabol"  class="thumbnail"> 
                                            <img class="galleryimg" src="images/img21.jpg"></a></li>
                                    <li class="image-additional"><a title="Proviron"  class="thumbnail"> 
                                            <img class="galleryimg" src="images/img22.jpg"></a></li>-->
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                
                                    
                                <div class="btn-group">
                                    <button  title="" class="btn btn-default mr_5"  type="button"><i class="fa fa-heart"></i></button>
                                    <button  title="" class="btn btn-default"  type="button"><i class="fa fa-exchange"></i></button>
                                </div>
                                <h1 style="color: #39baf0">${row.Product_Name}</h1>
                                <ul class="list-unstyled product-section">
                                    <li><span>Product Code:</span>${row.Product_code}</li>
                                    <!--<li><span>Reward Points:</span> 1000</li>-->
                                    <li><span>Availability:</span> <span class="check-stock">Pre-Order</span></li>
                                    
                                </ul>
                                    <form action="AddToCart">
                                        <input type="hidden" name="Product_Id" value="${row.Product_Id}">
                                <ul class="list-unstyled">
                                    <li>
                                        <input type="hidden" name="Price" value="${row.Price}">
                                        <h2>₹${row.Price}</h2>
                                    </li>
                                    <!--<li>Ex Tax: €199.99</li>-->
                                </ul>
                                <div id="product">
                                    <div class="form-group">
                                        <label for="input-quantity" class="control-label">Qty</label>
                                        <input type="number" class="form-control" id="input-quantity" size="2" value="1" name="Quantity"> 
                                        <br>
                                        
                                        <br>
                                        <input type="submit" value="BUY NOW!" class="btn btn-primary btn-lg btn-block reg_button">
                                        <!--<a class="btn btn-primary btn-lg btn-block reg_button" href="AddToCart"><i class="fa fa-shopping-cart"></i> BUY NOW!</a>-->
                                    </div>
                                </div>
                                    </form>
                                <div class="rating">
                                    <p>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                        <c:forEach items="${data3.rows}" var="row2">
                                        <a  href="">${row2.count} reviews</a> / <a  href="#tab-review">Write a review</a></p>
                                    <hr>

                                </div>
                            </div>
                        </div>                       
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="nav nav-tabs">
                                    <li class=""><a data-toggle="tab" href="#tab-description" aria-expanded="false">Description</a></li>
                                    <li class="active"><a data-toggle="tab" href="#tab-review" aria-expanded="true">Reviews (${row2.count})</a></c:forEach></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab-description" class="tab-pane">
                                        <div class="row ">
                                            <p>${row.Description2}</p>
                                        </div>
                                    </div>
                                    <div id="tab-review" class="tab-pane active">
                                        <form id="form-review" class="form-horizontal" method="post" action="AddReview">
                                            <h2>Write a review</h2>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label for="input-name" class="control-label">Your Name</label>
                                                    <input type="text" class="form-control" id="input-name" name="name">
                                                    <input type="hidden"  id="input-name" name="product_name" value="${row.Product_name}">
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label for="input-review" class="control-label">Your Review</label>
                                                    <textarea class="form-control" id="input-review" rows="5" name="text"></textarea>
                                                    <!--<div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!</div>-->
                                                </div>
                                            </div>
                                            <div class="form-group required">
                                                <div class="col-sm-12">
                                                    <label class="control-label">Rating</label>
                                                    &nbsp;&nbsp;&nbsp; Bad&nbsp;
                                                    <input type="radio" value="1" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="2" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="3" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="4" name="rating">
                                                    &nbsp;
                                                    <input type="radio" value="5" name="rating">
                                                    &nbsp;Good</div>
                                            </div>
                                            <div class="buttons clearfix">
                                                <div class="pull-right">
                                                    <button class="btn btn-primary reg_button"  id="button-review" type="submit" value="submit">
                                                        <i class="fa fa-caret-right"></i>&nbsp;
                                                        Continue                                       
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <div class="rel-product">
                            <div class="infoBoxHeading">
                                <a>Related Product</a>
                            </div>
                            <div class="contentText">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">  
                                            <div class="bg_best pagination-page">
                                                <div class="owl-carousel" >   
                                                    <c:forEach items="${data2.rows}" var="row">
                                                    <div class="item">
                                                        <span>
                                                            <a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&category=${row.Category}&company=${row.company_name}">
                                                                <img class="carasoul_image" src="ProductImage?Product_Id=${row.Product_Id}&category=${row.Category}&company=${row.company_name}" width="300" height="300">
                                                            </a></span>
                                                        <a class="btn btn-default"  href="SingleProduct.jsp?Product_Id=${row.Product_Id}&Product_Name=${row.Product_Name}&category=${row.Category}" role="button" >
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
                        </div>
                    </div>
                </div>
            </div>                                     
            </div>
    <jsp:include page="footer.jsp"/>
    </body>
</html>
