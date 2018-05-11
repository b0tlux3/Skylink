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
import skylinksystem.vo.Usuario;

/**
 *
 * @author Usuario-Clone0
 */
public class MantenimientoUsuarioAdmSQLOra implements IMantenimientoUsuarioAdm{

    @Override
    public ArrayList<Usuario> getListaUsuario() {
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
    
         ArrayList<Usuario> listaUsuario = new ArrayList();
        
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("Select s.usuario_id, s.usuario_name, s.usuario_password, c.tipo_name From (users) s, (user_roles) c Where s.TIPO_ID = c.TIPO_ID and s.activo='1' order by s.usuario_id");
            
            while (rs.next()) {                
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getString(1));
                usuario.setUserName(rs.getString(2));
                usuario.setUserPass(rs.getString(3));
                usuario.setTipoUsuario(rs.getString(4));
               
                listaUsuario.add(usuario);
                
            }
            
            
        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage() );
        }
    
    return listaUsuario;
        
    }

    @Override
    public int insertUsuario(Usuario usu) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "INSERT INTO users (usuario_id,usuario_name,usuario_password,tipo_id, activo) VALUES (?,?,?,?,?)";
            
            try {
             PreparedStatement ps = conn.prepareStatement(sql);
                
             ps.setString(1, usu.getIdUsuario());
             ps.setString(2, usu.getUserName());
                ps.setString(3, usu.getUserPass());
                ps.setString(4, usu.getTipoUsuario());
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
    public int updateUsuario(Usuario usu) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "update users set usuario_name=?, usuario_password=?, tipo_id=? where usuario_id=?";
            
            try {
            PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, usu.getUserName());
                ps.setString(2, usu.getUserPass());
                ps.setString(3, usu.getTipoUsuario());
                ps.setString(4, usu.getIdUsuario());
                
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
    public int deleteUsuario(Usuario usu) {
        int result = 0;
            Conexion conecta = new Conexion();
            Connection conn = conecta.getConnection();        

            String sql = "update users set activo=? where usuario_id=?";
            try {
            PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, "0");
                ps.setString(2, usu.getIdUsuario());
                
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
