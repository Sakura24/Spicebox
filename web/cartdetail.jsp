<%-- 
    Document   : cartdetail
    Created on : 19-Apr-2019, 08:43:13
    Author     : Bishnu
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    DbUse display = new DbUse();
    Integer orderNo = (Integer)session.getAttribute("orderNo");
    //out.print(orderNo);
    ResultSet result = display.UsersDisplayByOrderId(String.valueOf(orderNo));
    ResultSet userResult = display.OrderDetailAndImageOrderId(String.valueOf(orderNo));
    int orderDetailCount = 0;
    orderDetailCount = display.CountOrderDetail();
    ResultSet orderResult = display.OrderDetailDisplay();
    Integer count = display.CountOrderDetailByOrderId(String.valueOf(orderNo));
    out.print(count);
    int num = 0;
    int num1 = 0;
%>

<section class="information">
    <h3 class="heading-three text-center">
        Order Process
    </h3>
    <% if(count > 0) { %>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <form class="bill-detail">
                <%
                    try {
                        while (result.next()) {

                            num++;
                %>
                <p class="text-left"><b>Order No: <%=orderNo%></b></p>
                <p class="text-right"><b>Ordered Time: <%= result.getString(6)%></b></p>
                <p class="text-left"><b>Name: <%=display.GetUserNameFromEmail(usrEmail)%></b></p>
                <p class="text-right"><b>VAT No: 200000004</b></p>
                <p class="text-left"><b>Email: <%= result.getString(5)%></b></p>
                <p class="text-right"><b>Address: <%=result.getString(3)%></b></label>
                <p class="text-left"><b>Phone Number: <%=result.getString(4)%></b></p>
                
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
            
            <table cellspacing="0" class="table table-striped table-responsive table-sm bill-position" >

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
                    <th></th>
                    <th class="table-heading">Rate </th>
                    <th class="table-heading">Quantity(Price per Piece/Plate)</th>
                    <th class="table-heading">Amount</th>
                    <th class="table-heading">Process</th>
                </tr>
                </tr>
                <%                 try {
                        while (userResult.next()) {

                            num1++;
                %>
                <tr>
                    <td><%= num1%></td>
                    <td><%= display.FoodNameById(userResult.getString(3))%></td>
                    <td> <img src="upload/<%=userResult.getString(2)%>" width="100" height="50"></td>
                    <td><%= userResult.getString(4)%></td>
                    <td><%= userResult.getString(5)%></td>
                    <td><%= userResult.getString(6)%></td>
                    <td><a href='updatequantity.jsp?&Od_Id=<%= userResult.getString(1)%>' >Edit</a> | <a href='deletefoodorder.jsp?&Od_Id=<%= userResult.getString(1)%>' >Remove from List</a></td>
                </tr>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
            </table>
            </form>
            <br>
            <br>
        </div>
         <h5 class="text-center">Please insert the delivery address and any description for the ordered food or order. Thank you</h5>     
        <div class="form-content">
            <form name="detail" method="post" class="confirm-form" action="/spicebox/InsertDeliveryDetail">
                <label>Delivery Address:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Delivery Address" name="delivery_address"> 
                <label>Description:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Some Special Description" name="description"> 
                <input type="hidden" name="orderNo" value="<%=orderNo%>"> 
                <input type="submit" value="Enter" class="btn btn-primary add-button">
            </form>
        </div>
                <% } else{ %>
        <div class="delete-text">
            <h3>You have ether deleted all the orders placed today or have not placed any other today.</h3>
            <h3><a href="customerdisplaycategory.jsp" class="link order-link"><b><i><u>Place Order</u></i><b></a></h3>
        </div>
        <% } %>
    </div>
</section>
<%@include file="footer.jsp" %>

