<%-- 
    Document   : adminprint
    Created on : 21-Apr-2019, 17:21:28
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%
    DbUse display = new DbUse();
    int num = 0;
    int num1 = 0;
    String order_id = request.getParameter("order_id").trim();
    ResultSet result = display.DeliveryDisplayByOrderId(String.valueOf(order_id));
    ResultSet userResult = display.OrderDetailAndImageOrderId(String.valueOf(order_id));
    int count = display.CountByOrderId(order_id);
    ResultSet totalResult = display.TotalDisplay(String.valueOf(order_id));
    result.first();
    userResult.first();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<htm>
<head>
    <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="frontend/bootstrap/css/font-awesome.css">
<link rel="stylesheet" href="frontend/bootstrap/css/fontawesome.css">
<link rel="stylesheet" href="frontend/bootstrap/css/print.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<section class="information">
    <h2 class="text-center">
        Spicebox
    </h2>
    <h3 class="text-center">
        Order Bill
    </h3>
    <div class="container">
        <div class="table-content">
               <%  
                        result = display.DeliveryDisplayByOrderId(String.valueOf(order_id));
                        result.first();
                    %>
                <p class="text-left"><b>Order No: <%=order_id%></b></p>
                <p class="text-right"><b>Ordered Time: <%= result.getString(8)%></b></p>
                <p class="text-left"><b>Name:  <%= result.getString(1)%> <%= result.getString(2)%></b></p>
                <p class="text-right"><b>Address: <%=result.getString(3)%></b></p>
                 <p class="text-left"><b>Email: <%=result.getString(5)%></b></p>
                <p class="text-right"><b>Phone Number: <%=result.getString(4)%></b></p>
                <p class="text-left"><b>Delivery Address: <%=result.getString(6)%></b></p>
                <p class="text-center"><b><mark>Delivery details: <%=result.getString(7)%></mark></p>
                <table cellspacing="0" class="table table-striped table-responsive table-sm bill-position" >
                 <tr>
                        <th class="table-heading">S.N. </th>
                        <th class="table-heading">Food Name</th>
                        <th class="table-heading">Rate </th>
                        <th class="table-heading">Quantity</th>
                        <th class="table-heading">Amount</th>
                    </tr>

                    <%  
                        userResult.first();
                        for (int i = 1; i <=count; i++) {
                          
                        %>
                    <tr>
                    <td><%= num%></td>
                    <td><%= display.FoodNameById(userResult.getString(3))%></td>
                    <td><%= userResult.getString(4)%></td>
                    <td><%= userResult.getString(5)%></td>
                    <td><%= userResult.getString(6)%></td>
                    
                </tr>
                

                    <%
                      userResult.next();
                            num++;
                        }
                        
                    %>

                </table>
                <%                        try {
                        while (totalResult.next()) {
                            double subTotal = Double.parseDouble(totalResult.getString(1));
                            double serviceTax = 0.1 * subTotal;
                            double beforeVat = subTotal + serviceTax;
                            double vatTotal = beforeVat * 0.13;
                            double grandTotal = vatTotal + beforeVat;

                %>
                    <table class="table-striped table-responsive table-sm bill-pay">
                    <tr>
                        <th class="table-heading">Sub Total: </th>
                        <td><%= subTotal%></td>
                    </tr>
                    <tr>
                        <th class="table-heading">Service Tax(10%): </th>
                        <td><%=serviceTax%></td>
                    </tr>
                    <tr>
                        <th class="table-heading">Total(before VAT): </th>
                        <td><%= beforeVat%></td>
                    </tr>
                    <tr>
                        <th class="table-heading">VAT(13%): </th>
                        <td><%= vatTotal%></td>
                    </tr>
                    <tr>
                        <th class="table-heading">Grand Total: </th>
                        <td><%= grandTotal%></td>
                    </tr>
                        </table>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>

                <form method="post" action="/spicebox/PlaceOrder">
        <input type = "button" value = "Print" onclick = "window.print()" class="btn btn-default active print" />
        <input type="hidden" value="<%=order_id%>" name="order_id">
        <input type="submit" value="Back" class="btn btn-default active print-confirm"/>

      </form>   
        </div>

    </div>
</section>
</htm>

