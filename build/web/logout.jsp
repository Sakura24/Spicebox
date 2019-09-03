
<%
session.setAttribute("uemail", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
