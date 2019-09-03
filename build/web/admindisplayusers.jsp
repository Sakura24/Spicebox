<%-- 
    Document   : admindisplayusers
    Created on : 27-Feb-2019, 12:03:58
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page import="ejbs.DbInt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet userResult = dbUse.UsersDisplay();
    ResultSet passwordResult = dbUse.DecryptPassword();
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Users
</h3>
<div class="container-fluid food-display-table form-setting">
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">First Name</th>
                <th class="table-heading">Last Name </th>
                <th class="table-heading">Address</th>
                <th class="table-heading">Contact Number</th>
                <th class="table-heading">Email</th>
                <th class="table-heading">Password</th>
                <th class="table-heading">Process</th>
            </tr>
            <%
                try {
                    while (userResult.next() && passwordResult.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= userResult.getString(2)%></td>
                <td><%= userResult.getString(3)%></td>
                <td><%= userResult.getString(4)%></td>
                <td><%= userResult.getString(5)%></td>
                <td><%= userResult.getString(6)%></td>
                <td><%= passwordResult.getString(1)%></td>  
                <td><a href='updateuser.jsp?&UserId=<%= userResult.getString(1)%>' > Edit</a>
            </tr>
            <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>
        </table>
    </div>
</div>
</section>
<%@include file="footer.jsp" %>

