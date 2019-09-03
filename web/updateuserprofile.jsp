<%-- 
    Document   : updateuserprofile
    Created on : 11-Mar-2019, 12:08:08
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="customerheader.jsp" %>

<%
    DbUse dbFunction = new DbUse();
    String uemail = request.getParameter("uemail").trim();
    ResultSet result = dbFunction.UserDetailByEmail(request.getParameter("uemail"));
    String userId = request.getParameter("userId").trim();
    out.print(userId);
    ResultSet password = dbFunction.DecryptPasswordByEmail(uemail);
    result.first();
    password.first();
%>

<section class="information">
<h3 class="heading-three ">
    Edit Your Profile
</h3>
<div class="container-fluid food-display-table">
        <div class="form-content">
            <form method="post" action="/spicebox/UpdateProfile?&uemail=<%=uemail%>&userId=<%=userId%>">
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
                        <input type="text" class="form-control input-lg input-type" value="<%= password.getString(1)%>" name="password">
                    </div>
                </div>
                <input type="submit" value="Edit" class="btn btn-primary add-button">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
