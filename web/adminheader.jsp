<%-- 
    Document   : adminheader
    Created on : 27-Feb-2019, 12:01:08
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbDate"%>
<%
    DbUse dbSelect = new DbUse();
    DbDate cdate = new DbDate();
    String usrEmail = session.getAttribute("uemail").toString();
    String currDate = cdate.currentDate();
    //out.print(currDate);
    ResultSet currResult = dbSelect.OrderDetailByDate(currDate);
    Integer currCount = dbSelect.TodayOrderCount(currDate);
    //out.print(currCount);
    Integer fb = dbSelect.FeedbackCount();
    //out.print(fb);
%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/fontawesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Lobster|Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Pacifico|Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <script src="frontend/bootstrap/js/jquery.min.js"></script>
        <script src="frontend/bootstrap/js/bootstrap.min.js"></script>
        <title>Spicebox</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-static-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <img src="frontend/image/spice3.jpg" width="196" height="100" class="logo">
                        <h4 class="logo_name">SpiceBox</h4>
                    </div>
                    <ul class="nav navbar-nav navbar-right position-two">
                        <li><a href="adminaddcategory.jsp"><i class="fa fa-list">Category</i></a></li>
                        <li><a href="admindisplayfoodmenu.jsp"><i class="fa fa-cutlery"> Food Menu</i></a></li>
                        <li><a href="#" data-toggle="dropdown"><i class="fa fa-book"> Order</i>
                                <b class="notify">
                                   <% if (currCount > 0) {%>
                                            [<%=currCount%>]
                                            <%
                                                }
                                            %>
                                </b>
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu edit-position">
                                <li><a href="admindisplayorder.jsp">Today's Orders</a></li>
                                <li><a href="adminsearchorder.jsp">Search Orders</a></li>
                            </ul>
                        </li>
                        <li><a href="admindisplayfeedback.jsp"><i class="fa fa-comment"> Feedback</i>
                            <b class="notify">
                                   <% if (fb > 0) {%>
                                            [<%=fb%>]
                                            <%
                                                }
                                            %>
                                </b>
                            </a></li>
                        <!--<li><a data-toggle="dropdown"><i class="fa fa-comments"> Feedback</i><span class="caret"></span></a>
                            <ul class="dropdown-menu edit-position">
                                <li><a href="admindisplayfeedback.jsp">Feedbacks</a>
                                <li class="dropdown-submenu">
                                    <a class="test" tabindex="-1" href="admindisplayfeedback.jsp">Feedbacks<span class="caret"></span></a>
                                    <ul class="dropdown-menu second-position">
                                        <li><a tabindex="-1" href="#">Today's Feedback</a></li>
                                        <li><a tabindex="-1" href="#">Total</a></li>
                                    </ul>
                                </li>
                                <li><a href="admindisplayallreply.jsp">Replies</a></li>
                            </ul>
                        </li>-->
                        <li><a href="admindisplayusers.jsp"><i class="fa fa-users"> Users </i></a></li>
                        <li class="dropdown-thin">
                            
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><h6><%= dbSelect.GetUserNameFromEmail(usrEmail)%> </h6><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="logout.jsp">Sign Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>  
            <h2 class="first-header text-center">An Easy And Convenient Way of Ordering Food</h2>
        </header>
        <script type="text/javascript">
            $(window).scroll(function () {
                $('nav').toggleClass('scrolled', $(this).scrollTop() > 20);
            });


            $(document).ready(function () {
                $('.dropdown-submenu a.test').on("click", function (e) {
                    $(this).next('ul').toggle();
                    e.stopPropagation();
                    e.preventDefault();
                });
            });
        </script>
