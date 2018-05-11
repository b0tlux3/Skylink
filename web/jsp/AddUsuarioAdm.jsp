<%-- 
    Document   : AddUsuarioAdm
    Created on : 09-may-2018, 16:55:00
    Author     : Usuario-Clone0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AGREGAR USUARIOS - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
                    //ArrayList<Movimiento> listaMovimiento = (ArrayList) request.getAttribute("alistaMovimiento");
        %>  
        <h1 align = "center"> Agregar Usuarios ADM - Skylink </h1>
        <br>
        <br>
        <br>
        <br>
        <div class="collapse navbar-collapse navbar-fixed-top" id="bs-example-navbar-collapse-1">
            <br>
            <br>
            <br>
            <br>
            <br>
            <ul class="nav navbar-nav navbar-center">

                <a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class="btn btn-success"> <span class="glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>    
                <li>

                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/listadoUsuarioServletAdm">
                        <input type="hidden" name="accion" value = "golistado">

                        <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Listado Usuarios<span class="pull-left hidden-xs showopacity fas fa-users" style="font-size: 20px; padding-right: 5px;"></span></button>
                    </form>

                </li>

            </ul>


            <br>

        </div>


        <div class = "container" style="width: 600px; margin: 0 auto;">
            <div class = "panel panel-primary">
                <div class = "panel-heading"> Formulario de Ingreso de Usuarios</div>
                <div class = "panel-body ">
                    <form method="POST" action="../listadoUsuarioServletAdm">
                        <legend>Formulario de Ingreso de Usuarios</legend>
                        <input type="hidden" name="accion" value = "goinsertar">
                        <p>
                            <label >ID</label>  
                            <input id="desProd" name="idUsu" type="text" placeholder="ingrese id" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Usuario</label>  
                            <input id="preProd" name="nameUsu" type="text" placeholder="ingrese nombre de usuario" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Password</label>  
                            <input id="stockProd" name="passUsu" type="text" placeholder="ingrese contraseña usuario" class="form-control input-md" required="">
                        </p>

                        <p>
                            <label >Tipo</label>  
                            <input id="catProd" name="tipoUsu" type="text" placeholder="1:Usuario - 2:Admin" class="form-control input-md" required="">
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
