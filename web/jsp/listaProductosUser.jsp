
<%@page import="skylinksystem.dao.ProductoAdm"%>
<%@page import="skylinksystem.modelo.Producto"%>
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
                if (session.getAttribute("user") != null) {
                    String name = (String) session.getAttribute("user");

                    ArrayList<Producto> listaProducto = (ArrayList) request.getAttribute("alistaProducto");
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

        <h1 align = "center"> Consulta de Productos Sin BD- Skylink </h1>
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

                <%
                    ProductoAdm producto = new ProductoAdm();
                    ArrayList<Producto> listaProducto1 = producto.getListaProductoSinBD();
                %>
            </thead>
            <%
                for (int i = 0; i < listaProducto1.size(); i++) {
            %>
            <tr>
                <td><%=listaProducto1.get(i).getCodigoProducto()%></td>
                <td><%=listaProducto1.get(i).getDescripcion()%></td>
                <td><%=listaProducto1.get(i).getIdCategoria()%></td>
                <td><%=listaProducto1.get(i).getPrecioProducto()%></td>
                <td><%=listaProducto1.get(i).getStockProducto()%></td>
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
