<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>REGISTRAR MOVIMIENTOS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    
    <body>
         <%
            if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        
         <h1 align = "center"> Agregar Movimientos ADM - Skylink </h1>
        <br>
         <ul class="nav navbar-nav navbar-center">
            
<a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class="btn btn-success"> <span class="glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>    
            <li>
                
                <form method="POST" action="http://localhost:8082/SkylinkWeb2/movimientoControllerAdm">
                    <input type="hidden" name="accion" value = "goListadoMovimiento">

                    <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Listado Movimiento<span class="pull-left hidden-xs showopacity fas fa-th-large" style="font-size: 20px; padding-right: 5px;"></span></button>
                </form>
                
            </li>
            
        </ul>
        <br>

        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario de Ingreso de Movimientos</div>
                <div class = "panel-body ">
                    <form method="POST" action="../movimientoControllerAdm">
                        <legend>Formulario de Ingreso de Movimientos</legend>
                        <input type="hidden" name="accion" value = "goInsertarMovimiento">
                         <p>
                            <label >Documento</label>  
                            <input id="numDocumento" name="numDocumento" type="text" placeholder="ingrese numero documento" class="form-control input-md" required="">
                        </p>

                        
                        <p>
                            <label >Tipo</label>  
                            <input id="idMovimiento" name="idMovimiento" type="text" placeholder="ingrese tipo movimiento" class="form-control input-md" required="">
                        </p>
                        
                        <p>
                            <label >Fecha</label>  
                            <input id="fecMovimiento" name="fecMovimiento" type="text" placeholder="ingrese fecha" class="form-control input-md" required="">
                        </p>
                        
                        <p>
                            <label >Usuario</label>  
                            <input id="usuMovimiento" name="usuMovimiento" type="text" placeholder="ingrese rol usuario" class="form-control input-md" required="">
                        </p>
                        
                        <p>
                            <label >Producto</label>  
                            <input id="codMovimiento" name="codMovimiento" type="text" placeholder="ingrese codigo producto" class="form-control input-md" required="">
                        </p>
                        
                        <p>
                            <label >Cantidad</label>  
                            <input id="cantMovimiento" name="cantMovimiento" type="text" placeholder="ingrese cantidad" class="form-control input-md" required="">
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
