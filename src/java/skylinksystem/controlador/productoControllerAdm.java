
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
import skylinksystem.dao.IMantenimientoProductosAdm;
import skylinksystem.dao.MantenimientoProductosAdmSQLOra;
import skylinksystem.vo.Producto;

public class productoControllerAdm extends HttpServlet {

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
        
        if(accion.equalsIgnoreCase("goInsertarProducto")){
                //registrar
              IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
                Producto prod = new Producto();
                prod.setDescripcion(request.getParameter("descProd"));
                prod.setPrecioProducto(request.getParameter("preProd"));
                prod.setStockProducto(request.getParameter("stockProd"));
                prod.setIdCategoria(request.getParameter("catProd"));
                
                prodAdm.insertProducto(prod);
                
               ArrayList<Producto> listProducto = prodAdm.getListaProducto();
                   System.out.println("en goInsertarProducto");
                request.setAttribute("alistaProducto", listProducto);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

                dispatcher.forward(request, response);      
            
            
        }else if (accion.equalsIgnoreCase("goEditarProducto")){
                            
               IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
                   Producto prod = new Producto();
                prod.setCodigoProducto(request.getParameter("idProd"));
                prod.setDescripcion(request.getParameter("descProd"));
                prod.setPrecioProducto(request.getParameter("preProd"));
                prod.setStockProducto(request.getParameter("stockProd"));
                prod.setIdCategoria(request.getParameter("catProd"));
                
                prodAdm.updateProducto(prod);
                
                 ArrayList<Producto> listProducto = prodAdm.getListaProducto();
                   System.out.println("en goEditarProducto");
                request.setAttribute("alistaProducto", listProducto);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

                dispatcher.forward(request, response);             
                
                
        }else if(accion.equalsIgnoreCase("goEliminarProducto")){
           IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
                Producto prod = new Producto();
                prod.setCodigoProducto(request.getParameter("idProd"));
                 prodAdm.deleteProducto(prod);
                
                 ArrayList<Producto> listProducto = prodAdm.getListaProducto();
                System.out.println("en goEliminarProducto");
                request.setAttribute("alistaProducto", listProducto);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

                dispatcher.forward(request, response);             
            
            
        }else if(accion.equalsIgnoreCase("goListadoProducto")){
            IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
             ArrayList<Producto> listProducto = prodAdm.getListaProducto();
                System.out.println("en goListadoProducto");
                request.setAttribute("alistaProducto", listProducto);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosAdm.jsp");

                dispatcher.forward(request, response);      
            //processRequest(request, response);
            
        }else if(accion.equalsIgnoreCase("goListadoProductoUser")){
            IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
             ArrayList<Producto> listProducto = prodAdm.getListaProducto();
                System.out.println("en goListadoProducto");
                request.setAttribute("alistaProductoUser", listProducto);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/listaProductosUser.jsp");

                dispatcher.forward(request, response);      
            //processRequest(request, response);
            
        }
        
        
        else{
            processRequest(request, response);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
