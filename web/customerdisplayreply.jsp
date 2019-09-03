<%-- 
    Document   : customerdisplayreply
    Created on : 18-Mar-2019, 12:22:15
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="customerheader.jsp" %>

<%    DbUse dbUse = new DbUse();
    String ticketId = request.getParameter("ticketId").toString();
    out.print(ticketId);
    ResultSet result = dbUse.DisplayAllRepliesById(ticketId);
    String value = "";
    if (result.next()) {
        value = result.getString(7);
        out.print(value);
    }
    Integer count = dbUse.CountDisplayAllRepliesById(String.valueOf(ticketId));
    Integer num = 0;

%>

<section class="information">
    <h3 class="heading-three text-center">
        Reply
    </h3>
    <% if (count > 0) {%>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <div class="container reply-container">
                <p><b>From: Administrator</b></p><br>
                <p><b>To: Me </b></p><br>
                <p><b>Reply Description: <%= result.getString(6)%><span id="reply">...</span><span id="more_info"><br><br>
                            Feedback Date: <%= result.getString(5)%><br><br>
                            Reply Date: <%= result.getString(7)%><br><br>
                            Customer Name: <%= dbUse.UserNameById(result.getString(1))%><br><br>
                            Email: <%= dbUse.UserEmailById(result.getString(1))%><br><br>
                            Feedback Subject: <%= result.getString(2)%><br><br>
                            Feedback Type: <%= dbUse.TicketTypeById(result.getString(3))%><br><br>
                            Feedback Description: <%= result.getString(4)%><br><br>
                            <br>
                        </span></b></p>   
                <button onclick="myInfo()" id="myReply">View Details</button>

                <script>
                    function myInfo() {
                        var reply = document.getElementById("reply");
                        var moreInfo = document.getElementById("more_info");
                        var textBtn = document.getElementById("myReply");

                        if (reply.style.display === "none") {
                            reply.style.display = "inline";
                            textBtn.innerHTML = "Read more";
                            moreInfo.style.display = "none";
                        } else {
                            reply.style.display = "none";
                            textBtn.innerHTML = "Read less";
                            moreInfo.style.display = "inline";
                        }
                    }
                </script>

            </div>
        </div>
        <% } else { %>
        <div class="delete-text">
            <h3>There has not been any reply to your queries yet.</h3>
        </div>
        <% }%>
    </div>
</section>
<%@include file="footer.jsp" %>


