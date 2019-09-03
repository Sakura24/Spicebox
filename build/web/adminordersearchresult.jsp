<%-- 
    Document   : adminordersearchresult
    Created on : 20-Mar-2019, 18:24:21
    Author     : Bishnu
--%>

<%@page import="ejbs.DbDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    DbUse dbUse = new DbUse();
    DbDate date = new DbDate();
    String monthDate = request.getParameter("monthDate");
    String currentDate = request.getParameter("currentDate");
    int num = 0;
    ResultSet result = dbUse.OrderDetailByTwoDate(monthDate,currentDate);
    Integer sum = 0;
    Integer sum1 = 0;
    Integer sum2 = 0;
    Integer count = dbUse.BetweenDateCount(monthDate, currentDate);
%>
<%@include file="adminheader.jsp" %>
<section class="information text-center">
<h3 class="heading-three">
    List of One Months Order for the current date
</h3>
    <div class="container-fluid food-display-table">
        <% if (count > 0) { %>
        
        <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Customer Name</th>
                <th class="table-heading">Delivery Address </th>
                <th class="table-heading">Total</th>
                <th class="table-heading">Service Charge</th>
                 <th class="table-heading">VAT Charge</th>
                <th class="table-heading">Ordered Date</th>
                <th class="table-heading">Process</th>
            </tr>
            <%
                try {
                    while (result.next()) {
                        sum=sum+Integer.valueOf(result.getString(5));
                        sum1=sum1+Integer.valueOf(result.getString(6));
                        sum2=sum2+Integer.valueOf(result.getString(7));
                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= result.getString(2) + " " + result.getString(3)%> </a></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(5)%></td>
                <td><%= result.getString(6)%></td>
                <td><%= result.getString(7)%></td>
                 <td><%= result.getString(8)%></td>
                <td><a href='deleteorderlist.jsp?&orderId=<%= result.getString(1)%>&monthDate=<%=monthDate%>&currentDate=<%=currentDate%>' >Delete</a></td>
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
        <% ResultSet total = dbUse.TotalByTwoDate(monthDate,currentDate);
            //total.first();

            if (total.next()) {
                total.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">Total Sales:
        <input type="text" name="sum" class="input-lg total" value="<%= sum%>">
        </div>
        <div class="col-lg-4">
        
        <% ResultSet service = dbUse.ServiceTotalByTwoDate(monthDate,currentDate);
            //total.first();

            if (service.next()) {
                service.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">Service Charge:
        <input type="text" name="sum1" class="input-lg total" value="<%= sum1%>">
        </div>
        
        <div class="col-lg-4">
        
        <% ResultSet vat = dbUse.VatTotalByTwoDate(monthDate, currentDate);
            //total.first();

            if (vat.next()) {
                vat.first();
                // sum = total.getInt(1);
            }%>
        <h2 align="center" class="text-bg bottom-text">VAT Collected
        <input type="text" name="sum2" class="input-lg total" value="<%= sum2%>">
        </div>
        
            </div>
        <form class="bill-print" action="billprint.jsp">
            <input type="hidden" value="<%=monthDate%>" name="monthDate">
            <input type="hidden" value="<%=currentDate%>" name="currentDate">
            <input type="hidden" value="<%=sum%>" name="totalSale">
            <input type="hidden" value="<%=sum1%>" name="service">
            <input type="hidden" value="<%=sum2%>" name="vat">
            <h6>Have a printable bill format:</h6>
            <input type="submit" value="Print" class="btn btn-light">
        </form>
        <% } else{ %>
        <div class="delete-text">
            <h3>No orders during between those months.</h3>
        </div>
        <% } %>
    </div>
</section>
<%@include file="footer.jsp" %>
