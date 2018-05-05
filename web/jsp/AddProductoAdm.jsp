
<%@page import="skylinksystem.modelo.Movimiento"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE MOVIMIENTOS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("user") != null) {
                    String name = (String) session.getAttribute("user");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        <h1 align = "center"> Agregar Productos ADM - Skylink </h1>
        <br>
        <p>
            <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
        </p>
        <br>

        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario de Ingreso de Productos</div>
                <div class = "panel-body ">
                    <form method="POST" action="../AgregarProductoServletAdm">
                        <legend>Formulario de Ingreso de Productos</legend>
                        
                        <p>
                            <label >Descripcion</label>  
                            <input id="desProd" name="desProd" type="text" placeholder="ingrese descripcion" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Precio</label>  
                            <input id="preProd" name="preProd" type="text" placeholder="ingrese precio" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Stock</label>  
                            <input id="stockProd" name="stockProd" type="text" placeholder="ingrese stock" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Categoria</label>  
                            <input id="catProd" name="catProd" type="text" placeholder="ingrese categoria" class="form-control input-md" required="">
                        </p>


                        <p>
                            <button id="enviar" name="enviar" class="btn btn-primary">Enviar</button>
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
