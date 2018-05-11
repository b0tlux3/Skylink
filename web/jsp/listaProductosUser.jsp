
<%@page import="skylinksystem.vo.Producto"%>
<%@page import="skylinksystem.dao.ProductoAdm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE PRODUCTOS GENERAL</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("bUsuariob") != null) {
                    String name = (String) session.getAttribute("bUsuariob");

                    ArrayList<Producto> listaProducto = (ArrayList) request.getAttribute("alistaProductoUser");
        %>  

        <h1 align = "center"> Consulta de Productos - Skylink </h1>
        <br>
        <p>
            <a href = "jsp/menuPrincipalUser.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
        </p>
        <br>

        <table class = "table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th> ID </th>
                    <th> Descripcion </th>
                    <th> Precio </th>
                    <th> Stock </th>
                    <th> Categoria </th>

                </tr>
            </thead>
            <%
                for (int i = 0; i < listaProducto.size(); i++) {
            %>     
            <tr>
                <td>
                    <%=listaProducto.get(i).getCodigoProducto()%>
                    <%
                        String codigoProducto = listaProducto.get(i).getCodigoProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getDescripcion()%>
                    <%
                        String descripcionProducto = listaProducto.get(i).getDescripcion();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getPrecioProducto()%>
                    <%
                        String precioProducto = listaProducto.get(i).getPrecioProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getStockProducto()%>
                    <%
                        String stockProducto = listaProducto.get(i).getStockProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getIdCategoria()%>
                    <%
                        String idCategoriaProducto = listaProducto.get(i).getIdCategoria();
                    %>
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
