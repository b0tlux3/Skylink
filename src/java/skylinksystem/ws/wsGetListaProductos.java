/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.ws;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import skylinksystem.dao.IMantenimientoProductosAdm;
import skylinksystem.dao.MantenimientoProductosAdmSQLOra;
import skylinksystem.vo.Producto;

/**
 *
 * @author Usuario-Clone0
 */
@WebService(serviceName = "wsGetListaProductos")
public class wsGetListaProductos {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getListaProductos")
    public List<Producto> getListaProductos(){
         IMantenimientoProductosAdm prodAdm = new MantenimientoProductosAdmSQLOra();
             ArrayList<Producto> listProducto = prodAdm.getListaProducto();
             
             return listProducto;

    }
}
