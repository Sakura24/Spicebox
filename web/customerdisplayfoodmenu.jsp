<%-- 
    Document   : customerdisplayfoodmenu
    Created on : 27-Feb-2019, 12:09:23
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page import="ejbs.DbInt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbInt dbObj = new DbInt();
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet result = dbUse.FoodItemDisplay();
%>
<%@include file="customerheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Food Items
</h3>
<div class="container-fluid food-display-table">
    <form method="post" action="customerorderprocess.jsp" class="form-setting">
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Category </th>
                <th class="table-heading">Food Items</th>
                <th class="table-heading edit-size">Description </th>
                <th class="table-heading">Price Per Piece</th>
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
            </tr>
            <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>
        </table>
    </div>
        <input type="submit" value="Order" class="btn btn-primary order-button">
    </form>
</div>
</section>
<%@include file="footer.jsp" %>
