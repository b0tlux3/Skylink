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
            if (session != null) {
                if (session.getAttribute("bUsuariob") != null) {
                    String name = (String) session.getAttribute("bUsuariob");
        %>

        <div class="collapse navbar-collapse navbar-fixed-top" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#about"><span class="fa fa-users" style="font-size: 18px; padding-right:8px;"></span>NOSOTROS</a>
                </li>

                <li>
                    <a href="#clients"><span class="fa fa-cubes" style="font-size: 18px; padding-right:8px;"></span>CLIENTES</a>
                </li>
                <li>
                    <a href="#contact"><span class="fa fa-at" style="font-size: 18px; padding-right:8px;"></span>CONTACTENOS</a>
                </li>
            </ul>
        </div>

        <nav class="navbar navbar-default sidebar" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>      
                </div>
                <div class="sidebar-nav" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-center">
                        <li class="active" align="center" style="background-color:#0066ff;"><a style="color:white;">Menu User<span style="font-size:14px; color:white; padding-right:8px; margin-left: 1px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                        <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/productoControllerAdm">
                         <input type="hidden" name="accion" value = "goListadoProductoUser">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" style="text-align: left; padding-right: 18px;">Productos<span class="pull-left hidden-xs showopacity fas fa-th-large" style="font-size:14px; color:white; padding-right:8px; margin-left: 1px;"></span></button></li>
                    </form>
                </li>
                        <li>
                    <form method="POST" action="http://localhost:8082/SkylinkWeb2/movimientoControllerAdm">
                        <input type="hidden" name="accion" value = "goListadoMovimientoUser">
                        <li ><button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md" style="text-align: right; padding-right: 10px;">Movimientos<span class="pull-left hidden-xs showopacity fas fa-dollar-sign" style="font-size:14px; color:white; padding-right:8px; margin-left: 1px;"></span></button></li>
                    </form>
                </li>

                        <li ><a href="http://localhost:8082/SkylinkWeb2/jsp/logout.jsp" class="btn btn-primary btn-md" style="font-size:14px; text-align: left; padding-right: 10px;">Logout<span style="font-size:14px; color:white; padding-right:8px; margin-left: 0px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-log-out"></span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <section id="about" class="s_image_text bg-beta" style="">
            <div class="container">
                <div class="row">
                    <div class="well s_well clearfix" style="background-color: #e6e6e6;">
                        <p style="text-align: center; ">
                            <b>
                                <font style="font-size: 28px;">NOSOTROS</font>
                            </b>
                        </p>
                        <p style="text-align: center; ">
                            <b>
                                <span style="font-size:86px;" class="fa fa-users"></span>
                            </b>

                        </p>

                        <p style="text-align: justify; ">
                            <b>
                                <font style="font-size: 18px; line-height: 1.6;">
                                Skylink es un fabricante de productos ópticos para telecomunicaciones, que fabrica y distribuye a nivel mundial sus productos. Con el propósito de mejorar la velocidad de atención a sus clientes y optimizar sus líneas de producción, desea colocar su almacén de productos en línea a disposición de sus clientes, para que estos a manera de autoservicio puedan gestionar sus pedidos, actualizar automáticamente saldos y verificar ítems del inventario.
                                Como consecuencia de su ubicación estratégica, gran disponibilidad de productos y precios competitivos, se han incrementado sus ventas y la rotación de su mercadería, esto ha conllevado a la necesidad de migrar el control de inventario del almacén a un sistema distribuido.

                                </font>
                            </b>
                        </p>

                    </div>
                    <div class="well s_well clearfix" style="background-color: #cce6ff;">
                        <p style="text-align: center; ">
                            <b>
                                <font style="font-size: 28px; color: black;">MISION</font>
                            </b>

                        </p>
                        <p style="text-align: center; ">
                            <b>
                                <span style="font-size:86px; color: black;" class="fa fa-paper-plane"></span>
                            </b>

                        </p>
                        <p style="text-align: justify; ">
                            <b>
                                <font style="font-size: 18px; line-height: 1.6; color: black;">
                                “Ser la empresa líder en fabricación, distribución y comercialización de productos de comunicaciones ópticas, satisfaciendo las necesidades de sus clientes, brindándoles un producto de calidad y con un excelente servicio”.

                                </font>
                            </b>
                        </p>
                    </div>
                    <br/>
                    <br/>
                    <div class="well s_well clearfix" style="background-color: #b3fff0;">
                        <p style="text-align: center; ">
                            <b>
                                <font style="font-size: 28px; color: black;">VISION</font>
                            </b>
                        </p>
                        <p style="text-align: center; ">
                            <b>
                                <span style="font-size:86px; color: black;" class="fa fa-flag"></span>
                            </b>

                        </p>
                        <p style="text-align: justify; ">
                            <b>
                                <font style="font-size: 18px; line-height: 1.6; color: black;">
                                “Ser el mayor fabricante y distribuidor de productos para comunicaciones ópticas”.

                                </font>
                            </b>
                        </p>
                    </div>

                </div>
            </div>
        </section>

        <section id="clients" class="s_image_text bg-beta" style="">
            <div class="well s_well clearfix" style="background-color: #e0e0eb;">
                <p style="text-align: center; ">
                    <b>
                        <font style="font-size: 28px; color: black;">NUESTROS CLIENTES</font>
                    </b>
                </p>

                <p style="text-align: center; ">
                    <b>
                        <img src="https://s6.postimg.cc/yopbj24k1/clientes-1.png" alt="" />
                    </b>
                </p>

            </div>
        </section>

        <section id="contact" class="s_image_text bg-beta" style="">
            <div class="well s_well clearfix" style="background-color: #e0e0eb;">

                <p style="text-align: center; ">
                    <b>
                        <font style="font-size: 28px; color: black;">CONTACTENOS</font>
                    </b>
                </p>
                <p style="text-align: center; ">
                    <b>
                        <span style="font-size:86px; color: black;" class="fa fa-envelope"></span>
                    </b>

                </p>
                <br/>
                <br/>

                <div class="container">
                    <form action="#">
                        <label for="fname">Nombres</label>
                        <input type="text" id="fname" name="firstname" placeholder="Your name..">

                        <label for="lname">Apellidos</label>
                        <input type="text" id="lname" name="lastname" placeholder="Your last name..">

                        <label for="country">Pais</label>
                        <select id="country" name="country">
                            <option value="australia">Australia</option>
                            <option value="argentina">Argentina</option>
                            <option value="brasil">Brasil</option>
                            <option value="bolivia">Bolivia</option>
                            <option value="canada">Canada</option>
                            <option value="chile">Chile</option>
                            <option value="china">China</option>
                            <option value="ecuador">Ecuador</option>
                            <option value="francia">Francia</option>
                            <option value="peru">Perú</option>
                            <option value="uruguay">Uruguay</option>
                            <option value="usa">USA</option>
                        </select>

                        <label for="subject">Asunto</label>
                        <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
        </section>
        <ul class="nav pull-right scroll-top">
            <li>
                <a href="#" title="Ir hacia arriba">
                    <span class="fa fa-chevron-up" style="color: white !important;"/>
                </a>
            </li>
        </ul>

    <%
                } else {
                    response.sendRedirect("../index.jsp");
                }
            }
        %>   

    </body>
