<%-- 
    Document   : deleteorderlist
    Created on : 25-Mar-2019, 12:31:20
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    String orderId = request.getParameter("orderId").trim();
    String monthDate = request.getParameter("monthDate");
    String currentDate = request.getParameter("currentDate");
    ResultSet result = dbUse.UserOrderDetailById(request.getParameter("orderId"));
   
%>

<section class="information">
    <div class="container">
        <div  class="delete-text">
        <h3> Do you really want to delete the respective food item?</h3>
        <h4><a href='/spicebox/DeleteOrderList?&orderId=<%= orderId%>&monthDate=<%=monthDate%>&currentDate=<%=currentDate%>' class="option" onclick="myAddMessage()"><i><u>Yes</u></i></a></h4>
        <h4><a href="adminsearchorder.jsp" class="option"><i><u>No</u></i></a></h4>
        </div>
        <script>
                    function myAddMessage() {
                        alert("Order Successfully Deleted!");
                    }
                </script>
    </div>
</section>
        <%@include file="footer.jsp" %>
