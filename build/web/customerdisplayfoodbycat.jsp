<%-- 
    Document   : customerdisplayfoodbycat
    Created on : 05-Apr-2019, 12:50:06
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>

<% 
    DbUse cat = new DbUse();
    String catId = request.getParameter("catId").trim();
    String cat_name = cat.CategoryNameById(catId);
    //out.print(catId);
    ResultSet result = cat.FoodItemDisplayByCat(catId);
    
%>

<section class="information">
    <h3 class="heading-three text-center">
        <%=cat_name %>
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
             <table method="post" action="addtocart.jsp">
                
                <div class="row cat_row">
                    <% 
                     try {
                    while (result.next()) {
                %>
                    <div class="cat_column">
                        <div class="category">
                            <a href="addtocart.jsp?&foodId=<%=result.getString(1) %>"><img src="upload/<%=result.getString(6)%>" width="250" height="150" class="cat_image"/></a>
                        </div>
                        <ul class="food">
                            <li>
                                <h4 class='text-justify'>Food Name: <b><%= result.getString(3) %></b></h4>
                            </li>
                            <li>
                                <h4 class='text-justify text-limit'>Description: <b><%= result.getString(4) %></b></h4>
                                <a href="foodreadmore.jsp?&foodId=<%=result.getString(1)%>" class="read-more"><b><i><u>read more</u></i></b></a>
                            </li>
                            <li>
                                <h4 class='text-justify'>Price: <b><%= result.getString(5) %></b></h4>
                            </li>
                            <li>
                                <a href="addtocart.jsp?&foodId=<%=result.getString(1)%>" class="btn btn-danger order-btn cart-btn" role="button">Add To Cart</a>
                            </li>
                        </ul>
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
