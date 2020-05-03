<%-- 
    Document   : Myaccount
    Created on : 16 Jan, 2020, 6:42:29 PM
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
            <sql:query dataSource="${con}" var="data">
                select * from userdata where userid=?
                <sql:param>${user.userid}</sql:param>
            </sql:query>
        <div id="site_content">
            <div class="container">
                <div class="row">
                    <jsp:include page="aside.jsp"/>
                    <div class="col-sm-9" id="content">  
                        <div class="breadcrumbs">
                            <a href="home.jsp"><i class="fa fa-home"></i></a>
                            <a href="Myaccount.jsp">Account</a>
                        </div>
                        <h1>My Account Information</h1>
                            <div class="contentText">  
                                <fieldset id="account">
                                    <h1>Personal Details</h1>
                                    <div style="display: none;" class="form-group required">
                                        <label class="col-sm-2 control-label">Customer Group</label>
                                        <div class="col-sm-10">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" checked="checked" value="1" name="customer_group_id">
                                                    Default
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                <c:forEach items="${data.rows}" var="row">
                                    <div class="form-group required">   
                                        <label for="input-firstname" class="col-sm-2 control-label">First Name</label>  
                                        <div class="col-sm-10">                                                                                       
                                            <input type="text" class="form-control" value="${row.First_Name}" id="input-firstname" disabled="true"/>                                            
                                        </div>                                        
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-lastname" class="col-sm-2 control-label">Last Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-lastname" value="${row.Last_Name}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-email" class="col-sm-2 control-label">E-Mail</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="input-email" value="${row.Email}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-telephone" class="col-sm-2 control-label">Telephone</label>
                                        <div class="col-sm-10">
                                            <input type="tel" class="form-control" id="input-telephone" value="${row.Telephone}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="input-fax" class="col-sm-2 control-label">Fax</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-fax" value="${row.Fax}" disabled="true"/>
                                        </div>
                                    </div>
                                    </fieldset>
                                    <fieldset id="address">
                                    <h1>Your Address</h1>
                                    
                                    <div class="form-group required">
                                        <label for="input-address-1" class="col-sm-2 control-label">Address 1</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-1" value="${row.Add1}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="input-address-2" class="col-sm-2 control-label">Address 2</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-address-2" value="${row.Add2}" disabled="true"/> 
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-city" class="col-sm-2 control-label">City</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-city" value="${row.City}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Post Code</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" value="${row.PostCode}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Country</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" value="${row.Country}" disabled="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="input-postcode" class="col-sm-2 control-label">Region</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="input-postcode" value="${row.Region}" disabled="true">
                                        </div>
                                       </c:forEach>
                                    </div>
                                    </fieldset>
                                    </div>
                                </div>  
                            </div>
                    </div>
                </div>
                    <jsp:include page="footer.jsp"/>
    </body>
</html>
