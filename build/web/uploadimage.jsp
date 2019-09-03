<%-- 
    Document   : uploadimage
    Created on : 08-Apr-2019, 13:16:26
    Author     : Bishnu
--%>
<% 
//    String catId = request.getParameter("catId");
//    out.print(catId);
%>
<%@include file="adminheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        Add Food Category
    </h3>
    <div class="container-fluid food-display-table">
        <div class="form-content ">
            <form method="post" action="/spicebox/CategoryImage" enctype="multipart/form-data">
                <label>Category Image:</label>
                <input type="file" class="form-control input-lg" placeholder="Enter Category Image" name="file">
                <!--<input type="hidden" value="" name="catId"/>-->
                <input type="submit" value="Add" class="btn btn-primary add-button">
            </form>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
