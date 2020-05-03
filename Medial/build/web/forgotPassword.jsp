<%-- 
    Document   : forgotPassword
    Created on : 26 Jan, 2020, 1:40:07 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .myform{margin: 0 auto;}
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container myform">
            <h1>Your Password</h1>
            <form action="ForgotPass" method="post">
                <div class="form-group required">
                    <label for="input-password" class="col-sm-2 control-label">Password <span>*</span></label>
                        <div class="col-sm-10 col-lg-4 col-md-4">
                            <input type="password" class="form-control" id="input-password" placeholder="New Password"  name="password" required="true" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                        </div><br>
                </div>
                <div class="form-group required">
                    <label for="input-confirm" class="col-sm-2 control-label">Password Confirm <span>*</span></label>
                        <div class="col-sm-10 col-lg-4 col-md-4">
                            <input type="password" class="form-control" id="input-confirm" placeholder="Password Confirm" name="confirm" required="true" >
                        </div>
                </div>
            <br><br>
            <input type="submit" class="btn btn-primary reg_button" value="Continue" id="btnSubmit" >
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="js/password.js" type="text/javascript"></script>
    </body>
</html>
