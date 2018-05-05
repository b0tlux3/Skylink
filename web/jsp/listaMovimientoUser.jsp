<%@page import="skylinksystem.modelo.Movimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE MOVIMIENTOS GENERAL - USUARIO</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("user") != null) {
                    String name = (String) session.getAttribute("user");
                    //out.print("Hello, " + name + "  Welcome to ur Profileasaaaaaaaaaa");
                    ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  

        <h1 align = "center"> Consulta de Movimientos USER - Skylink </h1>
        <br>
        <p>
            <a href = "jsp/menuPrincipalUser.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
        </p>
        <br>

        <table class = "table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th> ID </th>
                    <th> Documento </th>
                    <th> Fecha </th>
                    <th> Usuario </th>
                    <th> Producto </th>
                    <th> Cantidad </th>

                </tr>
            </thead>
            <%
                for (int i = 0; i < listaMovimiento.size(); i++) {
            %>     
            <tr>
                <td>
                    <%=listaMovimiento.get(i).getIdMovimiento()%>
                </td>
                <td>
                    <%=listaMovimiento.get(i).getNumDocumento()%>
                </td>
                <td>
                    <%=listaMovimiento.get(i).getFechaDocumento()%>
                </td>
                <td>
                    <%=listaMovimiento.get(i).getUsuarioDocumento()%>
                </td>     
                <td>
                    <%=listaMovimiento.get(i).getCodigoProducto()%>
                </td>     
                <td>
                    <%=listaMovimiento.get(i).getCantidadProducto()%>
                </td>     

            </tr>                
            <%
                }
            %>
        </table>
        <%
                } else {
                    response.sendRedirect("../index.jsp");
                }
            }
        %>   

    </body>
</html>
