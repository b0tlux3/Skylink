<%@page import="skylinksystem.vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

<!-- Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300' rel='stylesheet' type='text/css'>
<!-- Scripts -->
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Principal</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body>

        <%
            
//Usuario busuario = session.getAttribute("bUsuario")!=null?(Usuario)session.getAttribute("bUsuario"):new Usuario();
 if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
        %>

        <div class="collapse navbar-collapse navbar-fixed-top" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-center">
                <li ><button colspan="2" align="center" type="button" class="btn btn-primary" disabled>Menu Admin<span class="pull-right hidden-xs showopacity fa fa-user-plus"></span></button></li>

                <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/productoControllerAdm">
                         <input type="hidden" name="accion" value = "goListadoProducto">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md">Productos<span class="pull-right hidden-xs showopacity fas fa-th-large"></span></button></li>
                    </form>
                </li>
                <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/movimientoControllerAdm">
                        <input type="hidden" name="accion" value = "goListadoMovimiento">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md">Movimientos<span class="pull-right hidden-xs showopacity fas fa-dollar-sign"></span></button></li>
                    </form>
                </li>
                <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/categoriaControllerAdm">
                        <input type="hidden" name="accion" value = "goListadoCategoria">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Categorias<span class="pull-right hidden-xs showopacity fas fa-list-ul"></span></button></li>
                    </form>
                </li>

                <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/listadoUsuarioServletAdm">
                         <input type="hidden" name="accion" value = "golistado">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" >Usuarios<span class="pull-right hidden-xs showopacity fas fa-users"></span></button></li>
                    </form>
                </li>

                <li>
                        <li ><a href="http://localhost:8082/SkylinkWeb2/jsp/logout.jsp" class="btn btn-primary btn-md">Logout<span class="pull-right hidden-xs showopacity glyphicon glyphicon-log-out"></span></a></li>
                </li>

            </ul>
        </div>

      <%
                } else {
                    response.sendRedirect("http://localhost:8082/SkylinkWeb2/index.jsp");
                }
            }else {
                    response.sendRedirect("http://localhost:8082/SkylinkWeb2/index.jsp");
                }
        %>   

    </body>
</html>

<style>
    body,html{
        background-color: #444;
        background: url(https://s6.postimg.cc/8j2nu9sxd/fondo_Menu_Admin.jpg);
        background-size: cover;
        -webkit-font-smoothing: antialiased;
        font: normal 14px Roboto,arial,sans-serif;
        height: 100%;
    }

    #bs-example-navbar-collapse-1 ul li a{ 
        color:white;
        background-color: gray;
        height:35px;
        text-align: center;

    }
    #bs-example-navbar-collapse-1 ul li span{ 
        padding-left: 10px;
        font-size: 20px;
    }

    #bs-example-navbar-collapse-1{ 

    }

    #bs-example-navbar-collapse-1 ul li a:hover{ 
        color:white;
        background-color: #a6a6a6;
    }

    #bs-example-navbar-collapse-1{ 
        position: center;
        padding-left: 40%;
    }

</style>