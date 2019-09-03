<%-- 
    Document   : updatefoodmenu
    Created on : 27-Feb-2019, 12:20:01
    Author     : Bishnu
--%>
<%@include file="adminheader.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbFunction = new DbUse();
    String foodId = request.getParameter("FoodId").trim();
    ResultSet result = dbFunction.FoodItemById(Integer.valueOf(request.getParameter("FoodId")));
    result.first();
    String categoryName = dbFunction.CategoryNameById(result.getString(2));
    DbUse cat = new DbUse();
    ResultSet catResult = cat.CategoryDisplay();

%>

<section class="information">
    <h3 class="heading-three text-center">
        Edit Food Items
    </h3>
    <div class="container-fluid food-display-table">
        <div class="form-content">
            <form method="post" action="/spicebox/UpdateFoodMenu">
                <label>Food Name:</label>
                <input type="text" class="form-control input-lg" value="<%= result.getString(3)%>" name="food_name"> 
                <label>Description:</label>
                <textarea type="text" class="form-control input-lg text-area" value="<%= result.getString(4)%>" name="description"><%= result.getString(4)%></textarea>
                <label>Price Per piece:</label>
                <input type="text" class="form-control input-lg" value="<%= result.getString(5)%>" name="price_per_piece">
                <input type="hidden" value="<%= foodId%>" name="FoodId"/>
                <br>
                <input type="submit" value="Edit" class="btn btn-primary add-button" onclick="myAddMessage()">
            <script>
                    function myAddMessage() {
                        alert("Food item Successfully Updated!");
                    }
                </script>
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>

