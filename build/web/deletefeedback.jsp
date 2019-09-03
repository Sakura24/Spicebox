<%-- 
    Document   : deletefeedback
    Created on : 21-Apr-2019, 11:03:04
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    String ticketId = request.getParameter("ticketId").trim();
    //out.print(ticketId);
    ResultSet result = dbUse.FeedbackDisplayById(request.getParameter("ticketId"));
    result.first();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <div class="container">
        <div  class="delete-text">
        <h3> Do you really want to delete the respective food item?</h3>
        <h4><a href='/spicebox/DeleteFeedback?&ticketId=<%= ticketId%>' class="option"><i><u>Yes</u></i></a></h4>
        <h4><a href="customerdisplayfeedback.jsp" class="option"><i><u>No</u></i></a></h4>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
