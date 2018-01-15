<%-- 
    Document   : students
    Created on : 14.01.2018, 21:55:25
    Author     : developer
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@include file="admin_header.jsp" %>

<!--Adds student to group -->
<c:if test="${(not empty param.group_id)&&(not empty param.surname)&&(not empty param.sname)}">
    <sql:update dataSource="jdbc/DB">
        insert into students(surname, name, group_id) values (?,?,?)
        <sql:param value="${param.surname}" />
        <sql:param value="${param.sname}" />
        <sql:param value="${param.group_id}" />
    </sql:update>
    <div class="alert alert-success"><h4>Student was successfully created!</h4></div>
</c:if>

<!--Adds students to group-->
<c:if test="${(not empty param.group_id)&&(not empty param.students)}">
    <% int row_count = 0;%>
    <c:forTokens var="addstudent" items="${param.students}" delims = ";">
        <% row_count++; String[] fields = ((String)pageContext.getAttribute("addstudent")).split(","); %>
        <sql:update dataSource="jdbc/DB">
            insert into students(surname, name, group_id) values (?,?,?)
            <sql:param value="<%=fields[1]%>" />
            <sql:param value="<%=fields[0]%>" />
            <sql:param value="${param.group_id}" />
        </sql:update>
    </c:forTokens>
    <div class="alert alert-success"><h4 class="text-center"><%=row_count%> Students was successfully added!</h4></div>
</c:if>
<!--Selects all groups -->
<sql:query var="groups" dataSource="jdbc/DB">
    select * from groups
</sql:query>
    
<!-- Nav tabs -->
<ul class="nav nav-tabs">
  <li class="active"><a href="#students" data-toggle="tab">Students</a></li>
  <li><a href="#addStudent" data-toggle="tab">Add students</a></li>
  <li><a href="#groupAdd" data-toggle="tab">Batch student add</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div class="tab-pane" id="addStudent">
        <div class="panel panel-default">
            <div class="panel-body">
                <form role="form" action="" method="post">
                    <div class="form-group">
                        <label for="surname">Surname</label>
                        <input type="text" class="form-control" name="surname" value="${param.surname}" required=""/>
                    </div>
                    <div class="form-group">
                        <label for="sname">Name</label>
                        <input type="text" class="form-control" name="sname" value="${param.sname}" required=""/>
                    </div>
                    <div class="form-group">
                        <label for="group_id">Group number</label>
                        <select class="form-control" name="group_id">
                            <c:forEach var="group" items="${groups.rows}">
                                <option value="${group.id}">${group.number}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Save</button>    
                </form>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="groupAdd">
        <div class="panel panel-default">
            <div class="panel-body">
                <form role="form" action="" method="post">
                    <div class="form-group">
                        <label for="students">Students (Devide each student by ";" and surname and name with ",")</label>
                        <textarea class="form-control" name="students" value="${param.students}" required="" style="height: 250px"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="group_id">Group number</label>
                        <select class="form-control" name="group_id">
                            <c:forEach var="group" items="${groups.rows}">
                                <option value="${group.id}">${group.number}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Save</button>    
                </form>
            </div>
        </div>
    </div>                
    
    <div class="tab-pane active" id="students">
        <div style="float: right">
        <form role="form" action="" method="post">
            <div class="form-group">
                <select name="groupid" class="form-control-static">
                    <c:forEach var="group" items="${groups.rows}">
                        <option value="${group.id}">${group.number}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-default">Filter</button>
            </div>
        </form>
        </div>
        <div style="clear: right"></div>
        <c:choose>
            <c:when test="${not empty param.groupid}">
                <sql:query var="students" dataSource="jdbc/DB">
                    select * from students where group_id = ${param.groupid}
                </sql:query>
            </c:when>
            <c:otherwise>
                <sql:query var="students" dataSource="jdbc/DB">
                    select * from students
                </sql:query>
            </c:otherwise>
        </c:choose>
        <table class="table table-stripped table-responsive">
            <thead>
                <tr>
                <th>id</th>
                <th>surname</th>
                <th>name</th>
                <th>group_id</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students.rows}">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.surname}</td>
                    <td>${student.name}</td>
                    <td>${student.group_id}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="/footer.jsp" %>
