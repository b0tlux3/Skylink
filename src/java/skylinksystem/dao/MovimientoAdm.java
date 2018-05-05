
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Movimiento;

public class MovimientoAdm {
    
    public ArrayList<Movimiento> getListaMovimiento(){
     Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
    
         ArrayList<Movimiento> listaMovimiento = new ArrayList();
        
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id_movimiento, numero_documento, fecha, usuario, codigo_producto, cantidad from movimiento");
            
            while (rs.next()) {                
                Movimiento movimiento = new Movimiento();
                movimiento.setIdMovimiento(rs.getString(1));
                movimiento.setNumDocumento(rs.getString(2));
                movimiento.setFechaDocumento(rs.getString(3));
                movimiento.setUsuarioDocumento(rs.getString(4));
                movimiento.setCodigoProducto(rs.getString(5));
                movimiento.setCantidadProducto(rs.getString(6));
                listaMovimiento.add(movimiento);
                
            }
            
            
        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage() );
        }
    
    return listaMovimiento;
}
}
