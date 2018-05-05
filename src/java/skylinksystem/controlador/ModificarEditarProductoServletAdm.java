package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import skylinksystem.dao.Conexion;
import skylinksystem.dao.ProductoAdm;
import skylinksystem.vo.Producto;

public class ModificarEditarProductoServletAdm extends HttpServlet {

    Conexion conecta = new Conexion();
    Connection conn = conecta.getConnection();

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

        HttpSession session = request.getSession(false);
        if (session != null) {

            try {
                String codProd = request.getParameter("codProd");
                String descProd = request.getParameter("desProd");
                String preProd = request.getParameter("preProd");
                String stockProd = request.getParameter("stockProd");
                String idcatProd = request.getParameter("catProd");

                PreparedStatement pst = conn.prepareStatement("update producto set nombre_producto=?, precio_producto=?, stock_producto=?, id_categoria=? where codigo_producto=?");

                pst.setString(1, descProd);
                pst.setString(2, preProd);
                pst.setString(3, stockProd);
                pst.setString(4, idcatProd);
                pst.setString(5, codProd);
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
