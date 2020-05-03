<%-- 
    Document   : MyPrescription
    Created on : 27 Jan, 2020, 6:33:57 AM
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
        <sql:query dataSource="${con}" var="data">
                select * from prescription where userid=?
                <sql:param>${user.userid}</sql:param>
            </sql:query>
                <jsp:include page="header.jsp"/>
                <div class="container">
                <c:forEach items="${data.rows}" var="row">
                    <div class="image">
                    <img src="PrescriptionPhoto?Presc_Id=${row.Presc_Id}" class="img-responsive" width="200" height="200">
                    </div>
                </c:forEach>
            </div>
            
    </body>
</html>
