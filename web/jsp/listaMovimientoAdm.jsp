<%@page import="skylinksystem.vo.Movimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE MOVIMIENTOS GENERAL - ADMIN</title>
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
         <%
		if (session != null) {
			if (session.getAttribute("bUsuario") != null) {
				String name = (String) session.getAttribute("bUsuario");
            ArrayList<Movimiento> listaMovimiento = (ArrayList)request.getAttribute("alistaMovimiento");
          %>  
          
          <h1 align = "center"> Consulta de Movimientos ADM - Skylink </h1>
                <br>
                <<p align= "center" >
            <a href = "jsp/menuPrincipalAdm.jsp" class = "btn btn-primary " > <span class = "glyphicon glyphicon-home" aria-hidden = "true"> </span> Menu Principal </a>
            <a href = "./jsp/AddMovimientoAdm.jsp" class = "btn btn-success"> <span class = "fas fa-plus" aria-hidden = "true"> </span> Agregar Movimientos </a>
        </p>
                <br>
          
<table class = "table table-bordered table-striped table-hover">
     <thead>
                        <tr>
                            <th> ID </th>
                            <th> Documento </th>
                            <th> Fecha </th>
                            <th> Usuario </th>
                            <th> Producto </th>
                            <th> Cantidad </th>
                            
                        </tr>
                    </thead>
        <%
        for (int i = 0; i < listaMovimiento.size(); i++) {
       %>     
       <tr>
           <td>
            <%=listaMovimiento.get(i).getNumDocumento()%>
             <%
                        String numDocumento = listaMovimiento.get(i).getNumDocumento();
                    %>
                </td>
           <td>
            <%=listaMovimiento.get(i).getIdMovimiento()%>
            <%
                        String idMovimiento = listaMovimiento.get(i).getIdMovimiento();
                    %>
                </td>
           <td>
            <%=listaMovimiento.get(i).getFechaDocumento()%>
            <%
                        String fecMovimiento = listaMovimiento.get(i).getFechaDocumento();
                    %>
                </td>
           <td>
            <%=listaMovimiento.get(i).getUsuarioDocumento()%>
            <%
                        String usuMovimiento = listaMovimiento.get(i).getUsuarioDocumento();
                    %>
                </td>     
                <td>
            <%=listaMovimiento.get(i).getCodigoProducto()%>
            <%
                        String codMovimiento = listaMovimiento.get(i).getCodigoProducto();
                    %>
                </td>     
                <td>
            <%=listaMovimiento.get(i).getCantidadProducto()%>
            <%
                        String cantMovimiento = listaMovimiento.get(i).getCantidadProducto();
                    %>
                </td> 
                
                <td>
                    <table>
                        <tr>
                        <form method="POST" action="./movimientoControllerAdm">
                            <input type="hidden" name="accion" value = "goEliminarMovimiento">
                            <button colspan="2" align="center" type="submit" name="numDocumento" value="<%=numDocumento%>" class="btn btn-danger btn-md" style="margin-right:  10px;"><span class="pull-right hidden-xs showopacity far fa-trash-alt"></span></button>

                        </form>
                        <form method="POST" action="jsp/EditMovimientoAdm.jsp">
                              <input type="hidden" name="numDocumento" value="<%=numDocumento%>">
                              <input type="hidden" name="idMovimiento" value="<%=idMovimiento%>">
                              <input type="hidden" name="fecMovimiento" value="<%=fecMovimiento%>">
                              <input type="hidden" name="usuMovimiento" value="<%=usuMovimiento%>">
                              <input type="hidden" name="codMovimiento" value="<%=codMovimiento%>">
                              <input type="hidden" name="cantMovimiento" value="<%=cantMovimiento%>">

                            <button colspan="2" align="center" type="submit" name="movimiento" class="btn btn-warning btn-md"><span class="pull-right hidden-xs showopacity fa fa-edit" ></span></button>
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
