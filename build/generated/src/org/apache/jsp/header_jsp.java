package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>SpiceBox</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"frontend/bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"frontend/bootstrap/css/font-awesome.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"frontend/bootstrap/css/fontawesome.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"frontend/bootstrap/css/styles.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Lobster|Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Pacifico|Roboto:400,400i,500,500i,700,700i,900,900i\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"frontend/bootstrap/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"frontend/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <nav class=\"navbar navbar-fixed-top\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <img src=\"frontend/image/spice3.jpg\" width=\"196\" height=\"100\" class=\"logo\">\n");
      out.write("                        <h4 class=\"logo_name\">SpiceBox</h4>\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#menubar\">\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>                        \n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"collapse navbar-collapse\" id=\"menubar\">\n");
      out.write("                        <ul class=\"nav navbar-nav navbar-right position\">\n");
      out.write("                            <li class=\"active\"><a href=\"index.html\"><i class=\"fa fa-home\"> Home</i></a></li>\n");
      out.write("                            <li><a href=\"#\"><i class=\"fa fa-cutlery\"> Food Menu</i></a></li>\n");
      out.write("                            <li><a href=\"#\"><i class=\"fa fa-book\"> Order</i></a></li>\n");
      out.write("                            <li><a href=\"#\"><i class=\"fa fa-comment\"> Feedback</i></a></li>\n");
      out.write("                            <li><a href=\"login.jsp\"><i class=\"fa fa-user\"> Login </i></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </nav>  \n");
      out.write("            <h2 class=\"first-header text-center\">An Easy And Convenient Way of Ordering Food</h2>\n");
      out.write("        </header>\n");
      out.write("        <!--<script type=\"text/javascript\">\n");
      out.write("            $(function () {\n");
      out.write("                $(document).scroll(function () {\n");
      out.write("                    var $nav = $(\".navbar-fixed-top\");\n");
      out.write("                    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>-->\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            $(window).scroll(function () {\n");
      out.write("                $('nav').toggleClass('scrolled', $(this).scrollTop() > 20);\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
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
