
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Usuario;


public class UserValidateAdmSQLOra implements IUserValidateAdm{
   
    @Override
    public Usuario validarUsuario(String usuario, String password) {
        Usuario usuarioObjeto = null;
        
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement("Select s.usuario_id, s.usuario_name, s.usuario_password, c.tipo_name From (TBSKYLINK_USERS) s, (TBSKYLINK_USERSROLES) c Where s.TIPO_ID = c.TIPO_ID and s.usuario_name=? and s.usuario_password=?");
            
            ps.setString(1, usuario);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {                
                //Usuario usuario = new Usuario();
                usuarioObjeto = new Usuario();
                usuarioObjeto.setIdUsuario(rs.getString(1));
                usuarioObjeto.setUserName(rs.getString(2));
                usuarioObjeto.setUserPass(rs.getString(3));
                usuarioObjeto.setTipoUsuario(rs.getString(4));
               
                
            }
            
            
            rs.close();
            ps.close();
            conn.close();
            
        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage() );
        }
        
        return usuarioObjeto;
        
    }
    
    
}
