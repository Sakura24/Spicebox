<%-- 
    Document   : customerdisplayticket
    Created on : 05-Mar-2019, 15:11:36
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="customerheader.jsp" %>

<%
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet result = dbUse.FeedbackDisplay(usrEmail);
    ResultSet feedbackResult = dbUse.AdminFeedbackDetail();
%>

<section class="information">
<h3 class="heading-three text-center">
    Feedbacks
</h3>
<div class="container-fluid food-display-table">
    <div class="button">
        <a href="customeraddfeedback.jsp" class="btn btn-default add-btn" role="button">Add</a>
        <a href="customerdisplayfeedback.jsp" class="btn btn-default display-btn active" role="button">Display</a>
    </div>
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Subject</th>
                <th class="table-heading">Type </th>
                <th class="table-heading edit-size">Description</th>
                <th class="table-heading">Date</th>
                <th class="table-heading">Process</th>
            </tr>
            <%
                try {
                    while (result.next()) {

                        num++;
            %>
            <tr>
                <td><%= num%></td>
                <td><%= result.getString(2)%></td>
                <td><%= result.getString(3)%></td>
                <td><%= result.getString(4)%></td>
                <td><%= result.getString(5)%></td>
                <td><a href='customerdisplayreply.jsp?&ticketId=<%= result.getString(1)%>' > View Reply</a>|<a href='deletefeedback.jsp?&ticketId=<%= result.getString(1)%>' > Delete</a></td>
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

