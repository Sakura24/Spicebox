<%-- 
    Document   : login
    Created on : 27-Feb-2019, 12:17:40
    Author     : Bishnu
--%>

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

        <title>Login</title>
    </head>
    <body>
        <section class="first-login-box">
            <ul>
                <li>
                    <i class="fa fa-user icon-size"></i>
                </li>
                <li>
                    <h3 class="login-header">LOGIN</h3>
                </li>
            </ul>
            <hr>

            <form method="post" action="/spicebox/LoginProcess">
                <div class="container login-main">
                    <label><i class="fa fa-envelope login-text"></i> Email Address:</label>
                    <br>
                    <input type="text" class="form-control-lg login-input" placeholder="Enter Email Address" name="email"> 
                    <br>
                    <label><i class="fa fa-unlock"></i> Password:</label>
                    <br>
                    <input type="password" class="form-control-lg login-input" placeholder="Enter Password" name="password"> 
                </div>
                <input type="submit" value="Login" class="btn btn-primary login-button">
            </form>
            <h3 class="register"><a href="register.jsp" class="register-link">Register Now!</a></h3>
        </section>
    </body>
</html>

