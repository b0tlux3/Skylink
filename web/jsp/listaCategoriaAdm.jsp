
<%@page import="skylinksystem.modelo.Categoria"%>
<%@page import="skylinksystem.modelo.Movimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE CATEGORIAS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
         <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
            ArrayList<Categoria> listaCategoria = (ArrayList)request.getAttribute("alistaCategoria");
          %>  
          
          <h1 align = "center"> Consulta de Categorias ADM - Skylink </h1>
                <br>
                <p>
                    <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-success"> <span class = "glyphicon glyphicon-th-list" aria-hidden = "true"> </span> Menu Principal </a>
                    <a href = "#" class = "btn btn-warning"> <span class = "glyphicon glyphicon-pencil" aria-hidden = "true"> </span> Editar Categorias </a>
                </p>
                <br>
          
<table class = "table table-bordered table-striped table-hover">
     <thead>
                        <tr>
                            <th> ID </th>
                            <th> Categoria </th>
                            
                        </tr>
                    </thead>
        <%
        for (int i = 0; i < listaCategoria.size(); i++) {
       %>     
       <tr>
           <td>
            <%=listaCategoria.get(i).getIdCategoria()%>
                </td>
           <td>
            <%=listaCategoria.get(i).getNombreCategoria()%>
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
