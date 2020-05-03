<%-- 
    Document   : View Contact
    Created on : 23 Feb, 2020, 1:40:42 AM
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
        select * from contact 
    </sql:query>
        <jsp:include page="header.jsp"/>
    <div id="site_content">
             <div class="container">
            <div class="row">
                <%--<jsp:include page="aside.jsp"/>--%>
                <center>
                    <h1 class="h1">Messages</h1>
                    <table class="table" border="1">  
                        <tr>
                        <th>Contact Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        </tr>
                        <c:forEach items="${data.rows}" var="row">
                        <tr>
                            <td>${row.Contact_Id}</td>
                            <td>${row.name}</td>
                            <td>${row.email}</td>
                            <td>${row.message}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </center>
            </div>
             </div>
    </div>
        
    </body>
</html>
