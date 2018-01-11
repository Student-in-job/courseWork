<%-- 
    Document   : list_pass
    Created on : 07.01.2018, 23:31:55
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="groups" dataSource="jdbc/DB">
    select * from groups
</sql:query>
<%@include file="admin_header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <c:forEach var="group" items="${groups.rows}">
        <h3>
            ${group.number}
            <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#${group.id}" aria-expanded="false" aria-controls="collapseExample">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </button>
        </h3>
        <sql:query var="students" dataSource="jdbc/DB">
            select * from students s join passwords p on s.id = p.stud_id where s.group_id = ${group.id}
        </sql:query>        
        <div class="collapse" id="${group.id}">
            <div class="well">
                <table class="table">
                    <tr>
                        <th>№</th>
                        <th>name surname</th>
                        <th>password</th>
                    </tr>
                <% int counter = 1; %>
                <c:forEach var="student" items="${students.rows}">
                    <tr>
                        <td><%=counter++%></td>
                        <td>${student.surname}&nbsp${student.name}</td>
                        <td>${student.pass}</td>
                    </tr>
                </c:forEach>
                </table>
            </div>
        </div>
    </c:forEach>
</div>
<%@include file="/footer.jsp" %>