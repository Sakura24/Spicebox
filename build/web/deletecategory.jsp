<%-- 
    Document   : deletecategory
    Created on : 21-Apr-2019, 15:22:45
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="adminheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    String catId = request.getParameter("catId").trim();
    ResultSet result = dbUse.FoodItemById(Integer.valueOf(request.getParameter("catId")));
    result.first();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <div class="container">
        <div  class="delete-text">
        <h3> Do you really want to delete the respective food item?</h3>
        <h4><a href='/spicebox/DeleteCategory?&catId=<%= catId%>' class="option" onclick="myAddMessage()"><i><u>Yes</u></i></a></h4>
        <h4><a href="admindisplaycategory.jsp" class="option"><i><u>No</u></i></a></h4>
        </div>
        <script>
                    function myAddMessage() {
                        alert("Category Successfully Deleted!");
                    }
                </script>
    </div>
</section>
<%@include file="footer.jsp" %>
