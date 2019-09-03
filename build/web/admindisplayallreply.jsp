<%-- 
    Document   : admindisplayallreply
    Created on : 18-Mar-2019, 10:12:05
    Author     : Bishnu
--%>

<%@page import="ejbs.DbDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  DbUse dbUse = new DbUse();
    DbDate date = new DbDate(); 
    String currentDate = date.currentDate();
    out.print(currentDate);
    Integer num = 0;    
    ResultSet result = dbUse.DisplayAllReplies(currentDate); //replying to the details
    result.first();
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Today's Reply
</h3>
<div class="container-fluid food-display-table">
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
             <tr>
                <th class="table-heading">S.N.</th>
                <th class="table-heading">Feedback Date</th>
                <th class="table-heading">Reply Date</th>
                <th class="table-heading">Customer Name</th>
                <th class="table-heading">Feedback Subject</th>
                <th class="table-heading">Feedback Type</th>
                <th class="table-heading edit-size">Feedback Description</th>
                <th class="table-heading edit-size">Reply Description</th>
                <th class="table-heading">Process</th>
            </tr>
            <%
                try {
                    while (result.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= result.getString(5)%></td>
                <td><%= result.getString(7)%></td>
                <td><b><%= dbUse.UserNameById(result.getString(1))%></b></td>
                <td><%= result.getString(2)%></td>
                <td><%= dbUse.TicketTypeById(result.getString(3))%></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(6)%></td>
                <td><a href='deletereply.jsp?&ticketId=<%= result.getString(1)%>' >Delete</a>
            </tr>   
            
            <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>
            </table>
            </div>
</div>
</section>
<%@include file="footer.jsp" %>