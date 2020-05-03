package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            session.removeAttribute("user");
            session.invalidate();
        
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            <div id=\"site_content\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "aside.jsp", out, false);
      out.write("\n");
      out.write("            <div class=\"col-sm-9\" id=\"content\">            \n");
      out.write("                        <div class=\"breadcrumbs\">\n");
      out.write("                            <a href=\"home.jsp\"><i class=\"fa fa-home\"></i></a>\n");
      out.write("                            <a href=\"Login.jsp\">Login</a>\n");
      out.write("                        </div>                \n");
      out.write("                        <div class=\"contentText\">\n");
      out.write("                            <h1>Welcome, Please Sign In</h1>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-6\">\n");
      out.write("                                    <!--<div class=\"well\">!-->\n");
      out.write("                                    <h2>New Customer</h2>\n");
      out.write("                                    <p>I am a new customer.</p>\n");
      out.write("                                    <p>By creating an account at steroid-shop.to you will be able to shop faster, be up to date on an orders status,\n");
      out.write("                                        and keep track of the orders you have previously made.</p>\n");
      out.write("                                    <a class=\"btn btn-primary reg_button\" href=\"Register.jsp\">\n");
      out.write("                                        <i class=\"fa fa-caret-right\"></i>&nbsp;\n");
      out.write("                                        Continue\n");
      out.write("                                    </a>\n");
      out.write("                                    <!--</div>!-->\n");
      out.write("                                </div>\n");
      out.write("                                <div style=\"border-left: 1px dashed #c1bebe\" class=\"col-sm-6\">\n");
      out.write("                                    <!--<div class=\"well\">!-->\n");
      out.write("                                    <h2>Returning Customer</h2>\n");
      out.write("                                    <p>I am a returning customer</p>\n");
      out.write("                                    <form  class=\"form-horizontal add_margin\" action=\"LoginServlet\" method=\"post\">\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"input-email\" class=\"control-label col-sm-4\">E-Mail Address</label>\n");
      out.write("                                            <div class=\"col-sm-8\">\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" id=\"input-email\" placeholder=\"E-Mail Address\" value=\"\" name=\"email\">\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"input-password\" class=\"control-label col-sm-4\">Password</label>\n");
      out.write("                                            <div class=\"col-sm-8\">\n");
      out.write("                                                <input type=\"password\" class=\"form-control\" id=\"input-password\" placeholder=\"Password\" value=\"\" name=\"password\">\n");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                        <p class=\"cat_name\"> <a href=\"Email.jsp\">Forgot Passowrd? Click here.</a></p>\n");
      out.write("                                        <!--<input type=\"submit\" value=\"Login\" class=\"btn btn-primary reg_button\" />!-->\n");
      out.write("                                        <button class=\"btn btn-primary reg_button\" value=\"Login\" type=\"submit\">\n");
      out.write("                                            <i class=\"fa fa-key\"></i>&nbsp;\n");
      out.write("                                            Login                            \n");
      out.write("                                        </button>\n");
      out.write("                                    </form>\n");
      out.write("                                    <!--</div>!-->\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            </div>            \n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("  \n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
