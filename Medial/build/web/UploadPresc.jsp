<%-- 
    Document   : UploadPresc
    Created on : 27 Jan, 2020, 3:47:15 AM
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
                    <jsp:include page="aside.jsp"/>
                    <center>
       <h1>Add Prescription Here</h1>
        <form action="AddPresc" method="post" enctype="multipart/form-data"> 
            <table>
                <tr>
                    <td>Add Photo:</td>
                    
                    <td><input type="file" id="avatar" name="PrPhoto" accept="image/*" multiple="true" class="form-control"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Add Prescription" class="btn btn-primary"></td>
                    <td><input type="reset" Value="Reset" class="btn  btn-dark"></td>
                </tr>
            </table>
            
        </form>
                    </center>
                    <div class="image"><img class="img-responsive" src="record.png" id="preview" width="200" height="200"></a>
                                                </div> 
                
                    
                    	<script>

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#preview').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	$("#avatar").change(function() 
	{
	  readURL(this);
	});
</script>
                </div>
            </div>
        </div>
    </body>
</html>
