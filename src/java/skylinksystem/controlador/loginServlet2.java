package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import skylinksystem.dao.Conexion;
import skylinksystem.dao.IUserValidateAdm;
import skylinksystem.dao.UserValidateAdmSQLOra;
import skylinksystem.vo.Usuario;

public class loginServlet2 extends HttpServlet {

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
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        
        IUserValidateAdm userValidateAdm = new UserValidateAdmSQLOra();
        Usuario usuarioObjeto = userValidateAdm.validarUsuario(username, password);
        
        if (usuarioObjeto != null) {
            String tipoUsuario = usuarioObjeto.getTipoUsuario();
            if(tipoUsuario.equalsIgnoreCase("ADMIN")){
                System.out.println("Login Successful");
                HttpSession session = request.getSession(true);
                session.setAttribute("user", username);
                session.setMaxInactiveInterval(60); // 30 seconds
                response.sendRedirect("jsp/menuPrincipalAdm.jsp");
            }else if(tipoUsuario.equalsIgnoreCase("USER")){
                System.out.println("Login Successful");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", username);
                    session.setMaxInactiveInterval(30); // 30 seconds
                    response.sendRedirect("jsp/menuPrincipalUser.jsp");
            }else if (tipoUsuario.equalsIgnoreCase("SUPER")){
                
            }
            
        }else{
            System.out.println("Contraseña Incorrecta...");
                response.sendRedirect("index.jsp");
        }
        /*
        try {

            PreparedStatement pst = conn.prepareStatement("Select s.USUARIO_NAME, s.USUARIO_PASSWORD, c.TIPO_NAME From (users) s, (user_roles) c Where s.TIPO_ID = c.TIPO_ID and s.USUARIO_NAME=? and s.USUARIO_PASSWORD=? and c.TIPO_NAME=?");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, "ADMIN");
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                out.println("Login Successful");
                HttpSession session = request.getSession(true);
                session.setAttribute("user", username);
                session.setMaxInactiveInterval(30); // 30 seconds
                response.sendRedirect("jsp/menuPrincipalAdm.jsp");

            } else {
                pst.setString(3, "USER");
                ResultSet rs1 = pst.executeQuery();
                if (rs1.next()) {
                    out.println("Login Successful");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", username);
                    session.setMaxInactiveInterval(30); // 30 seconds
                    response.sendRedirect("jsp/menuPrincipalUser.jsp");
                }
                out.println("Invalid login credentials");
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage());
            try (PrintWriter out = response.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet NewServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
                out.println("<h1>Se tiene el siguiente error:" + e.getMessage() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }

        }
        */

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
