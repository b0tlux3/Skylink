<%-- 
    Document   : logout
    Created on : 20-abr-2018, 1:03:05
    Author     : Usuario-Clone0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            session.invalidate();
        %>
        <h1><font color="Black">You are Sucessfully logged out...</font></h1>
        <a href="../index.jsp">Ir al Login</a>
        
    </body>
</html>
