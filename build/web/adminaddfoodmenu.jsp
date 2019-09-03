<%-- 
    Document   : adminaddfoodmenu
    Created on : 27-Feb-2019, 11:52:11
    Author     : Bishnu
--%>
<%@include file="adminheader.jsp" %>
<%@page import="java.sql.ResultSet"%>
<% 
    DbUse cat = new DbUse();
    ResultSet catResult = cat.CategoryDisplay();
    // to add the food menu 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        Add Food Items
    </h3>
    <div class="container-fluid food-display-table">
        <div class="button">
            <a href="adminaddfoodmenu.jsp" class="btn btn-default add-btn active" role="button">Add</a>
            <a href="admindisplayfoodmenu.jsp" class="btn btn-default display-btn " role="button">Display</a>
        </div>
        <div class="form-content ">
            <form method="post" action="/spicebox/AddFoodItem" enctype="multipart/form-data">
                <label>Category Name:</label>
                <select name="cat_id" class="form-control input-lg input-design">
                    
                    <%         try {
                            while (catResult.next()) {

                    %>

                    <option value="<%=catResult.getString(1)%>"><%=catResult.getString(2)%></option>
                    <%

                            }// carryoing out try catch statement

                        } catch (Exception e) {
                            System.out.println("Error : " + e);
                        }

                    %>

                </select>
                <label>Food Name:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Food Name" name="food_name">
                <label>Description:</label>
                <textarea type="text" class="form-control input-lg text-area" placeholder="Enter Food Description" name="description"></textarea>
                <label>Price Per Piece/Plate:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Price Per Piece" name="price_per_piece">
                <label>Image Link:</label>
                <input type="file" name="file">
                <input type="submit" value="Add" class="btn btn-primary add-button" onclick="myAddMessage()">
            </form>
                    <script>
                    function myAddMessage() {
                        alert("Food Item Successfully Added!");
                    }
                </script>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
