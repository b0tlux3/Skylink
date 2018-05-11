/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Producto;

/**
 *
 * @author Usuario-Clone0
 */
public class MantenimientoProductosAdmSQLOra implements IMantenimientoProductosAdm{

    @Override
    public ArrayList<Producto> getListaProducto() {
         Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
        
          ArrayList<Producto> listaProducto = new ArrayList();
          
          try {
             Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("Select s.codigo_producto, s.nombre_producto, s.precio_producto, stock_producto, c.nom_categoria From (producto) s, (categoria) c Where s.id_categoria = c.id_categoria and s.ACTIVO='1' order by codigo_producto");
            
            while (rs.next()) {                
                Producto producto = new Producto();
                producto.setCodigoProducto(rs.getString(1));
                producto.setDescripcion(rs.getString(2));
                producto.setPrecioProducto(rs.getString(3));
                producto.setStockProducto(rs.getString(4));
                producto.setIdCategoria(rs.getString(5));
               
                listaProducto.add(producto);
                
            }
            
        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage() );
            
        }
           return listaProducto;
        
    }

    @Override
    public int insertProducto(Producto prod) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "insert into producto values (PRODUCTO_SEQ1.NEXTVAL,?,?,?,?,?)";
            
            try {
             PreparedStatement ps = conn.prepareStatement(sql);
                
             ps.setString(1, prod.getDescripcion());
             ps.setString(2, prod.getPrecioProducto());
                ps.setString(3, prod.getStockProducto());
                ps.setString(4, prod.getIdCategoria());
                ps.setString(5, "1");
                
                result = ps.executeUpdate();
                ps.close();
                ps = null;
                conn.close();
        } catch (Exception e) {
            System.out.println("No se pudo insertar el registro en la base de datos. Mensaje: "+ e.getMessage());
        }
             return result;
        
    }

    @Override
    public int updateProducto(Producto prod) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "update producto set nombre_producto=?, precio_producto=?, stock_producto=?, id_categoria=? where codigo_producto=?";
            
            try {
            PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, prod.getDescripcion());
                ps.setString(2, prod.getPrecioProducto());
                ps.setString(3, prod.getStockProducto());
                ps.setString(4, prod.getIdCategoria());
                ps.setString(5, prod.getCodigoProducto());
                
                result = ps.executeUpdate();
                ps.close();
                ps = null;
                conn.close();
        } catch (Exception e) {
            System.out.println("No se pudo actualizar el registro en la base de datos. Mensaje: "+ e.getMessage());
        }
            
             return result;
        
    }

    @Override
    public int deleteProducto(Producto prod) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "update producto set activo=? where codigo_producto=?";
            try {
            PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, "0");
                ps.setString(2, prod.getCodigoProducto());
                
                result = ps.executeUpdate();
                ps.close();
                ps = null;
                conn.close();
                
        } catch (Exception e) {
            System.out.println("No se pudo eliminar el registro en la base de datos. Mensaje: "+ e.getMessage());
        }
            
             return result;
        
    }
    
}
