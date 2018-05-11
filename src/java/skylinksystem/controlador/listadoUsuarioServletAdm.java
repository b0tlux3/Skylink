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
import skylinksystem.dao.IMantenimientoUsuarioAdm;
import skylinksystem.dao.MantenimientoUsuarioAdmSQLOra;
import skylinksystem.dao.UserValidateAdmSQLOra;
import skylinksystem.vo.Usuario;

public class listadoUsuarioServletAdm extends HttpServlet {

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
        
        if (accion == null){
                accion="";
            }        
        
        HttpSession session = request.getSession(false);
        
        if(accion.equalsIgnoreCase("goinsertar")){
                //registrar
               IMantenimientoUsuarioAdm usuAdm = new MantenimientoUsuarioAdmSQLOra();
                Usuario usu = new Usuario();
                usu.setIdUsuario(request.getParameter("idUsu"));
                usu.setUserName(request.getParameter("nameUsu"));
                usu.setUserPass(request.getParameter("passUsu"));
                usu.setTipoUsuario(request.getParameter("tipoUsu"));
                
                usuAdm.insertUsuario(usu);
                
               ArrayList<Usuario> listUsuario = usuAdm.getListaUsuario();
                
                request.setAttribute("alistaUsuario", listUsuario);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaUsuarioAdm.jsp");

                dispatcher.forward(request, response);      
            
            
        }else if (accion.equalsIgnoreCase("goeditar")){
                            
                IMantenimientoUsuarioAdm usuAdm = new MantenimientoUsuarioAdmSQLOra();
                Usuario usu = new Usuario();
                usu.setIdUsuario(request.getParameter("idUsu"));
                usu.setUserName(request.getParameter("nameUsu"));
                usu.setUserPass(request.getParameter("passUsu"));
                usu.setTipoUsuario(request.getParameter("tipoUsu"));
                
                usuAdm.updateUsuario(usu);
                
                 ArrayList<Usuario> listUsuario = usuAdm.getListaUsuario();
                
                request.setAttribute("alistaUsuario", listUsuario);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaUsuarioAdm.jsp");

                dispatcher.forward(request, response);             
                
                
        }else if(accion.equalsIgnoreCase("goeliminar")){
            IMantenimientoUsuarioAdm usuAdm = new MantenimientoUsuarioAdmSQLOra();
                Usuario usu = new Usuario();
                usu.setIdUsuario(request.getParameter("idUsu"));
                 usuAdm.deleteUsuario(usu);
                
                 ArrayList<Usuario> listUsuario = usuAdm.getListaUsuario();
                
                request.setAttribute("alistaUsuario", listUsuario);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaUsuarioAdm.jsp");

                dispatcher.forward(request, response);             
            
            
        }else if(accion.equalsIgnoreCase("golistado")){
            IMantenimientoUsuarioAdm usuAdm = new MantenimientoUsuarioAdmSQLOra();
             ArrayList<Usuario> listUsuario = usuAdm.getListaUsuario();
                System.out.println("en golistado2");
                request.setAttribute("alistaUsuario", listUsuario);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaUsuarioAdm.jsp");

                dispatcher.forward(request, response);      
            //processRequest(request, response);
            
        }else{
            processRequest(request, response);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
