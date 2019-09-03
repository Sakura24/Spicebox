<%-- 
    Document   : addtocart
    Created on : 05-Apr-2019, 15:58:35
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DbUse food = new DbUse(); // callingb the class using the object
    String foodId = request.getParameter("foodId");
    out.print(foodId);
    String food_name = food.FoodNameById(foodId);
    ResultSet result = food.FoodItemDisplayById(foodId);
    result.first();
//code for the adding of food items o cart
%>

<section class="information">
    <h3 class="heading-three text-center">
        <%=food_name%>
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <form method="post" action="/spicebox/AddToCart">
                <div class="display-food">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="upload/<%=result.getString(6)%>" width="400" height="350" class="item_image"/>
                        </div>
                        <div class="col-md-6 food-detail">
                            <label>Food Name: <%=result.getString(3)%></label>
                            <br>
                            <br>
                            <label>Rate: <%=result.getString(5)%></label>
                            <br>
                            <br>
                            <label>Quantity(Price per piece/Plate): </label>
                            <input type="number" name="quantity" ng-model="quantity" class="form-control input-lg qty">
                            <input type="hidden" name="foodId" value="<%= foodId%>">
                            <input type="hidden" name="food_name" value="<%=result.getString(3)%>">
                            <input type="hidden" name="rate" value="<%=result.getString(5)%>">
                            <input type="submit" value="Add To Cart" class="btn btn-primary add-button cart-confirm">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>