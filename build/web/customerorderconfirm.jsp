<%-- 
    Document   : customerorderconfirm
    Created on : 27-Feb-2019, 12:13:26
    Author     : Bishnu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbUse = new DbUse();
    int num = 0;
    int num1 = 0;
    Integer OrderNo = (Integer) session.getAttribute("lastInsertOrder");
    ResultSet result = dbUse.UsersDisplayByOrderId(String.valueOf(OrderNo));
    ResultSet userResult = dbUse.OrderDetailDisplayByOrderId(String.valueOf(OrderNo));
    int orderDetailCount = 0;
    orderDetailCount = dbUse.CountOrderDetail();
    ResultSet orderResult = dbUse.OrderDetailDisplay();
    ResultSet totalResult = dbUse.TotalDisplay(String.valueOf(OrderNo));
    Integer subTotal = 0;
%>

<%@include file="customerheader.jsp" %>
<section class="information">
    <h3 class="heading-three text-center">
        Order Process
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >
                <%
                    try {
                        while (result.next()) {

                            num++;
                %>
                <tr>
                    <th class="table-heading">First Name</th>
                    <td><%= result.getString(1)%></td>
                </tr>
                <tr>
                    <th class="table-heading">Last Name </th>
                    <th class="table-heading">Address</th>
                    <th class="table-heading">Contact No</th>
                    <th class="table-heading">Email</th>
                    <th class="table-heading">Ordered Date</th>
                </tr>
                
                <tr>
                    <td><%= result.getString(1)%></td>
                    <td><%= result.getString(2)%></td>
                    <td><%= result.getString(3)%></td>
                    <td><%= result.getString(4)%></td>
                    <td><%= result.getString(5)%></td>
                    <td><%= result.getString(6)%></td>
                </tr>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
            </table>
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >

                <% List l4 = new ArrayList();
                List l3 = new ArrayList();%>
                <% try {

                    } catch (Exception e) {
                        e.printStackTrace();
                    }%>
                <% String arrayDetail[][] = new String[orderDetailCount][2];
                    orderResult.first();
                    for (int i = 0; i < orderDetailCount; i++) {
                        arrayDetail[i][0] = orderResult.getString(1);
                        arrayDetail[i][1] = orderResult.getString(2);
                        orderResult.next();
                    }
                %>

                <tr>
                    <th class="table-heading">S.N. </th>
                    <th class="table-heading">Food Name</th>
                    <th class="table-heading">Rate </th>
                    <th class="table-heading">Quantity</th>
                    <th class="table-heading">Amount</th>
                </tr>
                </tr>
                <%                 try {
                        while (userResult.next()) {

                            num1++;
                %>
                <tr>
                    <td><%= num1%></td>
                    <td><%= dbUse.FoodNameById(userResult.getString(2))%></td>
                    <td><%= userResult.getString(3)%></td>
                    <td><%= userResult.getString(4)%></td>
                    <td><%= userResult.getString(5)%></td>
                </tr>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
            </table>
            <br>
            <br>
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >   
                <%                        try {
                                while (totalResult.next()) {

                                    num++;
                        %>
                <tr>
                    <th class="table-heading">Sub Total</th>
                    <td><%= totalResult.getString(1)%></td>
                </tr>
                <tr>
                    <th class="table-heading">Service Tax</th>
                    <td><%= subTotal%></td>
                </tr>
                <tr>
                    <th class="table-heading">Grand Total</th>
                    <td><%= totalResult.getString(1)%></td>
                </tr>
                <%

                            }

                        } catch (Exception e) {
                            System.out.println("Error : " + e);
                        }

                    %>
            </table>
        </div>
               
        <div class="form-content">
            <form name="detail" method="post" class="confirm-form" action="/spicebox/InsertDeliveryDetail">
                <label>Delivery Address:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Delivery Address" name="delivery_address"> 
                <label>Description:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Some Special Description" name="description"> 
                <input type="hidden" name="order_id" value="<%= OrderNo%>"
                       <br>
                <input type="submit" value="Enter" class="btn btn-primary add-button">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
