<%-- 
    Document   : view
    Created on : 20 Jan, 2020, 10:15:22 PM
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
        <jsp:include page="header.jsp"/>
        
        
        <sql:setDataSource driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/medical"
                           user="root"
                           password="1234"
                           var="con"/>
        <c:if test="${param.i!=null}">
        <sql:query dataSource="${con}" var="data">
            select * from products limit ${(param.i*10)-(10)} , 10 
        </sql:query>
        </c:if>
            <c:if test="${param.i==null}">
        <sql:query dataSource="${con}" var="data">
            select * from products   limit 10 
        </sql:query>
        </c:if>
            <div id="site_content">
             <div class="container">
            <div class="row">
                <%--<jsp:include page="aside.jsp"/>--%>
                <center>
                    <h1 class="h1">Products</h1>
                    <table class="table" border="1">  
                        <tr>
                        <th>Product Id</th>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Company Name</th>
                        <th>Description</th>
                        <th>Detailed Description</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Quantity</th>
                        <th>Photo</th>
                        <th>Edit|Delete</th>
                        </tr>
                        <c:forEach items="${data.rows}" var="row">
                        <tr>
                            <td>${row.Product_Id}</td>
                            <td>${row.Product_Code}</td>
                            <td>${row.Product_Name}</td>
                            <td>${row.Company_Name}</td>
                            <td>${row.Description}</td>
                            <td>${row.Description2}</td>
                            <td>${row.Price}</td>
                            <td>${row.Category}</td>
                            <td>${row.Quantity}</td>
                            <td><img src="ProductImage?Product_Id=${row.Product_Id}" height="50" width="50">
                            <td><a class="btn btn-primary" href="EditProduct.jsp?Product_Id=${row.Product_Id}">Edit</a> |
                                <a class="btn btn-danger" href="DeleteProduct?Product_Id=${row.Product_Id}">Delete</a></td>
                        </tr>
                        </c:forEach>
                    </table>
                      <nav aria-label="Page navigation example">
  <ul class="pagination pagination-circle pg-blue">
      <sql:query dataSource="${con}" var="data">
          select count(*) as count from products
      </sql:query>
          <c:forEach items="${data.rows}" var="row">
              <c:forEach var="i" begin="1" end="${row.count/10}">
                  <c:if test="${param.i==i}">
                  <li class="page-item active"><a class="page-link" href="view.jsp?i=${i}">${i}</a></li>
                  </c:if>
                  <c:if test="${param.i!=i}">
                  <li class="page-item"><a class="page-link" href="view.jsp?i=${i}">${i}</a></li>
                  </c:if>
              </c:forEach>
    </c:forEach>
    
    
  </ul>
</nav>
                </center>            
            </div>
             </div>
            </div>
    </body>
</html>
