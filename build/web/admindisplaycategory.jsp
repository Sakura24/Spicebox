<%-- 
    Document   : admindisplaycategory
    Created on : 04-Apr-2019, 14:18:36
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbUse = new DbUse();
    int num = 0;
    ResultSet result = dbUse.CategoryDisplay();
    
     //page for the diplay of the items
%>

<%@include file="adminheader.jsp" %>
<section class="information">
<h3 class="heading-three text-center">
    Categories
</h3>
<div class="container-fluid food-display-table">
    <div class="button">
        <a href="adminaddcategory.jsp" class="btn btn-default add-btn" role="button">Add</a>
        <a href="admindisplaycategory.jsp" class="btn btn-default display-btn active" role="button">Display</a>
    </div>
    <div class="table-content">
        <table cellspacing="0" class="table table-striped table-responsive table-sm" >
            <tr>
                <th class="table-heading">S.N. </th>
                <th class="table-heading">Category Name</th>
                <th class="table-heading">Image</th>
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
                <td><img src="upload/<%= result.getString(3)%>" width="150" height="100"></td>
                <td><a href='admindisplayfoodbycat.jsp?&catId=<%= result.getString(1)%>' > View Items</a> | <a href='deletecategory.jsp?&catId=<%= result.getString(1)%>' > Delete</a></td>
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
