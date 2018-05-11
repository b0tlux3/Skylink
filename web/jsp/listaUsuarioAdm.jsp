
<%@page import="skylinksystem.vo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<!DOCTYPE html>
<%
	//Usuario busuario = session.getAttribute("bUsuario")!=null?(Usuario)session.getAttribute("bUsuario"):new Usuario();
           if (session != null) {
                if (session.getAttribute("bUsuario") != null) {
                    String name = (String) session.getAttribute("bUsuario");
          %>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE USUARIOS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
         <%
         ArrayList<Usuario> listaUsuario =  (ArrayList)request.getAttribute("alistaUsuario");
          %>  
          
          <h1 align = "center"> Consulta de Usuarios ADM - Skylink </h1>
                <br>
                <p>
                    <a href = "http://localhost:8082/SkylinkWeb2/jsp/menuPrincipalAdm.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
                    <a href = "./jsp/AddUsuarioAdm.jsp" class = "btn btn-danger"> <span class = "glyphicon glyphicon-pencil" aria-hidden = "true"> </span> Agregar Usuarios </a>
                </p>
                <br>
          
<table class = "table table-bordered table-striped table-hover">
     <thead>
                        <tr>
                            <th> ID </th>
                            <th> Username </th>
                            <th> Password </th>
                            <th> Tipo </th>
                            <th> Accion </th>
                            
                        </tr>
                    </thead>
        <%
        for (int i = 0; i < listaUsuario.size(); i++) {
       %>     
       <tr>
           <td>
            <%=listaUsuario.get(i).getIdUsuario()%>
            <%
                        String idUsu = listaUsuario.get(i).getIdUsuario();
                    %>
                </td>
           <td>
            <%=listaUsuario.get(i).getUserName()%>
            <%
                        String nameUsu = listaUsuario.get(i).getUserName();
                    %>
                </td>
                <td>
            <%=listaUsuario.get(i).getUserPass()%>
            <%
                        String passUsu = listaUsuario.get(i).getUserPass();
                    %>
                </td>
                <td>
            <%=listaUsuario.get(i).getTipoUsuario()%>
            <%
                        String tipoUsu = listaUsuario.get(i).getTipoUsuario();
                    %>
                </td>
                <td>
                    <table>
                        <tr>
                        <form method="POST" action="./listadoUsuarioServletAdm">
                            <input type="hidden" name="accion" value = "goeliminar">
                            <button colspan="2" align="center" type="submit" name="idUsu" value="<%=idUsu%>" class="btn btn-danger btn-md" style="margin-right:  10px;"><span class="pull-right hidden-xs showopacity far fa-trash-alt"></span></button>

                        </form>
                        <form method="POST" action="jsp/editarUsuario.jsp">
                              <input type="hidden" name="idUsu" value="<%=idUsu%>">
                              <input type="hidden" name="nameUsu" value="<%=nameUsu%>">
                              <input type="hidden" name="passUsu" value="<%=passUsu%>">
                              <input type="hidden" name="tipoUsu" value="<%=tipoUsu%>">

                            <button colspan="2" align="center" type="submit" name="usuario" class="btn btn-warning btn-md"><span class="pull-right hidden-xs showopacity fa fa-edit" ></span></button>
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
