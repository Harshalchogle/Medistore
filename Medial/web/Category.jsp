<%-- 
    Document   : Ayurvedic
    Created on : 23 Jan, 2020, 5:27:16 PM
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
         <c:if test="${param.page!=null}">
            <sql:query dataSource="${con}" var="data">
            select * from products where Category=? order by product_name limit ${(param.page*9)-(9)},9
            <sql:param>${param.category}</sql:param>
        </sql:query>
         </c:if>
            <c:if test="${param.page==null}">
                <sql:query dataSource="${con}" var="data">
                    select * from products where category=? order by product_name limit 9
                    <sql:param>${param.category}</sql:param>
                </sql:query>
            </c:if>
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
                                    </div>
                                </div>
<!--                                <div class="contentText Static">
                                    <h1>What is Lorem Ipsum?</h1>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s </p>
                                    <p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>-->
                                <!----content_1 End--!-->
                                <!----content_2 For New Products--!-->
                                <div class="contentText">
                                    <h1>${param.category}</h1>                                  
                                    <div class="row margin-top product-layout_width">  
                                        <c:forEach items="${data.rows}" var="row">
                                        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="product-thumb">
                                                <div class="image"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&Product_Name=${row.Product_Name}&category=${row.category}&company=${row.company_name}"><img class="img-responsive"  src="ProductImage?Product_Id=${row.Product_Id}" width="200" height="200"></a>
                                                </div>
                                                    <div>
                                                    <div class="caption">
                                                        <h4 class="product_title"><a href="SingleProduct.jsp?Product_Id=${row.Product_Id}&Product_Name=${row.Product_Name}&category=${row.category}&company=${row.company_name}">${row.Product_Name}</a></h4>
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
                                                                <a href="Wishlist.jsp"><button  title="" data-toggle="tooltip" type="button" class="btn wish_button btn-default reg_button"><i class="fa fa-heart"></i></button></a>
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
                 select count(*) as count from products Where category=?
                 <sql:param>${param.category}</sql:param>
           </sql:query>
 
      <c:forEach items="${c.rows}" var="r">
         
          <c:forEach var="i" begin="1" end="${r.count/7}">
              <c:if test="${param.page==i}">
              <li class="page-item active"><a class="page-link" href="Category.jsp?page=${i}&category=${param.category}">${i}</a></li>
              </c:if>
              <c:if test="${param.page!=i}">
              <li class="page-item"><a class="page-link" href="Category.jsp?page=${i}&category=${param.category}">${i}</a></li>
              </c:if>
         </c:forEach>
    </c:forEach>
    </ul>
</nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>                      
    </body>
</html>
