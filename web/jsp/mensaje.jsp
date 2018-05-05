<%-- 
    Document   : mensaje
    Created on : 18-abr-2018, 16:39:59
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
        <h1>Estima usuario: <%=
            request.getParameter("pusername")
            %></h1>
            
            <p><%=request.getParameter("pmensaje")
                %></p>
    </body>
</html>
