<%-- 
    Document   : Email
    Created on : 26 Jan, 2020, 2:55:40 AM
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
        <Center>
            <h1>Send OTP</h1>
            <form action="SendOTP" method="post">
            <table>
                <tr>
                    <td>Enter Email</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td><input type="submit" class="btn btn-primary reg_button" value="Send OTP"/></td>&nbsp;&nbsp;&nbsp;   
                    <td><input type="reset" class="btn btn-danger" value="Reset"/></td>
                </tr>
            </table>
        </form>
        </center>
    </body>
</html>
