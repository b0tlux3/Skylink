package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import skylinksystem.dao.IMantenimientoCategoriaAdm;
import skylinksystem.dao.MantenimientoCategoriaAdmSQLOra;
import skylinksystem.vo.Categoria;

public class categoriaControllerAdm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "";
        }

        HttpSession session = request.getSession(false);

        if (accion.equalsIgnoreCase("goInsertarCategoria")) {
            //registrar
            IMantenimientoCategoriaAdm catAdm = new MantenimientoCategoriaAdmSQLOra();
            Categoria cat = new Categoria();
            cat.setIdCategoria(request.getParameter("idCategoria"));
            cat.setNombreCategoria(request.getParameter("nomCategoria"));

            catAdm.insertCategoria(cat);

            ArrayList<Categoria> listCategoria = catAdm.getListaCategoria();
            System.out.println("en goInsertarCategoria");
            request.setAttribute("alistaCategoria", listCategoria);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaCategoriaAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goEditarCategoria")) {

            IMantenimientoCategoriaAdm catAdm = new MantenimientoCategoriaAdmSQLOra();
            Categoria cat = new Categoria();
            cat.setIdCategoria(request.getParameter("idCategoria"));
            cat.setNombreCategoria(request.getParameter("nomCategoria"));

            catAdm.updateCategoria(cat);

            ArrayList<Categoria> listCategoria = catAdm.getListaCategoria();
            System.out.println("en goEditarCategoria");
            request.setAttribute("alistaCategoria", listCategoria);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaCategoriaAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goEliminarCategoria")) {
            IMantenimientoCategoriaAdm catAdm = new MantenimientoCategoriaAdmSQLOra();
            Categoria cat = new Categoria();
            cat.setIdCategoria(request.getParameter("idCategoria"));
            catAdm.deleteCategoria(cat);

            ArrayList<Categoria> listCategoria = catAdm.getListaCategoria();
            System.out.println("en goEliminarCategoria");
            request.setAttribute("alistaCategoria", listCategoria);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaCategoriaAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goListadoCategoria")) {
            IMantenimientoCategoriaAdm catAdm = new MantenimientoCategoriaAdmSQLOra();
            ArrayList<Categoria> listCategoria = catAdm.getListaCategoria();
            System.out.println("en goListadoCategoria");
            request.setAttribute("alistaCategoria", listCategoria);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaCategoriaAdm.jsp");

            dispatcher.forward(request, response);
            //processRequest(request, response);

        } else {
            processRequest(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
