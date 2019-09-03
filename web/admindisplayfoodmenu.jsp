<%-- 
    Document   : admindisplayfoodmenu
    Created on : 27-Feb-2019, 11:55:28
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet result = dbUse.FoodItemDisplay();
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Food Items
</h3>
<div class="container-fluid food-display-table">
    <div class="button">
        <a href="adminaddfoodmenu.jsp" class="btn btn-default add-btn" role="button">Add</a>
        <a href="admindisplayfoodmenu.jsp" class="btn btn-default display-btn active" role="button">Display</a>
    </div>
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Category</th>
                <th class="table-heading">Food Items</th>
                <th class="table-heading text-justify edit-size">Description </th>
                <th class="table-heading">Price Per Piece/Plate</th>
                <th class="table-heading">Image</th>
                <th class="table-heading">Processes</th>
            </tr>
            <%
                try {
                    while (result.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= dbUse.CategoryNameById(result.getString(2))%></td>
                <td><%= result.getString(3)%></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(5)%></td>
                <td><img src="upload/<%= result.getString(6)%>" width="150" height="100"></td>
                <td><a href='updatefoodmenu.jsp?&FoodId=<%= result.getString(1)%>' > Edit</a>|<a href='deletefooditem.jsp?&FoodId=<%= result.getString(1)%>' > Delete</a></td>
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
