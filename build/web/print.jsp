<%-- 
    Document   : customerdisplayorders
    Created on : 27-Feb-2019, 12:10:30
    Author     : Bishnu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DbUse display = new DbUse();
    int num = 0;
    int num1 = 0;
    String usrEmail = session.getAttribute("uemail").toString();
    Integer orderNo = (Integer) session.getAttribute("orderNo");
    ResultSet result = display.DeliveryDisplayByOrderId(String.valueOf(orderNo));
    ResultSet userResult = display.OrderDetailAndImageOrderId(String.valueOf(orderNo));
    int orderDetailCount = 0;
    orderDetailCount = display.CountOrderDetail();
    ResultSet orderResult = display.OrderDetailDisplay();
    ResultSet totalResult = display.TotalDisplay(String.valueOf(orderNo));
%>
<htm>
<head>
    <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="frontend/bootstrap/css/font-awesome.css">
<link rel="stylesheet" href="frontend/bootstrap/css/fontawesome.css">
<link rel="stylesheet" href="frontend/bootstrap/css/print.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<section class="information">
    <h2 class="text-center">
        Spicebox
    </h2>
    <h3 class="text-center">
        Order Bill
    </h3>
    <div class="container">
        <div class="table-content">
            <form method="post" action="epayment.jsp">
       
                <%
                    try {
                        while (result.next()) {

                            num++;
                %>
                <h3 class="text-center"><b>VAT Invoice</b></h3>
                <p><b>Order No: <%=orderNo%></b></p>
                <p class="text-right"><b>Ordered Time: <%= result.getString(8)%></b></p>
                <p class="text-left"><b>Name: <%=display.GetUserNameFromEmail(usrEmail)%></b></p>
                <p class="text-right"><b>VAT No: 200000004</b></p>
                <p class="text-left"><b>Email: <%=result.getString(5)%></b></p>
                <p class="text-right"><b>Address: <%=result.getString(3)%></b></p>
                <p class="text-left"><b>Phone Number: <%=result.getString(4)%></b></p>
                <p class="text-right"><b>Delivery Address: <%=result.getString(6)%></b></p>
                <h5 class="text-center"><mark>Delivery details: <%=result.getString(7)%></mark></h5>



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
                        <th class="table-heading">Rate </th>
                        <th class="table-heading">Quantity</th>
                        <th class="table-heading">Amount</th>
                    </tr>

                    <%                 try {
                            while (userResult.next()) {

                                num1++;
                    %>

                    <tr>
                        <td><%= num1%></td>
                        <td><%= display.FoodNameById(userResult.getString(3))%></td>
                        <td><%= userResult.getString(4)%></td>
                        <td><%= userResult.getString(5)%></td>
                        <td><%= userResult.getString(6)%></td>

                    </tr>

                    <%
                            }

                        } catch (Exception e) {
                            System.out.println("Error : " + e);
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
                    <div class="row">
                        <div class="col-lg-6">
                    <input type = "button" value = "Print" onclick = "window.print()" class="btn btn-default active" />
                        </div>
                        <div class="col-lg-6">
                    <input type="hidden" value="<%=grandTotal%>" name="grand_total">
                    <input type="submit" value="Payment" class="btn btn-default active"/>
                    </div>
                <%

                        }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>




                <%                            }

                    } catch (Exception e) {
                        System.out.println("Error : " + e);
                    }

                %>
                
        

      </form>   
        </div>

    </div>
</section>
</body>
</htm>
