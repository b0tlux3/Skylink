
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
import skylinksystem.vo.Producto;

public class listadoProductoServletAdm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        HttpSession session = request.getSession(false);
        if (session != null) {

            ProductoAdm productoAdm = new ProductoAdm();
            ArrayList<Producto> listaProducto = productoAdm.getListaProducto();
            request.setAttribute("plistaProducto", listaProducto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

            dispatcher.forward(request, response);
        } else {
            out.print("Please login first");
            response.sendRedirect("../index.jsp");
            //request.getRequestDispatcher("../index.jsp").include(request, response);
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
