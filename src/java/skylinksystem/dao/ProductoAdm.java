
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Producto;

public class ProductoAdm {
    public ArrayList<Producto> getListaProducto(){
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
    
    public ArrayList<Producto> getListaProductoSinBD(){
        ArrayList<Producto>listaProducto = new ArrayList<Producto>();
       Producto prod1 = new Producto();
       Producto prod2 = new Producto();
       Producto prod3 = new Producto();
       
       prod1.setCodigoProducto("1011");
       prod1.setDescripcion("Cable UTP Cupper Cat6");
       prod1.setIdCategoria("1");
       prod1.setPrecioProducto("350.12");
       prod1.setStockProducto("150");
       
       prod2.setCodigoProducto("101");
       prod2.setDescripcion("Cable UTP 6M Cupper Cat7");
       prod2.setIdCategoria("2");
       prod2.setPrecioProducto("360.12");
       prod2.setStockProducto("250");
       
       
       listaProducto.add(prod1);
       listaProducto.add(prod2);

        return listaProducto;
    
    }
    
    
    
}
