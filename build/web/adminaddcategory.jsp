<%-- 
    Document   : adminaddcategory
    Created on : 04-Apr-2019, 13:57:25
    Author     : Bishnu
--%>
<%@include file="adminheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        Add Food Category
    </h3>
    <div class="container-fluid food-display-table">
        <div class="button">
            <a href="adminaddcategory.jsp" class="btn btn-default add-btn active" role="button">Add</a>
            <a href="admindisplaycategory.jsp" class="btn btn-default display-btn " role="button">Display</a>
        </div>
        <div class="form-content ">
            <form method="post" action="/spicebox/AddCat" enctype="multipart/form-data">
                <label>Category:</label>
                <input type="text" class="form-control input-lg" placeholder="Enter Food Category" name="cat_name">
                <label>Image Link:</label>
                <input type="file" name="file">
                <input type="submit" value="Add" class="btn btn-primary add-button" onclick="myAddMessage()">
            </form>
            <script>
                    function myAddMessage() {
                        alert("Category Successfully Added!"); // alert to show the cussess of the process
                    }
                </script>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
