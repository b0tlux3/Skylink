
<%@page import="skylinksystem.vo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE CATEGORIAS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
         <%
		if (session != null) {
			if (session.getAttribute("bUsuario") != null) {
				String name = (String) session.getAttribute("bUsuario");
            ArrayList<Categoria> listaCategoria = (ArrayList)request.getAttribute("alistaCategoria");
          %>  
          
          <h1 align = "center"> Consulta de Categorias ADM - Skylink </h1>
                <br>
                <p align= "center">
                    <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-primary " > <span class = "glyphicon glyphicon-home" aria-hidden = "true"> </span> Menu Principal </a>
            <a href = "./jsp/AddCategoriaAdm.jsp" class = "btn btn-success"> <span class = "fas fa-plus" aria-hidden = "true"> </span> Agregar Categorias </a>
                </p>
                <br>
          
<table class = "table table-bordered table-striped table-hover">
     <thead>
                        <tr>
                            <th> ID </th>
                            <th> Categoria </th>
                            <th> Accion </th>
                            
                        </tr>
                    </thead>
        <%
        for (int i = 0; i < listaCategoria.size(); i++) {
       %>     
       <tr>
           <td>
            <%=listaCategoria.get(i).getIdCategoria()%>
             <%
                        String idCategoria = listaCategoria.get(i).getIdCategoria();
                    %>
                </td>
           <td>
            <%=listaCategoria.get(i).getNombreCategoria()%>
              <%
                        String nomCategoria = listaCategoria.get(i).getNombreCategoria();
                    %>
                </td>
                
                <td>
                    <table>
                        <tr>
                        <form method="POST" action="./categoriaControllerAdm">
                            <input type="hidden" name="accion" value = "goEliminarCategoria">
                            <button colspan="2" align="center" type="submit" name="idCategoria" value="<%=idCategoria%>" class="btn btn-danger btn-md" style="margin-right:  10px;"><span class="pull-right hidden-xs showopacity far fa-trash-alt"></span></button>

                        </form>
                        <form method="POST" action="jsp/EditCategoriaAdm.jsp">
                              <input type="hidden" name="idCategoria" value="<%=idCategoria%>">
                              <input type="hidden" name="nomCategoria" value="<%=nomCategoria%>">

                            <button colspan="2" align="center" type="submit" name="categoria" class="btn btn-warning btn-md"><span class="pull-right hidden-xs showopacity fa fa-edit" ></span></button>
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
