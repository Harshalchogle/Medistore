
<%-- 
    Document   : Add Product
    Created on : 20 Jan, 2020, 8:05:32 PM
    Author     : harshal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="site_content">
            <div class="container">
                <div class="row">
                    <jsp:include page="aside.jsp"/>
                    
        <center>
       <h1>Add Product Here</h1>
        <form action="AddProduct" method="post" enctype="multipart/form-data"> 
            <table>
                <tr>
                    <td>Enter Product code:</td>
                    <td><input type="text" name="PCode" class="form-control"></td>
                </tr>
                <tr>
                    <td>Enter Product Name:</td>
                    <td><input type="text" name="PName" class="form-control"></td>
                </tr>
                <tr>
                    <td>Enter Company name:</td>
                    <td><input type="text" name="Company" class="form-control"></td>
                </tr>
                <tr>
                    <td>Enter Short Description:</td>
                    <td><input type="text" name="Pdescription" class="form-control"></td>
                </tr>
                <tr>
                    <td>Enter Detail Description:</td>
                    <td><textarea name="Pdescription2" class="form-control" rows="4" cols="30"></textarea></td>
                </tr>
                <tr>
                    <td>Enter Price:</td>
                    <td><input type="text" name="PPrice" class="form-control"></td>
                </tr>
                <tr>
                    <td>Category</td>
                <td><select class="form-control" name="category">
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
                    <td><input type="number" name="PQuantity" class="form-control"></td>
                </tr>
                <tr>
                    <td>Add Photo:</td>
                    <td><input type="file" name="PPhoto" accept="image/*" multiple="true" class="form-control"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Product" class="btn btn-primary"></td>
                    <td><input type="reset" Value="Reset" class="btn  btn-dark"></td>
                </tr>
            </table>
        </form>
        </center>
                </div>
            </div>
        </div>
    </body>
</html>
