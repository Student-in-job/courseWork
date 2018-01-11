<%-- 
    Document   : students
    Created on : 07.01.2018, 18:03:55
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<sql:query var="subjects" dataSource="jdbc/DB">
  select * from subjects
</sql:query>
<%@include file="admin_header.jsp" %>
<c:if test="${(not empty param.themes)&&(not empty param.subjectid)}">
    <% int row_count = 0;%>
    <c:forTokens var="theme" items="${param.themes}" delims = ";">
        <% row_count++; %>
        <sql:update dataSource="jdbc/DB">
            insert into themes(title, subject_id) values (?,?)
            <sql:param value="${theme}" />
            <sql:param value="${param.subjectid}" />
        </sql:update>
    </c:forTokens>
    <div class="alert alert-success"><h4 class="text-center"><%=row_count%> Themes was successfully created!</h4></div>
</c:if>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#themes" data-toggle="tab">Show theme</a></li>
        <li><a href="#add_theme" data-toggle="tab">Add theme</a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane" id="add_theme">
            <form role="form" action="" method="post">
                <div class="form-group">
                    <label for="subject">Name of subject</label>    
                    <select class="form-control" name="subjectid" value="${param.subjectid}" required>
                        <c:forEach var="subject" items="${subjects.rows}">
                            <option value="${subject.id}">${subject.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="themes">Add themes</label>    
                    <textarea type="text" class="form-control" name="themes" value="${param.themes}" required style="height:150px"></textarea>
                </div>
                <button type="submit" class="btn btn-default">Save</button>    
            </form>
        </div>
        <div class="tab-pane active" id="themes">
            <c:forEach var="subject" items="${subjects.rows}">
                <h3>
                    ${subject.name}
                    <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#${subject.id}" aria-expanded="false" aria-controls="collapseExample">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                    </button>
                </h3>
                <sql:query var="themes" dataSource="jdbc/DB">
                    select title from themes where subject_id=${subject.id}        
                </sql:query>        
                <div class="collapse" id="${subject.id}">
                    <div class="well">
                        <table class="table">
                            <tr>
                            <th>Theme</th>
                            </tr>
                        <c:forEach var="theme" items="${themes.rows}">
                            <tr>
                                <td>${theme.title}</td>
                            </tr>
                        </c:forEach>
                        </table>
                    </div>
                </div>
            </c:forEach> 
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>

