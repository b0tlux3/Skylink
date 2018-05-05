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
import skylinksystem.modelo.Producto;

public class AgregarProductoServletAdm extends HttpServlet {
    Conexion conecta = new Conexion();
    Connection conn = conecta.getConnection();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AgregarProductoServletAdm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AgregarProductoServletAdm at - DOPOST " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AgregarProductoServletAdm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AgregarProductoServletAdm at - DOGET " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {

            try {
                String descProd = request.getParameter("desProd");
                String preProd = request.getParameter("preProd");
                String stockProd = request.getParameter("stockProd");
                String CatProd = request.getParameter("catProd");

                PreparedStatement pst = conn.prepareStatement("insert into producto values (PRODUCTO_SEQ1.NEXTVAL,?,?,?,?,?)");
                
                pst.setString(1, descProd);
                pst.setString(2, preProd);
                pst.setString(3, stockProd);
                pst.setString(4, CatProd);
                pst.setString(5, "1");
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

        /*
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AgregarProductoServletAdm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AgregarProductoServletAdm at - DOPOST " + request.getContextPath() + codProd + descProd + preProd + stockProd + CatProd + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
         */
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
