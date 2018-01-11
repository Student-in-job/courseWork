<%-- 
    Document   : password_list.jsp
    Created on : 06.10.2017, 20:43:29
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <c:forEach items="${list}" var="pass">
                <p>${pass.key.name2} ${pass.key.name} : ${pass.value}</p>
            </c:forEach>
        </div>

        <div>
            <c:forEach items="${list}" var="pass">
                <p>
                    insert into passwords(stud_id, pass) values (${pass.key.id}, '${pass.value}');
                </p>
            </c:forEach>
        </div>
    </body>
</html>
