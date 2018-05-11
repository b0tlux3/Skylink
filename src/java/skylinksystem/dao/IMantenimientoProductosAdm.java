/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.dao;

import java.util.ArrayList;
import skylinksystem.vo.Producto;

/**
 *
 * @author Docente
 */
public interface IMantenimientoProductosAdm {

    public ArrayList getListaProducto();

    public int insertProducto(Producto prod);

    public int updateProducto(Producto prod);

    public int deleteProducto(Producto prod);

}
