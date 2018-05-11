
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
import skylinksystem.dao.IMantenimientoMovimientoAdm;
import skylinksystem.dao.MantenimientoMovimientoAdmSQLOra;
import skylinksystem.vo.Movimiento;

public class movimientoControllerAdm extends HttpServlet {

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

        if (accion.equalsIgnoreCase("goInsertarMovimiento")) {
            //registrar
           IMantenimientoMovimientoAdm movAdm = new MantenimientoMovimientoAdmSQLOra();
            Movimiento mov = new Movimiento();
            mov.setIdMovimiento(request.getParameter("idMovimiento"));
            mov.setNumDocumento(request.getParameter("numDocumento"));
            mov.setFechaDocumento(request.getParameter("fecMovimiento"));
            mov.setUsuarioDocumento(request.getParameter("usuMovimiento"));
            mov.setCodigoProducto(request.getParameter("codMovimiento"));
            mov.setCantidadProducto(request.getParameter("cantMovimiento"));

            movAdm.insertMovimiento(mov);

            ArrayList<Movimiento> listMovimiento = movAdm.getListaMovimiento();
            System.out.println("en goInsertarMovimiento");
            request.setAttribute("alistaMovimiento", listMovimiento);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaMovimientoAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goEditarMovimiento")) {

            IMantenimientoMovimientoAdm movAdm = new MantenimientoMovimientoAdmSQLOra();
           Movimiento mov = new Movimiento();
           mov.setNumDocumento(request.getParameter("numDocumento"));
            mov.setIdMovimiento(request.getParameter("idMovimiento"));
            mov.setFechaDocumento(request.getParameter("fecMovimiento"));
            mov.setUsuarioDocumento(request.getParameter("usuMovimiento"));
            mov.setCodigoProducto(request.getParameter("codMovimiento"));
            mov.setCantidadProducto(request.getParameter("cantMovimiento"));

            movAdm.updateMovimiento(mov);

            ArrayList<Movimiento> listMovimiento = movAdm.getListaMovimiento();
            System.out.println("en goEditarMovimiento");
            request.setAttribute("alistaMovimiento", listMovimiento);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaMovimientoAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goEliminarMovimiento")) {
           IMantenimientoMovimientoAdm movAdm = new MantenimientoMovimientoAdmSQLOra();
            Movimiento mov = new Movimiento();
            mov.setNumDocumento(request.getParameter("numDocumento"));
            movAdm.deleteMovimiento(mov);

            ArrayList<Movimiento> listMovimiento = movAdm.getListaMovimiento();
            System.out.println("en goEliminarMovimiento");
            request.setAttribute("alistaMovimiento", listMovimiento);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaMovimientoAdm.jsp");

            dispatcher.forward(request, response);

        } else if (accion.equalsIgnoreCase("goListadoMovimiento")) {
            IMantenimientoMovimientoAdm movAdm = new MantenimientoMovimientoAdmSQLOra();
            ArrayList<Movimiento> listMovimiento = movAdm.getListaMovimiento();
            System.out.println("en goListadoMovimiento");
            request.setAttribute("alistaMovimiento", listMovimiento);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaMovimientoAdm.jsp");

            dispatcher.forward(request, response);
            //processRequest(request, response);

        }else if (accion.equalsIgnoreCase("goListadoMovimientoUser")) {
            IMantenimientoMovimientoAdm movAdm = new MantenimientoMovimientoAdmSQLOra();
            ArrayList<Movimiento> listMovimiento = movAdm.getListaMovimiento();
            System.out.println("en goListadoMovimiento");
            request.setAttribute("alistaMovimientoUser", listMovimiento);

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaMovimientoUser.jsp");

            dispatcher.forward(request, response);
            //processRequest(request, response);

        } 
        
        
        else {
            processRequest(request, response);
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
