
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Movimiento;

public class MantenimientoMovimientoAdmSQLOra implements IMantenimientoMovimientoAdm{

    @Override
    public ArrayList<Movimiento> getListaMovimiento() {
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        ArrayList<Movimiento> listaMovimiento = new ArrayList();

        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select d.tipo_documento as tipo_movimiento, m.numero_documento, m.fecha, u.usuario, p.nombre_producto, m.cantidad from TBSKYLINK_MOVIMIENTO m, TBSKYLINK_DOCUMENTO d, TBSKYLINK_USUARIO u, TBSKYLINK_PRODUCTO p where m.id_movimiento=d.id_documento and m.id_usuario=u.id_usuario and m.codigo_producto=p.codigo_producto and m.activo='1'");

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
            System.out.println("Se tiene el siguiente error: " + e.getMessage());

        }
        return listaMovimiento;
        
    }

    @Override
    public int insertMovimiento(Movimiento mov) {
         int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "insert into TBSKYLINK_MOVIMIENTO values (?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, mov.getIdMovimiento());
            ps.setString(2, mov.getNumDocumento());
            ps.setString(3, mov.getFechaDocumento());
            ps.setString(4, mov.getUsuarioDocumento());
            ps.setString(5, mov.getCodigoProducto());
            ps.setString(6, mov.getCantidadProducto());
            ps.setString(7, "1");

            result = ps.executeUpdate();
            ps.close();
            ps = null;
            conn.close();
        } catch (Exception e) {
            System.out.println("No se pudo insertar el registro en la base de datos. Mensaje: " + e.getMessage());
        }
        return result;
        
    }

    @Override
    public int updateMovimiento(Movimiento mov) {
        
         int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "update TBSKYLINK_MOVIMIENTO set id_movimiento=?, fecha=?, usuario=?, codigo_producto=?, cantidad=? where numero_documento=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mov.getIdMovimiento());
            ps.setString(2, mov.getFechaDocumento());
            ps.setString(3, mov.getUsuarioDocumento());
            ps.setString(4, mov.getCodigoProducto());
            ps.setString(5, mov.getCantidadProducto());
            ps.setString(6, mov.getNumDocumento());

            result = ps.executeUpdate();
            ps.close();
            ps = null;
            conn.close();
        } catch (Exception e) {
            System.out.println("No se pudo actualizar el registro en la base de datos. Mensaje: " + e.getMessage());
        }

        return result;
        
        
    }

    @Override
    public int deleteMovimiento(Movimiento mov) {
        
         int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "update TBSKYLINK_MOVIMIENTO set activo=? where numero_documento=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "0");
            ps.setString(2, mov.getNumDocumento());

            result = ps.executeUpdate();
            ps.close();
            ps = null;
            conn.close();

        } catch (Exception e) {
            System.out.println("No se pudo eliminar el registro en la base de datos. Mensaje: " + e.getMessage());
        }

        return result;
        
        
    }
    
}
