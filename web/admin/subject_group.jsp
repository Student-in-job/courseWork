<%-- 
    Document   : subject_group
    Created on : 07.01.2018, 23:31:55
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="groups" dataSource="jdbc/DB">
    select * from groups order by number
</sql:query>
<%@include file="admin_header.jsp" %>
<div class="jumbotron" style="background-color: white">
    <h2>Subject for group</h2>
    <table class="table table-stripped table-condensed">
	   <thead>
            <tr>
                <th>Group</th>
                <th>Subjects for group</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="group" items="${groups.rows}">
            <tr>
                <td>${group.number}</td>
                <td>
                    <sql:query var="subjects" dataSource="jdbc/DB">
                        select * from subjects where id in (select subject_id from subject_group where group_id = ${group.id})
                    </sql:query>
                    <c:forEach var="subject" items="${subjects.rows}">
                        <span>${subject.id}</span>
                        <span>|</span>
                        <span>${subject.name}</span>
                        <br/>
                    </c:forEach>
                </td>
            </tr>    
            </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="/footer.jsp" %>