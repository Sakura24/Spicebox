<%-- 
    Document   : getPrice
    Created on : 27-Feb-2019, 12:16:31
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DbUse dbRate =new DbUse();
    ResultSet result;
    String id = request.getParameter("id");
    result=dbRate.PriceDisplay(Integer.valueOf(id));
    result.first();
    //out.print(rs.getString(1));
    
%>
<input type="text" name="rate" class="form-control input-lg" value="<%= result.getString(1)%>" readonly>

