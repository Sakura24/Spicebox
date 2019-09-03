package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/websiteinfo.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

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

      out.write('\n');
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
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<section class=\"details\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12\">\n");
      out.write("                        <h3 class=\"text-center heading-one \">About Us</h3>      \n");
      out.write("                        <p class=\"about_us text-justify\">The advancement of technology in today’s world has become so massive that very simple thing has been digitalised. \n");
      out.write("                            With the advancement of information technology and internet, business processes and communication between companies and their employees and customers have been greatly enhanced of which the food industry is not left out. \n");
      out.write("                            Online food ordering systems have become an important part of the food industry as well as for the people.\n");
      out.write("                            SpiceBox is a website for the online order of food teams for our customer.\n");
      out.write("                            SpiceBox is user-friendly, easy to use and understand, eye-friendly and steps are listed for using this website to order food items.\n");
      out.write("                            By using the SpiceBox, our customer can easily and quickly order specific amount of food items.\n");
      out.write("                            By login into our restautant's website, the customer can order food, track the location of our food and even give us feedback or complaint.\n");
      out.write("                            By using this website, out customers will have a unique and wonderful experience.\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>   \n");
      out.write("        <section class=\"instruction\">\n");
      out.write("            <div class=\"container steps\">\n");
      out.write("                <!--<div class=\"row\">-->\n");
      out.write("                    <!--<div class=\"col-sm-12-->\n");
      out.write("                        <h3 class=\"heading- text-center\">Steps For Ordering</h3>\n");
      out.write("                        <p class=\"steps-number\">This is a guide for using our website.</p>\n");
      out.write("                        <p class=\"steps-number\">1.Log into our website by clicking on the login link.</p>\n");
      out.write("                        <p class=\"steps-number\">2.If you do not have an account, then sign into our account using the other options in the login link.</p>\n");
      out.write("                        <p class=\"steps-number\">3.After logging into our website, list of food items with thei descriptions and prices per piece will be displayed.</p>\n");
      out.write("                        <p class=\"steps-number\">4.You can order any amount of food item.</p>\n");
      out.write("                        <p class=\"steps-number\">5.If you have any feedbacks about our order process or our food,then please click on the ticket link and give your feed back.</p>\n");
      out.write("                        <p class=\"steps-number\">Thank you.</p>\n");
      out.write("                        <button type=\"button\" class=\"btn btn-danger order-btn\">Order Now</button>\n");
      out.write("                    <!--</div>-->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <section class=\"cuisine\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h3 class=\"text-center heading-one\">Cuisine</h3>      \n");
      out.write("                <div class=\"row image-holder\">\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/momo.jpg\" alt=\"Newari Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Newari Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/khaja.jpg\" alt=\"Nepali Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Nepali Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/burger.jpg\" alt=\"American Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">American Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/pizza.jpg\" alt=\"Italian Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Italian Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/sushi.jpg\" alt=\"Japanese Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Japanese Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/kimchi.jpg\" alt=\"Korean Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Korean Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"image-column\">\n");
      out.write("                        <img src=\"frontend/image/mex.jpg\" alt=\"Mexican Cuisine\" class=\"image-size\">\n");
      out.write("                        <h4 class=\"cuisine-name text-center\">Mexican Cuisine</h4>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <section class=\"additional\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row further-detail\">\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <i class=\"fa fa-building font-width\"></i>\n");
      out.write("                                <h4>Address</h4>\n");
      out.write("                                <p class=\"font\">Lazimpat, 02-Kathmandu<p>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <i class=\"fa fa-ticket  font-width\"></i>\n");
      out.write("                                <h4>Ticket</h4>\n");
      out.write("                                <p class=\"font\">Appreciation, Complaint<p>\n");
      out.write("                                    <a href=\"#\" class=\"link\">Click Here</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <h4 class=\"font-color\">Share</h4>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li>\n");
      out.write("                                                <img src=\"frontend/image/fb.png\" class=\"share-icon\">\n");
      out.write("                                                <h5>Facebook</h5>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li>\n");
      out.write("                                                <img src=\"frontend/image/insta.jpg\" class=\"share-icon\">\n");
      out.write("                                                <h5>Instagram</h5>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li>\n");
      out.write("                                                <img src=\"frontend/image/twit.png\" class=\"share-icon\">\n");
      out.write("                                                <h5>Twitter</h5>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <ul>\n");
      out.write("                                            <li>\n");
      out.write("                                                <img src=\"frontend/image/gp.jpg\" class=\"share-icon\">\n");
      out.write("                                                <h5>Google+</h5>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"opening\" style=\"margin-left: -5%;\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li>\n");
      out.write("                            <i class=\"fa fa-clock  font-width\"></i>\n");
      out.write("                            <h4>Opening Time</h4>\n");
      out.write("                            <p class=\"font\">10:00AM-10:00PM<p>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<footer class=\"footer\">\n");
      out.write("            <div class=\"row footer-row\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <h4 class=\"size\">\n");
      out.write("                        Terms of usage and privacy policy\n");
      out.write("                    </h4>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <h4 class=\"size\">\n");
      out.write("                        Copyright@2019 | Online Food Delivery Service | SpiceBox | All Right Reserve\n");
      out.write("                    </h4>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
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