</html>

<style>
    body,html{
        background-color: #444;
        background: url(https://s6.postimg.cc/bd5t7mv2p/fondo_Menu.jpg);
        background-size: cover;
        -webkit-font-smoothing: antialiased;
        font: normal 14px Roboto,arial,sans-serif;
        height: 100%;
    }

    nav.sidebar, .main{
        -webkit-transition: margin 200ms ease-out;
        -moz-transition: margin 200ms ease-out;
        -o-transition: margin 200ms ease-out;
        transition: margin 200ms ease-out;
    }

    nav.sidebar{
        margin-left: 0px;
        float: left;
        background-color: gray;
        position: fixed;
    }

    nav.sidebar .forAnimate{
        opacity: 1;
    }
    .sidebar-nav ul li a:hover { 
        background-color: gray;
        box-shadow: 0 0 10px #ccc; 
    }
    .sidebar-nav ul li button:hover { 
        background-color: gray;
        box-shadow: 0 0 10px #ccc; 
    }

    #bs-example-navbar-collapse-1 ul li a{ 
        color:white;
        background-color: gray;
    }
    #bs-example-navbar-collapse-1 ul li a:hover{ 
        color:white;
        background-color: #a6a6a6;
    }

    input[type=text], select, textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }

    input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #45a049;
    }

    .container {
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
    }

    .scroll-top {
        position:fixed;
        bottom:0;
        right:6%;
        z-index:100;
        background-color: rgba(10, 17, 4,0.9);
        opacity: 0.9;
        transition: all 0.3s ease-in-out;
        font-size:24px;
        border-top-left-radius:14px;
        border-top-right-radius:14px;
    }

    .scroll-top:hover {
        background-color: rgba(10, 17, 4,0.9);
        opacity: 0.9;
        transition: all 0.3s ease-in-out;
    }           

    .scroll-top a:link,.scroll-top a:visited {
        background-color: rgba(10, 17, 4,0.9) !important;
        color: black !important;
        border-top-left-radius:14px;
        border-top-right-radius:14px;
    }

</style>