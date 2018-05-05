package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import skylinksystem.dao.Conexion;
import skylinksystem.dao.ProductoAdm;
import skylinksystem.modelo.Producto;

public class deleteProductoServlet extends HttpServlet {

    Conexion conecta = new Conexion();
    Connection conn = conecta.getConnection();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session != null) {

            try {
                String username = request.getParameter("code");
                PreparedStatement pst = conn.prepareStatement("update producto set activo=? where codigo_producto=?");
                pst.setString(1, "0");
                pst.setString(2, username);
                ResultSet rs = pst.executeQuery();
                ProductoAdm productoAdm = new ProductoAdm();
                ArrayList<Producto> listaProducto = productoAdm.getListaProducto();
                request.setAttribute("plistaProducto", listaProducto);
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

                dispatcher.forward(request, response);

            } catch (Exception e) {
                System.out.println("Se tiene el siguiente error: " + e.getMessage());

            }

        } else {
            out.print("Please login first");
            request.getRequestDispatcher("../index.jsp").include(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
