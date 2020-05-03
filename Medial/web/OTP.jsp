<%-- 
    Document   : OTP
    Created on : 26 Jan, 2020, 12:12:59 AM
    Author     : acer
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
                    <center>
        <h1>OTP</h1>
        <form action="Checkotp" method="post"> 
            <table>
                <tr>
                    <td>Enter OTP:</td>
                    <td><input type="number" name="otp" class="form-control"></td>
                </tr>
                 <tr>
                    <td><input type="submit" value="Valid OTP" class="btn btn-primary"></td>
                    <td><input type="reset" Value="Reset" class="btn  btn-dark"></td>
                </tr>
            </table>
        </form>
                    </center>
                </div>
            </div>
    </body>
</html>
