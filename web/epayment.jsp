<%-- 
    Document   : epayment
    Created on : 23-Apr-2019, 19:59:01
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%
    DbUse display = new DbUse();
    int num = 0;
    int num1 = 0;
    String usrEmail = session.getAttribute("uemail").toString();
    Integer orderNo = (Integer) session.getAttribute("orderNo");
    ResultSet result = display.DeliveryDisplayByOrderId(String.valueOf(orderNo));
    ResultSet userResult = display.OrderDetailAndImageOrderId(String.valueOf(orderNo));
    int orderDetailCount = 0;
    orderDetailCount = display.CountOrderDetail();
    ResultSet orderResult = display.OrderDetailDisplay();
    ResultSet totalResult = display.TotalDisplay(String.valueOf(orderNo));
    String grand_total = request.getParameter("grand_total");
    out.print(grand_total);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>-->
<!--    <body>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
            <input type="text" name="cmd" value="_cart">
            <input type="text" name="business" value="mijalashakya4-facilitator@gmail.com">
            <input type="text" name="item_name" value="hat">
            <input type="text" name="item_number" value="123">
            <input type="text" name="amount" value="<%=grand_total%>">
            <input type="text" name="first_name" value="John">
            <input type="text" name="last_name" value="Doe">
            <input type="text" name="address1" value="9 Elm Street">
            <input type="text" name="address2" value="Apt 5">
            <input type="text" name="city" value="Berwyn">
            <input type="text" name="state" value="PA">
            <input type="text" name="zip" value="19312">
            <input type="text" name="night_phone_a" value="610">
            <input type="text" name="night_phone_b" value="555">
            <input type="text" name="night_phone_c" value="1234">
            <input type="text" name="email" value="jdoe@zyzzyu.com">
            <input type="image" name="submit"
                   src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
                   alt="PayPal - The safer, easier way to pay online">
        </form>
    </body>-->
<head>
    <!-- Add meta tags for mobile and IE -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
</head>

<body>
    <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '0.01'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                });
            }


        }).render('#paypal-button-container');
    </script>
</body>
    
</html>
