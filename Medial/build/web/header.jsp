<%-- 
    Document   : header
    Created on : 13 Jan, 2020, 6:48:06 PM
    Author     : harshal
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" href="images/favicon.png"/>
        <title>MediStore</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/> 
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/owl-carousel.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/custom_1.js" type="text/javascript"></script>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/medical"
                    user="root"
                    password="1234"
                    var="con"/>
        <sql:query dataSource="${con}" var="data">
          select count(Cart_Id) As count from cart where userid=?
          <sql:param>${user.userid}</sql:param>
     </sql:query>
          <sql:query dataSource="${con}" var="data2">
              select distinct Company_Name from products order by company_name
          </sql:query>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4" id="logo" >
                    <a href="#" class="logo-text">
                        Medi<span style="color:#39BAF0; font-size:40px">STORE</span>
                    </a>		
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12" style="display:none " id="navbar_hide" >
                    <nav  role="navigation" class="navbar navbar-inverse">
                        <a href="#" style="float: left" class="logo-text">
                            Medi<span style="color:#39BAF0; font-size:40px">STORE</span>
                        </a>
                        <div id="nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background: #8EBE08; border: none; margin-right: 0">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-md-4 col-md-offset-4 col-sm-offset-2  col-sm-6 col-xs-12" >
                    <div id="top_right"> 
                        
                        <div id="cart">
                            <div class="text">
                                <div class="img">
                                    <a href="Cart.jsp"> <img class="img-responsive" src="images/cart.png" alt="" title="" width="26" height="27" /></a>
                                </div><span>Your cart:<c:forEach items="${data.rows}" var="row"></span><span class="cart_total"></span><span class="cart_items">(${row.count} items)</span></c:forEach>
                            </div> 
                        
                        </div>
                        <div id="bottom_right">
                            <div class="row">
                                <div class="col-md-6 col-xs-6 wd_auto">
                                    <div class="left">
                                        <div class="login">
                                            <c:if test="${user==null}">
                                            <a class="btn btn-default reg_button" href="Login.jsp">Login</a>
                                            </c:if>
                                            <c:if test="${user!=null}">
                                                <a class="btn btn-default reg_button" href="Login.jsp">Logout</a>
                                            </c:if>
                                            <a class="btn btn-default reg_button" href="Register.jsp">Signup</a>
                                        <c:if test="${user!=null}">
                                            <a class="btn btn-default reg_button" href="Myaccount.jsp">Hi,${user.fname}&nbsp;${user.lname}</a>
                                        </c:if>
                                        </div>			
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="container-fluid bg-color" data-spy="affix" data-offset-top="197">
            <div class="row">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <nav  role="navigation" class="navbar navbar-inverse"  id="nav_show">
                                <div id="nav">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                    <div class="collapse navbar-collapse" id="myNavbar">
                                        <ul class="nav navbar-nav site_nav_menu1"  >
                                            <li class="first "><a href="home.jsp">Home</a></li>
                                            <li><a href="#">About us</a></li>
                                            <li><a href="Disclaimer.jsp">Disclaimer</a></li>
                                            <li><a href="UploadPresc.jsp">Upload Doctor Prescription</a></li>
                                            <li><a href="Privacy.jsp">Privacy Policy</a></li>
                                            <li><a href="terms.jsp">Terms & Conditions</a></li>
                                            <li><a href="Contact us.jsp">Contact Us</a></li>
                                            <li><a href="Myaccount.jsp">My Account</a></li>                                            
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <div class="container" >
            <div class="row" id="search_manu" style="margin-top: 10px">
                <div class="col-md-6 col-xs-12">
                    <form  name="quick_find" action="SearchProduct.jsp">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" placeholder="Enter Products here" class="form-control input-lg" id="inputGroup" name="productname"/>
                                <span class="input-group-addon">
                                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 col-xs-12">
                    <form  name="manufacturers"> 
                        <div class="form-group">
                            <div class="">
                                <select  style="font-size: 14px; background: #EAEAEA; border: none;" name="manufacturers_id"  size="1" class="input-lg form-control arrow-hide date_class" onchange="location=this.value;">
                                    <option value="" selected="selected">Please Select manufacturers</option>
                                <c:forEach items="${data2.rows}" var="row">
                                    <option value="SearchProduct.jsp?company=${row.company_name}">${row.Company_name}</option>
                                </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <a style="display: none" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </body>
</html> 

