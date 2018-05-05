<%@page import="skylinksystem.modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

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
                    ArrayList<Producto> listaProducto = (ArrayList) request.getAttribute("plistaProducto");
        %>  

        <h1 align = "center"> Consulta de Productos Admin - Skylink </h1>
        <br>

        <p align= "center" >
            <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-primary " > <span class = "glyphicon glyphicon-home" aria-hidden = "true"> </span> Menu Principal </a>
            <a href = "jsp/AddProductoAdm.jsp" class = "btn btn-success"> <span class = "fas fa-plus" aria-hidden = "true"> </span> Agregar Productos </a>
        </p>
        <br>

        <table class = "table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th> ID </th>
                    <th> Descripcion </th>
                    <th> Precio </th>
                    <th> Stock </th>
                    <th> Categoria     Accion </th>
                    <th> Accion </th>

                </tr>
            </thead>
            <%
                for (int i = 0; i < listaProducto.size(); i++) {
            %>     
            <tr>
                <td>
                    <%=listaProducto.get(i).getCodigoProducto()%>
                    <%
                        String codigo = listaProducto.get(i).getCodigoProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getDescripcion()%>
                    <%
                        String descripcion = listaProducto.get(i).getDescripcion();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getPrecioProducto()%>
                    <%
                        String precio = listaProducto.get(i).getPrecioProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getStockProducto()%>
                    <%
                        String stock = listaProducto.get(i).getStockProducto();
                    %>
                </td>
                <td>
                    <%=listaProducto.get(i).getIdCategoria()%>
                    <%
                        String idCategoria = listaProducto.get(i).getIdCategoria();
                    %>
                </td>
                <td>
                    <table>
                        <tr>
                        <form method="POST" action="./deleteProductoServlet">
                            <button colspan="2" align="center" type="submit" name="code" value="<%=codigo%>" class="btn btn-danger btn-md" style="margin-right:  10px;"><span class="pull-right hidden-xs showopacity far fa-trash-alt"></span></button>

                        </form>
                        <form method="POST" action="./EnviarEditarProductoServlet">
                              <input type="hidden" name="codProd" value="<%=codigo%>">
                              <input type="hidden" name="descProd" value="<%=descripcion%>">
                              <input type="hidden" name="preProd" value="<%=precio%>">
                              <input type="hidden" name="stockProd" value="<%=stock%>">
                              <input type="hidden" name="idCatProd" value="<%=idCategoria%>">

                            <button colspan="2" align="center" type="submit" name="producto" class="btn btn-warning btn-md"><span class="pull-right hidden-xs showopacity fa fa-edit" ></span></button>
                        </form>
            </tr>
        </table>


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