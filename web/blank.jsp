<%-- 
    Document   : blank
    Created on : 12-Mar-2019, 13:34:30
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%   
    String ticketId = session.getAttribute("ticketId").toString();
    out.print(ticketId);
    DbUse dbUse = new DbUse();
    ResultSet result = dbUse.ReplyDetail(Integer.valueOf(ticketId));
    result.first();
    String value = "";
    if (result.next()){
    value = result.getString(7);
    out.print(value);
    }    
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three">
    Reply
</h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">Customer Name</th>
                <th class="table-heading"> Feedback Subject </th>
                <th class="table-heading">Feedback Type</th>
                <th class="table-heading">Feedback Description</th>
                <th class="table-heading">Feedback Date</th>
                <th class="table-heading">Reply Description</th>
                <th class="table-heading">Reply Date</th>
            </tr>
            <%
                result.first();
                try {
                    while (result.next()) {
            %>
            
<tr>
                 <td><%= dbUse.UserNameById(result.getString(1))%></td>
                <td><%= result.getString(2)%></td>
                <td><%= dbUse.TicketTypeById(result.getString(3))%></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(5)%></td>
                <td><%= result.getString(6)%></td>
                <td><%= result.getString(7)%></td>
            </tr>
            
            <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>