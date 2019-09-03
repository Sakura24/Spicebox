<%-- 
    Document   : admindisplayticket
    Created on : 10-Mar-2019, 17:03:13
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet result = dbUse.AdminFeedbackDetail();
    Integer count = dbUse.FeedbackCount();
    // page ofr display of the feedbacks
%>

<section class="information">
<h3 class="heading-three text-center">
    Feedbacks
</h3>
<div class="container-fluid food-display-table">
    <% if( count > 0) { %>
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Subject</th>
                <th class="table-heading">Feedback Type </th>
                <th class="table-heading">Feedback by</th>
                <th class="table-heading">Processes</th>
            </tr>
            <%
                try {
                    while (result.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= result.getString(2)%></td>
                <td><%= result.getString(3)%> </td>
                <td><%= result.getString(4)+" "+result.getString(5)%></td>
                <td><a href='adminreplyfeedback.jsp?&ticketId=<%= result.getString(1)%>' > Reply</a></td>
            </tr>
            <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>
        </table>
    </div>
        <% } else{ %>
        <div  class="delete-text text-center">
            <h4>The feedbacks sent today by the customers have been replied.</h4>
            <h4>No recent feedbacks have been sent by the customers.</h4>
        </div>
        <% } %>
</div>
</section>
<%@include file="footer.jsp" %>

