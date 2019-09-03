<%-- 
    Document   : deletefooditem
    Created on : 18-Mar-2019, 13:26:12
    Author     : Bishnu
--%>
<%@include file="adminheader.jsp" %>
<%
    DbUse dbUse = new DbUse();
    String FoodId = request.getParameter("FoodId").trim();
    ResultSet result = dbUse.FoodItemById(Integer.valueOf(request.getParameter("FoodId")));
    result.first();
%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <div class="container">
        <div  class="delete-text">
            <img src="upload/<%=result.getString(6)%>" width="150" height="100">
        <h3> Do you really want to delete the respective food item?</h3>
        <h4><a href='/spicebox/DeleteFoodItem?&FoodId=<%= FoodId%>' class="option" onclick="myAddMessage()"><i><u>Yes</u></i></a></h4>
        <h4><a href="admindisplayfoodmenu.jsp" class="option"><i><u>No</u></i></a></h4>
        </div>
         <script>
                    function myAddMessage() {
                        alert("Food item Successfully Deleted!");
                    }
                </script>
    </div>
</section>
<%@include file="footer.jsp" %>