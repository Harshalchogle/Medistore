<%-- 
    Document   : Register
    Created on : 13 Jan, 2020, 7:04:29 PM
    Author     : harshal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="font awesome/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <style>
            #content{margin: 0 auto;}
            span{color:red}
        </style>
    </head>
    <body>
            <jsp:include page="header.jsp"/>
            
                <div id="site_content">
            <div class="container">
                <div class="row">
                    <jsp:include page="aside.jsp"/>
                    <div class="col-sm-9" id="content">         
                        <div class="breadcrumbs">
                            <a href="home.html"><i class="fa fa-home"></i></a>
                            <a href="Register.jsp">Register</a>
                        </div>
                        <h1>My Account Information</h1>
                        <p> <small><strong class="define_note"></strong></small>If you already have an account with us, please login at the 
                            <a href="Login.jsp">login page</a>.</p>
                        <form  action="RegisterServlet" method="post">`
                            <div class="contentText">  
                                <fieldset id="account">
                                    <h1>Your Personal Details</h1>
                                    <div style="display: none;" class="form-group required">
                                        <label class="col-sm-2 control-label">Customer Group</label>
                                        <div class="col-sm-10">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" checked="checked" value="1" name="customer_group_id">
                                                    Default</label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Register Code Starts Here-->
                                    
                                    <div class="form-group required">
                                        
                                        <label for="input-firstname" class="col-sm-2 control-label">First Name <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-firstname" placeholder="First Name"  name="firstname"  maxlength="16" required="true"minlength="3">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-lastname" class="col-sm-2 control-label">Last Name <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-lastname" placeholder="Last Name"  name="lastname"  maxlength="16" required="true"minlength="3">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-email" class="col-sm-2 control-label">E-Mail <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="input-email" placeholder="E-Mail"  name="email" >
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-telephone" class="col-sm-2 control-label">Telephone <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="tel" class="form-control" id="input-telephone" placeholder="Telephone"  name="telephone" required="true" pattern="[789][0-9]{9}">
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset id="address">
                                    <h1>Your Address</h1>
                                   
                                    <div class="form-group required">
                                        <label for="input-address-1" class="col-sm-2 control-label">Address 1 <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-1" placeholder="Address 1"  name="address_1" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="input-address-2" class="col-sm-2 control-label">Address 2 <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-2" placeholder="Address 2"  name="address_2" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-city" class="col-sm-2 control-label">City <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-city" placeholder="City"  name="city" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Post Code <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" placeholder="Post Code" name="postcode" required="true">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-country" class="col-sm-2 control-label">Country <span>*</span></label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="country" name="country_id" required="true">
                                                <option>India</option>
                                            </select> 
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-zone" class="col-sm-2 control-label">Region / State <span>*</span></label>
                                        <div class="col-sm-10">
                                            <select class="form-control" id="state" name="zone_id" required="true">
                                                <option>Aberdeen</option>
                                                <option>Aberdeenshire</option>
                                                <option>Anglesey</option>
                                                <option>Angus</option>
                                                <option>Argyll and Bute</option>
                                                <option>Bedfordshire</option>
                                            </select>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h1>Your Password</h1>
                                    <div class="form-group required">
                                        <label for="input-password" class="col-sm-2 control-label">Password <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="input-password" placeholder="Password"  name="password" required="true" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-confirm" class="col-sm-2 control-label">Password Confirm <span>*</span></label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="input-confirm" placeholder="Password Confirm" name="confirm" required="true" >
                                        </div>
                                    </div>
                                </fieldset>                               
                                <div class="buttons">
                                    <div class="pull-right">I have read and agree to the <a class="agree" href="Privacy.jsp"><b>Privacy Policy</b></a>                                                        <input type="checkbox" value="1" name="agree">
                                        &nbsp;
                                        <input type="submit" class="btn btn-primary reg_button" value="Continue" id="btnSubmit" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="js/password.js" type="text/javascript"></script>
    </body>`
</html>
