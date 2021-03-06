<%-- 
    Document   : header
    Created on : 06.10.2017, 22:30:38
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>CourseWork</title>

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">

    </head>

    <body>

        <div class="container">

            <!-- Static navbar -->
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">CourseWork</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="<%=menu[0]%>"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                            <li class="<%=menu[1]%>"><a href="${pageContext.request.contextPath}/all_themes">Themes</a></li>
                            <li class="<%=menu[2]%>"><a href="${pageContext.request.contextPath}/about">About</a></li>
                            <li class="<%=menu[3]%>"><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                            <li class="dropdown <%=menu[4]%>">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/admin/subjects.jsp">Subjects</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/themes.jsp">Themes</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/groups.jsp">Groups</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/students.jsp">Students</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/subject_group.jsp">Groups' subjects</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/list_pass.jsp">Students' passwords</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/students_themes.jsp">Students' themes</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/group_themes.jsp">Themes chosen by students</a></li>
                                </ul>
                            </li>
                        </ul> 
                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${student!=null}">
                                <li class="active">
                                    <a>${student.name} ${student.name2}</a>
                                </li>
                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a> 
                                </li>
                            </c:if>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>
            <%
                String mes = request.getParameter("m");
                if (mes != null) {
                    String l = request.getParameter("l") == null ? "d" : request.getParameter("l");

                    String mod;
                    switch (l) {
                        case "s": {
                            mod = "success";
                            break;
                        }
                        case "i": {
                            mod = "info";
                            break;
                        }
                        case "w": {
                            mod = "warning";
                            break;
                        }
                        default:
                            mod = "danger";
                    }

            %>
            <div class="alert alert-<%=mod%>" role="alert"><%=mes%></div>
            <%}%>
            <div style="min-height: 38px;display: block">