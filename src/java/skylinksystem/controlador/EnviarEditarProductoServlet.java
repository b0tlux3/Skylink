
package skylinksystem.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EnviarEditarProductoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EnviarEditarProductoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnviarEditarProductoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
      String codProd = request.getParameter("codProd");
        String descProd = request.getParameter("descProd");
        String preProd = request.getParameter("preProd");
        String stockProd = request.getParameter("stockProd");
        String idcatProd = request.getParameter("idCatProd");

        request.setAttribute("codProd", codProd);
        request.setAttribute("descProd", descProd);
        request.setAttribute("preProd", preProd);
        request.setAttribute("stockProd", stockProd);
        request.setAttribute("idcatProd", idcatProd);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/EditProductoAdm.jsp");

        dispatcher.forward(request, response);  
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
