<%-- 
    Document   : Disclaimer
    Created on : 22 Feb, 2020, 11:50:41 PM
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
                    <jsp:include page="HomeAside.jsp"/> 
                    <div class="col-md-9 col-sm-8 col-xs-12 right_sidebar1">
                        <div id="right_part">
                            <div class="contentContainer">
                                <div class="breadcrumbs">
                                    <a href="home.jsp" class="headerNavigation"><i class="fa fa-home"></i></a>
                                    <a href="Disclaimer.jsp">Disclaimer</a>
                                </div>
                                <h3><strong>Disclaimer</strong></h3>
                                    <p>To the maximum extent permitted by applicable law, we exclude all 
                                        representations, warranties, and conditions relating to our website and the use 
                                        of this website.
                                        Nothing in this disclaimer will:</p>
                                    <ul>
                                        <li>limit or exclude our or your liability for death or personal injury;</li>
                                        <li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
                                        <li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>
                                        <li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>
                                    </ul>
                                    <p>The limitations and prohibitions of liability set in this Section and elsewhere 
                                        in this disclaimer: (a) are subject to the preceding paragraph; and (b) 
                                        govern all liabilities arising under the disclaimer, including liabilities 
                                        arising in contract, in tort and for breach of statutory duty.</p>
                                    <p>As long as the website and the information and services on the website are 
                                        provided free of charge, we will not be liable for any loss or damage of any nature.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
                    <jsp:include page="footer.jsp"/>
    </body>
</html>
