<%-- 
    Document   : customerupdateprofile
    Created on : 13-Mar-2019, 17:48:44
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="customerheader.jsp" %>

<%
    DbUse dbFunction = new DbUse();
    ResultSet result = dbFunction.UserDetailByEmail(usrEmail);
    ResultSet password = dbFunction.DecryptPasswordByEmail(usrEmail);
    result.first();
    password.first();
%>


<section class="information">
    <div class="container-fluid food-display-table">
        <h3 class="heading-three text-center">
            View Your Profile
        </h3>
        <div class="button">
        <a href="updateuserprofile.jsp?&uemail=<%= result.getString(6)%>&userId=<%=result.getString(1)%>" class="btn btn-default add-btn" role="button">Edit</a>
        <a href="customerdisplayprofile.jsp" class="btn btn-default display-btn active" role="button">Display</a>
    </div>
        <div class="table-content">
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >
                <div class="row">
                    <div class="col-sm-6 profile_name">
                        <p>First Name: </p>
                        <p>Last Name: </p>
                        <p>Address: </p>
                        <p>Contact Number: </p>
                        <p>Email: </p>
                        <p>Password: </p>
                    </div>
                    <div class="col-sm-6 profile">
                        <p><%=result.getString(2)%></p>
                        <p><%=result.getString(3)%></p>
                        <p><%=result.getString(4)%></p>
                        <p><%=result.getString(5)%></p>
                         <p>Password:<span id="reply">...</span><span id="more_info"><br><br>
                            <%=password.getString(1)%>
                            <br>
                        </span></p>   
                <button onclick="myInfo()" id="myReply">Show</button>

                <script>
                    function myInfo() {
                        var reply = document.getElementById("reply");
                        var moreInfo = document.getElementById("more_info");
                        var textBtn = document.getElementById("myReply");

                        if (reply.style.display === "none") {
                            reply.style.display = "inline";
                            textBtn.innerHTML = "Show";
                            moreInfo.style.display = "none";
                        } else {
                            reply.style.display = "none";
                            textBtn.innerHTML = "Don't Show";
                            moreInfo.style.display = "inline";
                        }
                    }
                </script>
                    </div>
                </div>
                    
            </table>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>