<%-- 
    Document   : footer
    Created on : 06.10.2017, 22:31:14
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
            </div>
            <footer style="background-color: #e2e2e2; padding: 10px 10px">&copy Copyright TUIT <%=new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %></footer>
        </div> <!-- /container -->
        
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    </body>
</html>
