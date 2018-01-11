<%-- 
    Document   : home
    Created on : 06.10.2017, 14:02:35
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String [] menu = {"active", "", "", "", ""}; %>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>Choose coursework</h1>
    <p>The system will allow you to fix the theme of coursework. Please enter your one-time password and proceed to select. You can see the information in the <a href="about">About</a> section before you start.</p>
    <p>
    <form action="start" method="post">
        <div class="form-group col-xs-2">
            <input name="p" type="text" class="form-control" placeholder="password">
        </div>
        <div class="form-group col-xs-2">
            <button type="submit" class="btn btn-primary">Start choosing</button>
        </div>  
    </form>
</p>
</div>
<%@include file="/footer.jsp" %>
