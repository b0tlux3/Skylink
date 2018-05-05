
package skylinksystem.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.modelo.Usuario;


public class UsuarioAdm {
    
    public ArrayList<Usuario> getListaUsuario(){
     Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
    
         ArrayList<Usuario> listaUsuario = new ArrayList();
        
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("Select s.usuario_id, s.usuario_name, s.usuario_password, c.tipo_name From (users) s, (user_roles) c Where s.TIPO_ID = c.TIPO_ID ");
            
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
    
    
}
