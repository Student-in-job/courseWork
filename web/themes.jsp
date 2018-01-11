<%-- 
    Document   : themes
    Created on : 06.10.2017, 12:28:56
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String [] menu = {"", "", "", "", ""}; %>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>List of available themes:</h1>
    <p>Only free themes are displayed on this page. But remember, while you choose, someone can take a topic from this list!</p>

    <form action="handler" method="post">
        <c:forEach items="${themes}" var="theme">
            <div class="radio">
                <label>
                    <input type="radio" name="t" value="${theme.id}">
                    ${theme.name}
                </label>
            </div>
        </c:forEach>
        <button type="submit" class="btn btn-primary">Take selected theme</button>
    </form>

</div>
<%@include file="/footer.jsp" %>
