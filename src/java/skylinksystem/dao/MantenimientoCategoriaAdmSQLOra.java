package skylinksystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Categoria;

public class MantenimientoCategoriaAdmSQLOra implements IMantenimientoCategoriaAdm {

    @Override
    public ArrayList<Categoria> getListaCategoria() {
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        ArrayList<Categoria> listaCategoria = new ArrayList();

        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id_categoria, nom_categoria from TBSKYLINK_CATEGORIA where activo='1'");

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getString(1));
                categoria.setNombreCategoria(rs.getString(2));

                listaCategoria.add(categoria);

            }

        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage());

        }
        return listaCategoria;

    }

    @Override
    public int insertCategoria(Categoria cat) {

        int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "insert into TBSKYLINK_CATEGORIA values (?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, cat.getIdCategoria());
            ps.setString(2, cat.getNombreCategoria());
            ps.setString(3, "1");

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
    public int updateCategoria(Categoria cat) {

        int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "update TBSKYLINK_CATEGORIA set nom_categoria=? where id_categoria=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cat.getNombreCategoria());
            ps.setString(2, cat.getIdCategoria());

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
    public int deleteCategoria(Categoria cat) {

        int result = 0;
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        String sql = "update TBSKYLINK_CATEGORIA set activo=? where id_categoria=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "0");
            ps.setString(2, cat.getIdCategoria());

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
