<%-- 
    Document   : admincustomedisplayorder
    Created on : 11-Mar-2019, 14:27:33
    Author     : Bishnu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%
    DbUse dbFunction = new DbUse();
    int num = 1;
    String order_id = request.getParameter("orderId").trim();
    ResultSet result = dbFunction.DeliveryDisplayByOrderId(String.valueOf(order_id));
    ResultSet userResult = dbFunction.OrderDetailAndImageOrderId(String.valueOf(order_id));
    int count = dbFunction.CountByOrderId(order_id);
    ResultSet totalResult = dbFunction.TotalDisplay(String.valueOf(order_id));
    result.first();
    userResult.first(); //pointing the positin of the resultseet to the first value 

%>

<section class="information">
    <h3 class="heading-three text-center">
        Order Details
    </h3>
    <div class="container-fluid food-display-table">
        <div class="print">
            <h6>Have a printable bill format:  <a href="adminprint.jsp?&order_id=<%=order_id%>" class="btn btn-default display-btn active" role="button">Print</a></h6>
        </div>
        <script type = "text/javascript">
      </script>    
      
      <div class="table-content">
        <form class="bill-detail" method="post" action="adminprint.jsp">
                <%  
                        result = dbFunction.DeliveryDisplayByOrderId(String.valueOf(order_id));
                        result.first();
                        //code for the dislay of the order detaisl
                    %>
                <p class="text-left"><b>Order No: <%=order_id%></b></p>
                <p class="text-right"><b>Ordered Time: <%= result.getString(8)%></b></p>
                <p class="text-left"><b>Name: <%= result.getString(1)%> <%= result.getString(2)%></b></p>
                <p class="text-right"><b>Name: 20000004</b></p>
                <p class="text-left"><b>Email: <%=result.getString(5)%></b></p>
                <p class="text-right"><b>Address: <%=result.getString(3)%></b></p>
                <p class="text-left"><b>Phone Number: <%=result.getString(4)%></b></p>
                <p class="text-right"><b>Delivery Address: <%=result.getString(6)%></b></p>
                <h5 class="text-center bill-details"><mark>Delivery details: <%=result.getString(7)%></mark></h5>
                <table cellspacing="0" class="table table-striped table-responsive table-sm bill-position" >
                <tr>
                        <th class="table-heading">S.N. </th>
                        <th class="table-heading">Food Name</th>
                        <th></th>
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
                    <td><%= dbFunction.FoodNameById(userResult.getString(3))%></td>
                    <td> <img src="upload/<%=userResult.getString(2)%>" width="100" height="50"></td>
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
                    <input type="hidden" value="<%=order_id%>" name="order_id">
            <input type="submit" value="Confirm" class="btn btn-warning add-order-button"/>
           
        </form>
      </div>
            
    </div>
</section>
<%@include file="footer.jsp" %>
