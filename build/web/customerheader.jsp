<%-- 
    Document   : customerheader
    Created on : 27-Feb-2019, 12:11:09
    Author     : Bishnu
--%>

<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DbUse dbViews = new DbUse();
    String usrEmail = session.getAttribute("uemail").toString();
    Integer order = (Integer)session.getAttribute("orderNo");
    Integer orderCount = dbViews.CountOrderDetailByOrderId(String.valueOf(order));
%>

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
                        <li><a href="customerhome.jsp"><i class="fa fa-home" aria-hidden="true"> Home</i></a></li>
                        <li><a href="customerdisplaycategory.jsp"><i class="fa fa-cutlery" aria-hidden="true"> Food Menu</i></a></li>
                        <li><a href="cartdetail.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"> Cart</i>
                            <b class="notify">
                                   <% if (orderCount > 0) {%>
                                            [<%=orderCount%>]
                                            <%
                                                }
                                            %>
                                </b>
                            </a></li>
                        <li><a href="customeraddfeedback.jsp"><i class="fa fa-comment" aria-hidden="true"> Feedback</i></a></li>
                        <li><a href="customerguide.jsp"><i class="fa fa-question-circle" aria-hidden="true"> System Guide</i></a></li>
                        <li class="dropdown-thin">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><h6><%= dbViews.GetUserNameFromEmail(usrEmail)%> </h6><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="customerdisplayprofile.jsp">Profile</a></li>
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
            
            function myCall() {
                document.getElementById("myList").classList.toggle("show");
            }

$(document).ready(function () {
                $('.dropdown-submenu a.test').on("click", function (e) {
                    $(this).next('ul').toggle();
                    e.stopPropagation();
                    e.preventDefault();
                });
            });
        </script>
