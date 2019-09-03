<%-- 
    Document   : customeraddticket
    Created on : 05-Mar-2019, 09:06:22
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DbUse dbDisplay=new DbUse();
    ResultSet result = dbDisplay.FeedbackType();
 %>
 
<%@include file="customerheader.jsp" %>

<%
    String customer_id= "";
    ResultSet user_id = dbDisplay.GetCustomerIdFromEmail(usrEmail);
    if (user_id.next()) {
        customer_id = (user_id.getString(1)); 
    }
%>
        
<section class="information">
    <h3 class="heading-three text-center">
        Add FeedBack
    </h3>
    <div class="container-fluid food-display-table">
        <div class="button">
            <a href="customeraddfeedback.jsp" class="btn btn-default add-btn active" role="button">Add</a>
            <a href="customerdisplayfeedback.jsp" class="btn btn-default display-btn " role="button">Display</a>
        </div>
        <div class="form-content">
            <form method="post" action="/spicebox/AddFeedbackTicket">
                <label>Ticket Subject:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Ticket Subject" name="subject">
                <label for="pwd">Ticket Type:</label>
                <select name="type_id" class="form-control input-lg">
                    <%
                        try {
                            while (result.next()) {

                    %>

                    <option value="<%=result.getString(1)%>"><%=result.getString(2)%></option>
                    <%

                            }

                        } catch (Exception e) {
                            System.out.println("Error : " + e);
                        }

                    %>

                </select>
                <br>
                <label>Ticket Description:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Ticket Description" name="description">
                <input type="hidden" value="<%= customer_id%>" name="customer_id"/>
                
                <br>
                <input type="submit" value="Add" class="btn btn-primary add-button">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
