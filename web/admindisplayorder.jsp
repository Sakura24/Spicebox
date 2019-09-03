<%-- 
    Document   : adminorderprocess
    Created on : 27-Feb-2019, 12:05:45
    Author     : Bishnu
--%>

<%@page import="ejbs.DbDate"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="adminheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DbUse dbUse = new DbUse();
    DbDate date = new DbDate();
    String currentDate = date.currentDate();
    int num = 0;
    ResultSet result = dbUse.OrderDetailByDate(currentDate);
    Integer count = dbUse.TodayOrderCount(currentDate);
    Integer sum = 0;
    Integer sum1 = 0;
    Integer sum2 = 0;
%>

<section class="information">
    <h3 class="heading-three text-center">
        List of Today's Orders
    </h3>
    <% if(count > 0) { %>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >
                <tr>
                    <th class="table-heading">S.N. </th>
                    <th class="table-heading">Customer Name</th>
                    <th class="table-heading">Delivery Address </th>
                    <th class="table-heading">Total</th>
                    <th class="table-heading">Service Charge</th>
                    <th class="table-heading">Vat Charge</th>
                    <th class="table-heading">Ordered Time</th>
                </tr>
                <%                try {
                        while (result.next()) {
                            sum = sum + Integer.valueOf(result.getString(5));
                            sum1 = sum1 + Integer.valueOf(result.getString(6));
                            sum2 = sum2 + Integer.valueOf(result.getString(7));
                            num++;
                %>
                <tr>
                    <td><%= num%></td>
                    <td><a href='admincustomedisplayorder.jsp?&orderId=<%= result.getString(1)%>' >  <%= result.getString(2) + " " + result.getString(3)%> </a></td>
                    <td><%= result.getString(4)%></td>
                    <td><%= result.getString(5)%></td>
                    <td><%= result.getString(6)%></td>
                    <td><%= result.getString(7)%></td>
                     <td><%= result.getString(8)%></td>
                </tr>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
            </table>
        </div>
            <div class="row">
                <div class="col-lg-4">
        <% ResultSet total = dbUse.TotalByDate(currentDate);
            //total.first();

            if (total.next()) {
                total.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">Total Sales:
        <input type="text" name="sum" class="input-lg total" value="<%= sum%>">
        </div>
        <div class="col-lg-4">
        
        <% ResultSet service = dbUse.ServiceTotalByDate(currentDate);
            //total.first();

            if (service.next()) {
                service.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">Service Charge:
        <input type="text" name="sum1" class="input-lg total" value="<%= sum1%>">
        </div>
        
        <div class="col-lg-4">
        
        <% ResultSet vat = dbUse.VatTotalByDate(currentDate);
            //total.first();

            if (vat.next()) {
                vat.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">VAT Charge:
        <input type="text" name="sum2" class="input-lg total" value="<%= sum2%>">
        </div>
            </div>
        <% } else{ %>
        <div class="delete-text">
            <h3>All the orders of today placed have been registered . No new order has been placed till now.</h3>
        </div>
        <% } %>
    </div>
</section>
<%@include file="footer.jsp" %>
