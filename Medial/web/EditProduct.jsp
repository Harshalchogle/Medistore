<%-- 
    Document   : EditProduct
    Created on : 23 Jan, 2020, 8:39:12 PM
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
            select * from products where Product_Id=?
            <sql:param>${param.Product_Id}</sql:param>
        </sql:query>
        <jsp:include page="header.jsp"/>
        <center>
       <h1>Edit Product Here</h1>
        <form action="EditProduct" method="post" enctype="multipart/form-data"> 
            <table>
                <c:forEach items="${data.rows}" var="row">
                    <tr>   
                        <td><input type="hidden" name="Pid" class="form-control" value="${row.Product_Id}"></td>
                </tr>
                <tr>
                    <td>Enter Product Code:</td>
                    <td><input type="text" name="PCode" class="form-control" value="${row.Product_code}"></td>
                </tr>
                <tr>
                    <td>Enter Product Name:</td>
                    <td><input type="text" name="PName" class="form-control" value="${row.Product_Name}"></td>
                </tr>
                <tr>
                    <td>Enter Company name:</td>
                    <td><input type="text" name="Company" class="form-control" value="${row.Company_Name}"></td>
                </tr>
                <tr>
                    <td>Enter Description:</td>
                    <td><input type="text" name="Pdescription" class="form-control" value="${row.Description}"></td>
                </tr>
                <tr>
                    <td>Enter Detailed Description:</td>
                    <td><textarea name="Pdescription2" class="form-control" rows="4" cols="40" >${row.Description2}</textarea></td>
                </tr>
                <tr>
                    <td>Enter Price:</td>
                    <td><input type="number" name="PPrice" class="form-control" value="${row.Price}"></td>
                </tr>
                <tr>
                    <td>Category</td>
                <td><select class="form-control" name="category" value="${row.Category}">
                    <option>Ayurvedic Products</option>
                    <option>Today Products</option>
                    <option>Baby Care Products</option>
                    <option>Body Care Products</option>
                    <option>Eye Care Products</option>
                    <option>Health Care Products</option>
                    <option>Normal Products</option>
                    <option>Nutrition Products</option>
                    <option>Special Products</option>
                    <option>Devices</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Enter Quantity:</td>
                    <td><input type="number" name="PQuantity" class="form-control" value="${row.Quantity}"></td>
                </tr>
                <tr>
                    <td>Add Photo:</td>                    
                    <td><input type="file" name="PPhoto" accept="image/*" multiple="true" class="form-control"></td>                   
                </tr>
                <tr>
                    <td><input type="submit" value="Update Product" class="btn btn-primary"></td>
                    <td><input type="reset" Value="Reset" class="btn  btn-dark"></td>
                </tr>
                </c:forEach>
            </table>
        </form>
        </center>
    </body>
</html>
