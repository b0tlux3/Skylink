<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRAR CATEGORIAS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        
    </head>
    
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        
        <h1 align = "center"> Agregar Categorias ADM - Skylink </h1>
        <br>
         <ul class="nav navbar-nav navbar-center">
            
<a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class="btn btn-success"> <span class="glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>    
            <li>
                
                <form method="POST" action="http://localhost:8082/SkylinkWeb2/categoriaControllerAdm">
                    <input type="hidden" name="accion" value = "goListadoCategoria">

                    <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Listado Categorias<span class="pull-left hidden-xs showopacity fas fa-th-large" style="font-size: 20px; padding-right: 5px;"></span></button>
                </form>
                
            </li>
            
        </ul>
        <br>

        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario de Ingreso de Categorias</div>
                <div class = "panel-body ">
                    <form method="POST" action="../categoriaControllerAdm">
                        <legend>Formulario de Ingreso de Categorias</legend>
                        <input type="hidden" name="accion" value = "goInsertarCategoria">
                         <p>
                            <label >Id</label>  
                            <input id="idCategoria" name="idCategoria" type="text" placeholder="ingrese codigo categoria" class="form-control input-md" required="">
                        </p>

                        
                        <p>
                            <label >Categoria</label>  
                            <input id="nomCategoria" name="nomCategoria" type="text" placeholder="ingrese nombre categoria" class="form-control input-md" required="">
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
