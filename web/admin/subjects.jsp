<%-- 
    Document   : subjects
    Created on : 08.01.2018, 2:27:56
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%@include file="admin_header.jsp" %>

<h3 class="text-center">Subjects</h3>   
<hr/>
<c:if test="${not empty param.name}">
    <sql:update var="count" dataSource="jdbc/DB">
        insert into subjects(name) values (?)
        <sql:param value="${param.name}"></sql:param>
    </sql:update>
    <div class="alert alert-success"><h4 class="text-center">${count} subject was successfully created!</h4></div>
</c:if>
<div class="jumbotron">
    <h4>Add subject</h4>
    <br/>
    <form role="form" action="" method="post">
        <div class="form-group">
            <label for="name">Name of subject</label>    
            <input type="text" class="form-control" name="name" value="${param.name}" required >
        </div>
            <button type="submit" class="btn btn-default">Create</button>    
    </form>    
</div>
<div class="row marketing">
    <sql:query var="subjects" dataSource="jdbc/DB">select * from subjects</sql:query>
    <table class="table table-striped table-responsive">
        <caption><h3 class="text-center">List of subjects</h3></caption>
        <thead>
            <tr>
                <td>ID</td>
                <td>Name</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="subject" items="${subjects.rows}">
            <tr>
                <td>${subject.id}</td>
                <td>${subject.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="/footer.jsp" %>
