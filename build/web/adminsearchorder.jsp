<%-- 
    Document   : adminsearchorder
    Created on : 20-Mar-2019, 14:37:00
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    DbDate date = new DbDate();
    String monthDate = date.addedDate();
    String currentDate = date.currentDate();
    
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    List For One Month's Order
</h3>
    <hr>
    <div class="container-fluid food-display-table">
        <div class="container infomation-box">
            <form method="post" action="adminordersearchresult.jsp">
            <label>Start Date: </label><br>
            <input type="date" name="monthDate" class="form-control input-lg" value="<%=monthDate %>" required>
            <label>Current Date: </label>
            <input type="date" name="currentDate" class="form-control input-lg" value="<%=currentDate %>" required>
            <input type="submit" value="Search" class="btn btn-default search-btn">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>