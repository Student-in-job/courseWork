<%-- 
    Document   : students
    Created on : 07.10.2017, 18:03:55
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="groups" dataSource="jdbc/DB">
    select id, number from groups
</sql:query>
<%@include file="admin_header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h2>Chosen themes</h2>
    <c:forEach var="group" items="${groups.rows}">
        <h3>
            ${group.number} <a href="generatePasswords.jsp?g=${group.id}" ><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span></a>
            <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#${group.id}" aria-expanded="false" aria-controls="collapseExample">
                <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
            </button>
        </h3>
        <sql:query var="students" dataSource="jdbc/DB">
            select name, surname, accept_date, (select title from themes where id = theme_id) as title from students left join works on students.id=stud_id where students.group_id=${group.id}        
        </sql:query>        
        <div class="collapse" id="${group.id}">
            <div class="well">
                <table class="table">
                    <tr>
                    <th>Name</th>
                    <th>Theme</th>
                    <th>Date when accepted</th>
                    </tr>
                <c:forEach var="student" items="${students.rows}">
                    <tr>
                        <td>${student.surname} ${student.name}</td>
                        <td>${student.title}</td>
                        <td>${student.accept_date}</td>
                    </tr>
                </c:forEach>
                </table>
            </div>
        </div>
    </c:forEach> 
</div>
<%@include file="/footer.jsp" %>

