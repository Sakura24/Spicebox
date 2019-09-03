<%-- 
    Document   : customerorderprocess
    Created on : 27-Feb-2019, 12:14:03
    Author     : Bishnu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DbUse dbObj = new DbUse();
    int num = 0;
    ResultSet foodResult = dbObj.FoodItemDisplay();
    ResultSet orderResult = dbObj.OrderDetailDisplay();
    int rowCount = 0;
    int orderDetailCount = 0;
    rowCount = dbObj.CountRecords();
    orderDetailCount = dbObj.CountOrderDetail();
    orderDetailCount = dbObj.CountOrderDetail();
    int OrderNo = (Integer) session.getAttribute("lastInsertOrder");
    ResultSet detailResult = dbObj.OrderDetailDisplayByOrderId(String.valueOf(OrderNo));

%>

<!DOCTYPE html>
<%@include file="customerheader.jsp" %>
<section class="information">
    <h3 class="heading-three text-center">
        Order Food Items
    </h3>
    <div class="container-fluid food-display-table">
        <div class="form-content">
            <form name="kot" method="post" action="/spicebox/OrderInsert">
                <label>Food Name:</label>

                <%! List l2 = new ArrayList();
                    List l1 = new ArrayList();%>
                <% try {

                    } catch (Exception e) {
                        e.printStackTrace();
                    }%>
                <% String arrComp[][] = new String[rowCount][2];
                    foodResult.first();
                    for (int i = 0; i < rowCount; i++) {
                        arrComp[i][0] = foodResult.getString(1);
                        arrComp[i][1] = foodResult.getString(2);
                        foodResult.next();
                    }
                %>

                <div class="ui-widget">
                    <select id="combobox" name="food_name" class="form-control input-lg" onchange="showUser(this.value)">
                        <option value="">Select one...</option>
                        <% for (int i = 0; i < rowCount; i++) {%>
                        <option value="<%=arrComp[i][0]%>"><%=arrComp[i][1]%></option>
                        { %>

                        <% }%>
                    </select>

                    <script>
                        function showUser(str) {

                            if (str == "") {
                                document.getElementById("txtRate").innerHTML = "";
                                return;
                            }
                            if (window.XMLHttpRequest) {
                                // code for IE7+, Firefox, Chrome, Opera, Safari
                                xmlhttp = new XMLHttpRequest();
                            } else { // code for IE6, IE5
                                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            xmlhttp.onreadystatechange = function () {
                                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                                    document.getElementById("txtRate").innerHTML = xmlhttp.responseText;
                                }
                            }
                            xmlhttp.open("GET", "getPrice.jsp?id=" + str, true);
                            xmlhttp.send();

                        }

                    </script>

                    <br>
                    <label for="pwd"><b>Rate:</b></label>
                    <div id="txtRate">
                        <input type="number" name="rate" ng-model="rate" class="form-control input-lg">
                    </div>
                    <label for="pwd"><b>Quantity:</b></label>
                    <div id="txQty">
                        <input type="number" name="quantity" ng-model="quantity" class="form-control input-lg" onkeyup="calTot()">
                    </div>

                    <script>
                        function calTot() {

                            var a = parseInt(document.kot.rate.value);
                            var b = parseInt(document.kot.quantity.value);
                            document.getElementById("txtAmount").value = a * b;

                        }
                    </script>

                    <label for="pwd"><b>Amount:</b></label>
                    <div id="txtTot">${amount}
                        <input type="text" name="amount" id="txtAmount" class="form-control input-lg" readonly>
                    </div>
                    <input type="hidden" name="orderNo" value="<%= OrderNo%>"
                    <br>
                    <br>
                </div>
                <input type="submit" value="Order" class="btn btn-primary add-button">
            </form>
        </div>
        <div class="table-content">
            <form name="confirm" method="post" action="customerorderconfirm.jsp">
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
                        <th class="table-heading">Food Items</th>
                        <th class="table-heading">Rate </th>
                        <th class="table-heading">Quantity</th>
                        <th class="table-heading">Amount</th>
                        <th class="table-heading">Process</th>
                    </tr>

                    <%
                        try {
                            while (detailResult.next()) {

                                num++;
                    %>

                    <tr>
                        <td><%= num%></td>
                        <td><%= dbObj.FoodNameById(detailResult.getString(2))%></td>
                        <td><%= detailResult.getString(3)%></td>
                        <td><%= detailResult.getString(4)%></td>
                        <td><%= detailResult.getString(5)%></td>
                        <td><a href='deletefoodorder.jsp?&Od_Id=<%= detailResult.getString(1)%>' >Remove from List</a></td>
                    </tr>

                    <%

                            }

                        } catch (Exception e) {
                            System.out.println("Error : " + e);
                        }

                    %>

                </table>

                <input type="submit" value="Add Order" class="btn btn-primary add-button add-order-button">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
