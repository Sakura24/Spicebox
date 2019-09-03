<%-- 
    Document   : deletefoodorder
    Created on : 25-Mar-2019, 12:05:25
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    String Od_Id = request.getParameter("Od_Id").trim();
    ResultSet result = dbUse.OrderDetailDisplayByOdId(request.getParameter("Od_Id"));
    result.first();
%>

<section class="information">
    <div class="container">
        <div  class="delete-text">
        <h3> Do you really want to delete the respective food item?</h3>
        <h4><a href='/spicebox/DeleteFoodOrder?&Od_Id=<%= Od_Id%>' class="option"><i><u>Yes</u></i></a></h4>
        <h4><a href="cartdetail.jsp" class="option"><i><u>No</u></i></a></h4>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
