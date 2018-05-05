/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.modelo;

/**
 *
 * @author Usuario-Clone0
 */
public class Producto {
    String codigoProducto;
    String descripcion;
    String precioProducto;
    String stockProducto;
    String idCategoria;

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(String codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(String precioProducto) {
        this.precioProducto = precioProducto;
    }

    public String getStockProducto() {
        return stockProducto;
    }

    public void setStockProducto(String stockProducto) {
        this.stockProducto = stockProducto;
    }
    
    
}
