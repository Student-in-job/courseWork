<%-- 
    Document   : groups
    Created on : 08.01.2018, 4:34:10
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%@include file="admin_header.jsp" %>

<h3 class="text-center">Groups</h3>   
<hr/>
<c:if test="${not empty param.number}">
    <sql:update var="count" dataSource="jdbc/DB">
        insert into groups(number) values (?)
        <sql:param value="${param.number}"></sql:param>
    </sql:update>
    <div class="alert alert-success"><h4 class="text-center">${count} Group was successfully created!</h4></div>
</c:if>
<div class="jumbotron">
    <h4>Add Group</h4>
    <br/>
    <form role="form" action="" method="post">
        <div class="form-group">
            <label for="number">Number of the group</label>    
            <input type="text" class="form-control" name="number" value="${param.number}" required >
        </div>
            <button type="submit" class="btn btn-default">Create</button>    
    </form>    
</div>
<div class="row marketing">
    <sql:query var="groups" dataSource="jdbc/DB">select * from groups</sql:query>
    <table class="table table-striped table-responsive">
        <caption><h3 class="text-center">List of groups</h3></caption>
        <thead>
            <tr>
                <td>ID</td>
                <td>Number</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="group" items="${groups.rows}">
            <tr>
                <td>${group.id}</td>
                <td>${group.number}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="/footer.jsp" %>

