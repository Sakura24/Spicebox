<%-- 
    Document   : admindisplayreply
    Created on : 12-Mar-2019, 12:41:44
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%    DbUse dbUse = new DbUse();
    //String ticketId = request.getParameter("ticketId").trim();
    String ticketId = session.getAttribute("ticketId").toString();
    ResultSet result = dbUse.ReplyDetail(Integer.valueOf(ticketId));
    result.first();
    
%>

<section class="information">
<h3 class="heading-three text-center">
    Reply
</h3>
<div class="container-fluid food-display-table">
    <div class="table-content">
        <div class="container reply-container">
                <p><b>From: <%= dbUse.UserNameById(result.getString(1))%></b></p><br>
                <p><b>To: Me </b></p><br>
                <p><b>Reply Description: <%= result.getString(6)%><span id="reply">...</span><span id="more_info"><br><br>
                            Feedback Date: <%= result.getString(5)%><br><br>
                            Reply Date: <%= result.getString(7)%><br><br>
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
            <a href="admindisplayfeedback.jsp" class="btn btn-default back-btn" role="button" onclick="myAddMessage()">Back</a>
<script>
                    function myAddMessage() {
                        alert("Reply Successfully Sent to the respective customer!");
                    }
                </script>
</div>
</section>
<%@include file="footer.jsp" %>
