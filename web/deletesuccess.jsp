<%-- 
    Document   : deletesuccess
    Created on : 26-Mar-2019, 09:29:12
    Author     : Bishnu
--%>

<%
    DbUse dbUse = new DbUse();
    String monthDate = request.getParameter("monthDate");
    out.print(monthDate);
    String currentDate = request.getParameter("currentDate");
    out.print(currentDate);
    //out.print(result);
    //result.first();
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>
<section class="information">
    <div class="container">
        <div class="delete-text">
        <h2>The selected order detail has completely been deleted.</h2>
        <h3> Click Return to return to the pervious search page.<a href='adminordersearchresult.jsp?&monthDate=<%=monthDate%>&currentDate=<%=currentDate%>'class="option"><i><u>RETURN</u></i></h3>
    </div>
    </div>
</section>
    <%@include file="footer.jsp" %>