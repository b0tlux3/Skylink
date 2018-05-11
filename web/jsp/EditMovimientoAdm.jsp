<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                  <title>EDITAR MOVIMIENTO GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    
    <body>
          <%
            if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        
        <h1 align = "center"> Editar Movimiento ADM - Skylink </h1>
        <br>
         <ul class="nav navbar-nav navbar-center">

                <a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class="btn btn-success"> <span class="glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>    
                <li>

                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/movimientoControllerAdm">
                        <input type="hidden" name="accion" value = "goListadoMovimiento">

                        <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Listado Movimiento<span class="pull-left hidden-xs showopacity fas fa-users" style="font-size: 20px; padding-right: 5px;"></span></button>
                    </form>

                </li>

            </ul>
        <br>

        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario para Editar Movimiento</div>
                <div class = "panel-body ">
                    <form method="POST" action="../movimientoControllerAdm">
                        <input type="hidden" name="accion" value = "goEditarMovimiento">
                        <%
                            String numDocumento = request.getParameter("numDocumento");
                            String idMovimiento = request.getParameter("idMovimiento");
                            String fecMovimiento = request.getParameter("fecMovimiento");
                            String usuMovimiento = request.getParameter("usuMovimiento");
                            String codMovimiento = request.getParameter("codMovimiento");
                            String cantMovimiento = request.getParameter("cantMovimiento");
                            
                        %>
                        <p>
                            <label >Documento</label>  
                             <input type="hidden" name="numDocumento" value="<%=numDocumento%>">
                            <input id="idMovimiento" name="idMovimiento" type="text" placeholder="ingrese numero documento" class="form-control input-md" required="" value="<%=idMovimiento%>">
                        </p>
                        
                        <p>
                            <label >Fecha</label>  
                            <input id="fecMovimiento" name="fecMovimiento" type="text" placeholder="ingrese fecha" class="form-control input-md" required="" value="<%=fecMovimiento%>">
                        </p>
                        
                        <p>
                            <label >Usuario</label>  
                            <input id="usuMovimiento" name="usuMovimiento" type="text" placeholder="ingrese rol usuario" class="form-control input-md" required="" value="<%=usuMovimiento%>">
                        </p>
                        
                        <p>
                            <label >Producto</label>  
                            <input id="codMovimiento" name="codMovimiento" type="text" placeholder="ingrese codigo producto" class="form-control input-md" required="" value="<%=codMovimiento%>">
                        </p>
                        
                        <p>
                            <label >Cantidad</label>  
                            <input id="cantMovimiento" name="cantMovimiento" type="text" placeholder="ingrese cantidad" class="form-control input-md" required="" value="<%=cantMovimiento%>">
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
