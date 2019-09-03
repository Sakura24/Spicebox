<%-- 
    Document   : register
    Created on : 27-Feb-2019, 12:19:04
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
        <title>Register</title>
    </head>
    <body>
        <section class="register-box">
            <h3 class="register-header">REGISTER</h3>
            <hr>
            <form method="post" action="/spicebox/RegisterNow">
                <div class="container login-main">
                    <div class="row">
                        <div class="col-sm-6">
                            <label><i class="fa fa-user"></i> First Name:</label>
                            <br>
                            <input type="text" class="form-control-lg register-input" placeholder="Enter First Name" name="first_name"> 
                            <br>
                        </div>
                        <div class="col-sm-6">
                            <label><i class="fa fa-user"></i> Last Name:</label>
                            <br>
                            <input type="text" class="form-control-lg register-input" placeholder="Enter Last Name" name="last_name"> 
                            <br>
                        </div>
                        <div class="col-sm-6">
                            <label><i class="fa fa-building"></i> Address:</label>
                            <br>
                            <input type="text" class="form-control-lg register-input" placeholder="Enter Address" name="address"> 
                            <br>
                        </div>
                        <div class="col-sm-6">
                            <label><i class="fa fa-phone"></i> Contact Number:</label>
                            <br>
                            <input type="text" class="form-control-lg register-input" placeholder="Enter Contact Number" name="contact_no"> 
                            <br>
                        </div>
                        <div class="col-sm-6">
                            <label><i class="fa fa-envelope"></i> Email Address:</label>
                            <br>
                            <input type="text" class="form-control-lg register-input" placeholder="Enter Email Address" name="email"> 
                            <br>
                        </div>
                        <div class="col-sm-6">
                            <label><i class="fa fa-unlock"></i> Password:</label>
                            <br>
                            <input type="password" id="password" class="form-control-lg register-input" placeholder="Enter Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required> 
                            <br>
                        </div>
                    </div>
                </div>
                <input type="submit" value="Register" class="btn btn-primary login-button" onclick="myAddMessage()">
            </form>
            <script>
                    function myAddMessage() {
                        alert("Register Successfull!!");
                    }
                </script>
            <h3 class="login">Already have an account? <a href="login.jsp" class="register-link">Login</a></h3>
        </section>
            <div id="msg">
                <h3>Password must contain the following:</h3>
                <p id="pass-letter" class="invalid">A <b>lowercase</b> letter</p>
                <p id="pass-capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                <p id="pass-number" class="invalid">A <b>number</b></p>
                <p id="pass-length" class="invalid">Minimum <b>8 characters</b></p>
            </div>
            <script>
                var myInput = document.getElementById("password");
                var letter = document.getElementById("pass-letter");
                var capital = document.getElementById("pass-capital");
                var number = document.getElementById("pass-number");
                var length = document.getElementById("pass-length");

// When the user clicks on the password field, show the message box
                myInput.onfocus = function () {
                    document.getElementById("msg").style.display = "block";
                }

// When the user clicks outside of the password field, hide the message box
                myInput.onblur = function () {
                    document.getElementById("msg").style.display = "none";
                }

// When the user starts to type something inside the password field
                myInput.onkeyup = function () {
                    // Validate lowercase letters
                    var lowerCaseLetters = /[a-z]/g;
                    if (myInput.value.match(lowerCaseLetters)) {
                        letter.classList.remove("invalid");
                        letter.classList.add("valid");
                    } else {
                        letter.classList.remove("valid");
                        letter.classList.add("invalid");
                    }

                    // Validate capital letters
                    var upperCaseLetters = /[A-Z]/g;
                    if (myInput.value.match(upperCaseLetters)) {
                        capital.classList.remove("invalid");
                        capital.classList.add("valid");
                    } else {
                        capital.classList.remove("valid");
                        capital.classList.add("invalid");
                    }

                    // Validate numbers
                    var numbers = /[0-9]/g;
                    if (myInput.value.match(numbers)) {
                        number.classList.remove("invalid");
                        number.classList.add("valid");
                    } else {
                        number.classList.remove("valid");
                        number.classList.add("invalid");
                    }

                    // Validate length
                    if (myInput.value.length >= 8) {
                        length.classList.remove("invalid");
                        length.classList.add("valid");
                    } else {
                        
                        length.classList.remove("valid");
                        length.classList.add("invalid");
                    }
                }
            </script>
            
    </body>
</html>

