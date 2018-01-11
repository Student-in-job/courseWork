<%-- 
    Document   : error
    Created on : 07.10.2017, 16:11:14
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String [] menu = {"active", "", "", "", ""}; %>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>Choose coursework</h1>
    <p>The system will allow you to fix the theme of coursework.</p>
</div>
<div class="well well-sm">
    <p>
        ${pageContext.exception.message}
    </p>
</div>
<%@include file="/footer.jsp" %>
