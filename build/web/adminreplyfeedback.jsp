<%-- 
    Document   : customerreplyfeedback
    Created on : 10-Mar-2019, 17:53:37
    Author     : Bishnu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="adminheader.jsp" %>

<%    DbUse dbUse = new DbUse();
    String ticketId = request.getParameter("ticketId").trim();
    ResultSet result = dbUse.FeedbackDetailById(Integer.valueOf(ticketId));
    result.first();
    
    
%>

<section class="information">
    <h3 class="heading-three text-center">
        Feedback Detail
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <div class="container reply-container">
                
                <p><b>From: <%= dbUse.UserNameById(result.getString(2))%></b></p><br>
                <p><b>To: Me </b></p><br>
                <p><b>Subject: <%= result.getString(3)%><span id="reply">...</span><span id="more_info"><br><br>
                            Feedback Date: <%= result.getString(6)%><br><br>
                            Feedback Type: <%= dbUse.TicketTypeById(result.getString(4))%><br><br>
                            Feedback Description: <%= result.getString(5)%><br><br>
                            
                            
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

        <h3 class="heading-three text-center">
            Add The Reply
        </h3>
        <div class="form-content">
            <form name="detail" method="post" class="confirm-form" action="/spicebox/InsertReply">
                <label>Reply:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter reply for feedback" name="description"> 
                <input type="hidden" name="ticketId" value="<%= ticketId%>">
                       <br>
                <input type="submit" value="Enter" class="btn btn-primary add-button" onclick="myAddMessage()">
                <script>
                    function myAddMessage() {
                        alert("Reply Successfully Added!");
                    }
                </script>
            </form>
        </div>
    </div>
    </div>
</section>
<%@include file="footer.jsp" %>

