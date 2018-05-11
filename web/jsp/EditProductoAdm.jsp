
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR PRODUCTO GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        <h1 align = "center"> Editar Producto ADM - Skylink </h1>
        <br>
        <ul class="nav navbar-nav navbar-center">
            
<a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class="btn btn-success"> <span class="glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>    
            <li>
                
                <form method="POST" action="http://localhost:8082/SkylinkWeb2/productoControllerAdm">
                    <input type="hidden" name="accion" value = "goListadoProducto">

                    <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Listado Productos<span class="pull-left hidden-xs showopacity fas fa-th-large" style="font-size: 20px; padding-right: 5px;"></span></button>
                </form>
                
            </li>
            
        </ul>
        <br>

        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario para Editar Productos</div>
                <div class = "panel-body ">
                    <form method="POST" action="../productoControllerAdm">
                         <input type="hidden" name="accion" value = "goEditarProducto">
                        <%
                            String idProd = request.getParameter("idProd");
                            String descProd = request.getParameter("descProd");
                            String preProd = request.getParameter("preProd");
                            String stockProd = request.getParameter("stockProd");
                            String catProd = request.getParameter("catProd");
                        %>
                        <p>
                            <label >Descripcion</label>  
                             <input type="hidden" name="idProd" value="<%=idProd%>">
                            <input id="desProd" name="descProd" type="text" placeholder="ingrese descripcion" class="form-control input-md" required="" value="<%=descProd%>">
                        </p>

                        <p>
                            <label >Precio</label>  
                            <input id="preProd" name="preProd" type="text" placeholder="ingrese precio" class="form-control input-md" required="" value="<%=preProd%>">
                        </p>

                        <p>
                            <label >Stock</label>  
                            <input id="stockProd" name="stockProd" type="text" placeholder="ingrese stock" class="form-control input-md" required="" value="<%=stockProd%>">
                        </p>

                        <p>
                            <label >Categoria</label>  
                            <input id="catProd" name="catProd" type="text" placeholder="ingrese categoria" class="form-control input-md" required="" value="<%=catProd%>">
                        </p>


                        <p>
                            <button id="enviar" name="enviar" class="btn btn-primary">Editar</button>
                        </p>

                    </form>
                </div>
            </div>
        </div>

        <%
                } else {
                    response.sendRedirect("../index.jsp");
                }
            }
        %>   

    </body>
</html>
