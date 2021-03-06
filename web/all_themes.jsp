<%-- 
    Document   : students
    Created on : 07.10.2017, 18:03:55
    Author     : ksinn
--%>
<%
    if (request.getSession().getAttribute("student") == null)
        response.sendRedirect("home?m=Only for avtorized&l=d");
    else {
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<% String[] menu = {"", "active", "", "", ""};%>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <a href="subjects" class="btn btn-primary">Choose themes</a>
</div>

<sql:query var="subjects" dataSource="jdbc/DB">
    select subjects.id as id, name
    from subjects join subject_group on subjects.id = subject_id
    where ${student.groupId} = group_id 
</sql:query>  

<c:forEach var="subject" items="${subjects.rows}">
    <sql:query var="students" dataSource="jdbc/DB">
        select name, surname, accept_date, title 
        from themes left join (works join (select * from students where group_id=${student.groupId}) s on s.id=stud_id) on theme_id = themes.id
        where themes.subject_id = ${subject.id}
    </sql:query> 
    <div class="jumbotron">
        <h3>${subject.name}</h3>
        <table class="table">
            <tr>
                <th>Theme</th>
                <th>Name</th>
                <th>Date when accepted</th>
            </tr>
            <c:forEach var="student" items="${students.rows}">
                <tr>
                    <td>${student.title}</td>
                    <td>${student.surname} ${student.name}</td>
                    <td>${student.accept_date}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:forEach>

<%@include file="/footer.jsp" %>
<%}%>
