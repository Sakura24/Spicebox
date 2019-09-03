<%-- 
    Document   : displayfood
    Created on : 20-Apr-2019, 15:57:27
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ejbs.DbUse"%>
<%@include file="header.jsp" %>

<% DbUse cat = new DbUse();
    ResultSet result = cat.CategoryDisplay();
    String count = "";
    Integer catCount = 0;
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        Category of Food Items
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >
                
                <div class="row cat_row">
                    <% 
                     try {
                    while (result.next()) {
                    count = result.getString(1);
                    catCount = cat.FoodItemByCatCount(count);    
                    

                %>
                
                    <div class="cat_column">
                        <div class="category">
                            <a href='displayfoodbycat.jsp?&catId=<%=result.getString(1) %>'><img src="upload/<%=result.getString(3)%>" width="250" height="150" class="cat_image"/></a>
                        </div>
                        <a href='displayfoodbycat.jsp?&catId=<%=result.getString(1) %>' class="cat_name"><b><i><u><%= result.getString(2) %> [<%= catCount %>]</b></i></u></a>
                    </div>
                    
                    <%

                    }

                } catch (Exception e) {
                    System.out.println("Error : " + e);
                }

            %>

                </div>
            </table>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>



