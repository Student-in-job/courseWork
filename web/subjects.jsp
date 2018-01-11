<%-- 
    Document   : subjects
    Created on : 13.10.2017, 12:23:39
    Author     : ksinn
--%>
    <%
        if(request.getSession().getAttribute("student")==null)
            response.sendRedirect("home?m=Only for avtorized&l=d");
        else {   
    %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="subjects" dataSource="jdbc/DB">
    select * from subjects where id in(select subject_id from subject_group where group_id = ${student.groupId})
</sql:query>
<% String [] menu = {"", "", "", "", ""}; %>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>List of available subjects:</h1>
    <div>
        <c:forEach items="${subjects.rows}" var="subject">
            <p><a href="themes?s=${subject.id}">${subject.name}</a></p>
        </c:forEach>
    </div>

</div>
<%@include file="/footer.jsp" %>
<%}%>