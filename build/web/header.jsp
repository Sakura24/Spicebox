<%-- 
    Document   : header
    Created on : 20-Apr-2019, 15:49:53
    Author     : Bishnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SpiceBox</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/fontawesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Lobster|Montserrat:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Pacifico|Roboto:400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <script src="frontend/bootstrap/js/jquery.min.js"></script>
        <script src="frontend/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-static-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <img src="frontend/image/spice3.jpg" width="196" height="100" class="logo">
                        <h4 class="logo_name">SpiceBox</h4>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menubar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                    </div>
                        <ul class="nav navbar-nav navbar-right position">
                            <li><a href="index.jsp"><i class="fa fa-home"> Home</i></a></li>
                            <li><a href="displayfood.jsp"><i class="fa fa-cutlery"> Food Menu</i></a></li>
                            <li><a href="login.jsp"><i class="fa fa-book"> Order</i></a></li>
                            <li><a href="login.jsp"><i class="fa fa-comment"> Feedback</i></a></li>
                            <li><a href="login.jsp"><i class="fa fa-user"> Login </i></a></li>
                        </ul>
                    </div>
                </div>
            </nav>  
            <h2 class="first-header text-center">An Easy And Convenient Way of Ordering Food</h2>
        </header>
       