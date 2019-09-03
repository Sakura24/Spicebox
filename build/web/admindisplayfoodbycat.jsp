<%-- 
    Document   : admindisplayfoodbycat
    Created on : 04-Apr-2019, 16:34:16
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbUse = new DbUse();
    int num = 0;
    String catId = request.getParameter("catId");
    ResultSet result = dbUse.FoodItemDisplayByCat(catId);
    int count = dbUse.CountFoodItemDisplayByCat(catId);
    // code for the display of the food items by category
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Food Items
</h3>
    <% if (count > 0) {%>
<div class="container-fluid food-display-table">
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Food Items</th>
                <th class="table-heading edit-size">Description </th>
                <th class="table-heading">Price Per /Plate</th>
                <th class="table-heading">Image</th>
            </tr>
            <%
                try {
                    while (result.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= result.getString(3)%></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(5)%></td>
                <td><img src="upload/<%= result.getString(6)%>" width="150" height="100"></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>
        </table>
    </div>
         <% } else { %>
        <div class="delete-text">
            <h3>There has not been any reply to your queries yet.</h3>
        </div>
        <% }%>
</div>
</section>
<%@include file="footer.jsp" %>

