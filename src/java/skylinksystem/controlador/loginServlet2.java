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
import skylinksystem.dao.IUserValidateAdm;
import skylinksystem.dao.MantenimientoUsuarioAdmSQLOra;
import skylinksystem.dao.UserValidateAdmSQLOra;
import skylinksystem.vo.Usuario;

public class loginServlet2 extends HttpServlet {

    Conexion conecta = new Conexion();
    Connection conn = conecta.getConnection();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        IUserValidateAdm userValidateAdm = new UserValidateAdmSQLOra();
        Usuario usuarioObjeto = userValidateAdm.validarUsuario(username, password);

        if (usuarioObjeto != null) {
            String tipoUsuario = usuarioObjeto.getTipoUsuario();
            if (tipoUsuario.equalsIgnoreCase("ADMIN")) {
                System.out.println("Login Successful");
                HttpSession session = request.getSession(true);
                session.setAttribute("bUsuario", tipoUsuario);
                session.setMaxInactiveInterval(60); // 60 seconds
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menuPrincipalAdm.jsp");
                dispatcher.forward(request, response);
                // response.sendRedirect("jsp/menuPrincipalAdm.jsp");
            } else if (tipoUsuario.equalsIgnoreCase("USER")) {
                System.out.println("Login Successful");
                HttpSession session = request.getSession(true);
                session.setAttribute("bUsuariob", tipoUsuario);
                session.setMaxInactiveInterval(30); // 60 seconds
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menuPrincipalUser.jsp");
                dispatcher.forward(request, response);
                //response.sendRedirect("jsp/menuPrincipalUser.jsp");
            } else if (tipoUsuario.equalsIgnoreCase("SUPER")) {

            }

        } else {
            System.out.println("Contraseña Incorrecta...");
            response.sendRedirect("http://localhost:8082/SkylinkWeb2/index.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
