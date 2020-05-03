<%-- 
    Document   : Contact us
    Created on : 19 Jan, 2020, 8:37:55 PM
    Author     : harshal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>.myform{margin: 0 auto}</style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="site_content">
            <div class="container">
                <div class="row">
                    <jsp:include page="aside.jsp"/>             
                        <div class="breadcrumbs">
                            <a href="home.jsp"><i class="fa fa-home"></i></a>
                            <a href="Contact us.jsp">Contact Us</a>
                        </div>
                <div class="well well-sm">  
                    <form class="form-horizontal myform" action="ContactServlet" method="post">
                        <fieldset>
                            <legend class="text-center">Contact us</legend>
                            <!-- Name input-->
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="name">Name</label>
                                    <div class="col-md-9">
                                        <input id="name" name="name" type="text" placeholder="Your name" class="form-control">
                                    </div>
                                </div>
                            <!-- Email input-->
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="email">Your E-mail</label>
                                    <div class="col-md-9">
                                        <input id="email" name="email" type="email" placeholder="Your email" class="form-control">
                                    </div>
                                </div>
                            <!-- Message body -->
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="message">Your message</label>
                                        <div class="col-md-9">
                                            <textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5"></textarea>
                                        </div>
                                </div>
                            <!-- Form actions -->
                                <div class="form-group">
                                    <div class="col-md-12 text-right">
                                        <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                                    </div>
                                </div>
                        </fieldset>
                    </form>
                </div>
            </div>        
            </div>
                   <jsp:include page="footer.jsp"/>     
        </div>
</body>
</html>
