<%-- 
    Document   : billprint
    Created on : 22-Apr-2019, 15:14:28
    Author     : Bishnu
--%>
<%
    String usrEmail = session.getAttribute("uemail").toString();
    String monthDate = request.getParameter("monthDate");
    //out.print(monthDate);
    String currentDate = request.getParameter("currentDate");
    //out.print(currentDate);
    String totalSale = request.getParameter("totalSale");
    int intTotal = Integer.parseInt(totalSale);
    String service = request.getParameter("service");
    int intService = Integer.parseInt(service);
    String vat = request.getParameter("vat");
    int intVat = Integer.parseInt(vat);
    int grandtotal = intTotal + intService + intVat;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/font-awesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/fontawesome.css">
        <link rel="stylesheet" href="frontend/bootstrap/css/print.css">
    </head>
   <section class="information">
    <h2 class="text-center">
        Spicebox
    </h2>
    <h3 class="text-center">
        Sales Report
    </h3>
    <div class="container">
        <div class="table-content">
             <table class="table-striped table-responsive table-sm sale-report">
                 <h3 class="text-center">Period<b></b></h3>
            <h4 class="text-center"><b>From: <%=monthDate%>  -  To: <%=currentDate%></b></h4>
            <tr>
                <th class="sale">Total Sales: </th>
                <td><%=intTotal%></th>
            </tr>
            <tr>
                <th class="sale">Service Charge: </th>
                <td><%=intService%></th>
            </tr>
            <tr>
                <th class="sale">VAT Collected </th>
                <td><%=intVat%></th>
            </tr>
            <tr>
                <th class="sale">Grand Total: </th>
                <td><%=grandtotal%></th>
            </tr>
             </table>
           
                
</html>
