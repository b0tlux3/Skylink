
<%@page import="skylinksystem.modelo.Usuario"%>
<%@page import="skylinksystem.modelo.Categoria"%>
<%@page import="skylinksystem.modelo.Movimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE USUARIOS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
         <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
            ArrayList<Usuario> listaUsuario = (ArrayList)request.getAttribute("alistaUsuario");
          %>  
          
          <h1 align = "center"> Consulta de Usuarios ADM - Skylink </h1>
                <br>
                <p>
                    <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
                    <a href = "#" class = "btn btn-warning"> <span class = "glyphicon glyphicon-pencil" aria-hidden = "true"> </span> Editar Usuarios </a>
                </p>
                <br>
          
<table class = "table table-bordered table-striped table-hover">
     <thead>
                        <tr>
                            <th> ID </th>
                            <th> Username </th>
                            <th> Password </th>
                            <th> Tipo </th>
                            
                        </tr>
                    </thead>
        <%
        for (int i = 0; i < listaUsuario.size(); i++) {
       %>     
       <tr>
           <td>
            <%=listaUsuario.get(i).getIdUsuario()%>
                </td>
           <td>
            <%=listaUsuario.get(i).getUserName()%>
                </td>
                <td>
            <%=listaUsuario.get(i).getUserPass()%>
                </td>
                <td>
            <%=listaUsuario.get(i).getTipoUsuario()%>
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
