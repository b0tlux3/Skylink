package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import skylinksystem.dao.ProductoAdm;
import skylinksystem.modelo.Producto;

public class listadoProductoServletUser extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {

            ProductoAdm productoAdm = new ProductoAdm();
            ArrayList<Producto> listaProducto = productoAdm.getListaProducto();
            request.setAttribute("alistaProducto", listaProducto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosUser.jsp");

            dispatcher.forward(request, response);
        } else {
            out.print("Please login first");
            //request.getRequestDispatcher("../index.jsp").include(request, response);
            response.sendRedirect("./index.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
