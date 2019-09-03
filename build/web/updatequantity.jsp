<%-- 
    Document   : updatequantity
    Created on : 21-Apr-2019, 09:23:43
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>
<% 
    DbUse update = new DbUse();
    String Od_Id = request.getParameter("Od_Id");
    out.print(Od_Id);
    ResultSet result = update.OrderDetaiFoodOdId(Od_Id);
    result.first();
    String food_name = update.FoodNameById(result.getString(3));
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        <%=food_name%>
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <form method="post" action="/spicebox/UpdateQuantity">
                <div class="display-food">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="upload/<%=result.getString(2)%>" width="400" height="350" class="item_image"/>
                        </div>
                        <div class="col-md-6 food-detail">
                            <label>Food Name: <%=food_name%></label>
                            <br>
                            <br>
                            <label>Rate: <%=result.getString(4)%></label>
                            <br>
                            <br>
                            <label>Quantity: </label>
                            <input type="number" name="quantity" value="<%=result.getString(5)%>" class="form-control input-lg" name="quantity">
                            <input type="hidden" name="odId" value="<%=Od_Id%>">
                            <input type="hidden" name="rate" value="<%=result.getString(4)%>">
                            <input type="submit" value="Edit" class="btn btn-primary add-button cart-confirm">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
