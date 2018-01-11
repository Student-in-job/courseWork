<%-- 
    Document   : group_themes
    Created on : 11.01.2018, 9:39:20
    Author     : Vitaliy Pak
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="groups" dataSource="jdbc/DB">
    select * from groups
</sql:query>
<%@include file="admin_header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="panel-group" id="accordion">
    <c:forEach var="group" items="${groups.rows}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <a data-toggle="collapse" data-parent="#accordion" href="#${group.id}">
                <h4 class="panel-title">${group.number}</h4>
            </a>
        </div>
        <div id="${group.id}" class="panel-collapse collapse">
            <div class="panel-body">
                <sql:query var="subjects" dataSource="jdbc/DB">
                    select * from subjects where id in (select subject_id from subject_group where group_id = ${group.id})
                </sql:query>
                <c:forEach var="subject" items="${subjects.rows}">
                    <h3>
                        ${subject.name}
                        <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#${group.id}${subject.id}" aria-expanded="false" aria-controls="collapseExample">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                        </button>
                    </h3>
                    <div class="collapse" id="${group.id}${subject.id}">
                        <table class="table table-bordered">
                            <caption>${subject.name}</caption>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Theme</th>
                                </tr>
                            </thead>
                            <tbody>
                                <sql:query var="themes" dataSource="jdbc/DB">
                                    select t.title, concat(sw.surname, " ", sw.name) as fullname 
                                    from
                                        themes t left join
                                        (select s.*, w.theme_id from students s join works w on w.stud_id = s.id where w.subject_id = ${subject.id} and w.group_id = ${group.id}) sw
                                        on t.id = sw.theme_id 
                                </sql:query>
                                <c:forEach var="theme" items="${themes.rows}">
                                    <tr>
                                        <td>${theme.title}</td>
                                        <td>${theme.fullname}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </div>  
    </div>
    </c:forEach>
</div>
<%@include file="/footer.jsp" %>