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
<h3 class="text-center">Groups</h3>   
<hr/>

<!--Match group whith subject-->
<c:if test="${(not empty param.group_id)&&(not empty param.subj_id)}">
        <sql:update dataSource="jdbc/DB">
            insert into subject_group(subject_id, group_id) values (?,?)
            <sql:param value="${param.subj_id}" />
            <sql:param value="${param.group_id}" />
        </sql:update>
    <div class="alert alert-success"><h4 class="text-center">Match was successfully added!</h4></div>
</c:if>


<!--Selects all groups -->
<sql:query var="groups" dataSource="jdbc/DB">
    select * from groups
</sql:query>

<!--Selects all sabjects -->
<sql:query var="subjects" dataSource="jdbc/DB">
    select * from subjects
</sql:query>   
<div class="jumbotron">
    <h4>Add match</h4>
    <br/>
    <form role="form" action="" method="post">
        <div class="form-group">
            <label for="group_id">Group number</label>
            <select class="form-control" name="group_id">
                <c:forEach var="group" items="${groups.rows}">
                    <option value="${group.id}">${group.number}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="subj_id">Subject name</label>
            <select class="form-control" name="subj_id">
                <c:forEach var="subj" items="${subjects.rows}">
                    <option value="${subj.id}">${subj.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-default">Create</button>    
    </form>    
</div>
<div class="row marketing">
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