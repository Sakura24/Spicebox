<%-- 
    Document   : updateuser
    Created on : 07-Mar-2019, 15:01:49
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DbUse dbFunction = new DbUse();
    String user_id = request.getParameter("UserId").trim();
    ResultSet result = dbFunction.UserDetailById(Integer.valueOf(request.getParameter("UserId")));
    result.first();
    ResultSet password = dbFunction.DecryptPasswordById(Integer.valueOf(request.getParameter("UserId")));
    password.first();

%>

<%@include file="adminheader.jsp" %>
<section class="information">
    <h3 class="heading-three text-center">
        Edit User Profile
    </h3>
    <div class="container-fluid food-display-table">
        <div class="form-content">
            <form method="post" action="/spicebox/UpdateUser">
                <div class="row">
                    <div class="col-sm-6">
                        <label>First Name:</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= result.getString(2)%>" name="first_name"> 
                    </div>
                    <div class="col-sm-6">
                        <label>Last Name:</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= result.getString(3)%>" name="last_name"> 
                    </div>
                    <div class="col-sm-6">
                        <label>Address:</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= result.getString(4)%>" name="address">
                    </div>
                    <div class="col-sm-6">
                        <label>Contact No</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= result.getString(5)%>" name="contact_no">
                    </div>
                    <div class="col-sm-6">
                        <label>Email:</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= result.getString(6)%>" name="email">
                    </div>
                    <div class="col-sm-6">
                        <label>Password:</label>
                        <input type="text" class="form-control input-lg input-type" value="<%= password.getString(1)%>" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                    </div>
                </div>
                <input type="hidden" value="<%=user_id%>" name="UserId"/>
                <br>
                <input type="submit" value="Edit" class="btn btn-primary add-button" onclick="myAddMessage()">
            </form>
                <script>
                    function myAddMessage() {
                        alert("User Details Successfully Updated!");
                    }
                </script>
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
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
