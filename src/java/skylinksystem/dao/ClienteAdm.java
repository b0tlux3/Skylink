package skylinksystem.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.modelo.Cliente;

public class ClienteAdm {

    public ArrayList<Cliente> getListaCliente() {
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();
        
        ArrayList<Cliente> listaCliente = new ArrayList();
        
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id_usuario, rol_usuario from usuario");
            
            while (rs.next()) {                
                Cliente cliente = new Cliente();
                cliente.setIdUsuario(rs.getString(1));
                cliente.setRolUsuario(rs.getString(2));
                listaCliente.add(cliente);
                
            }
            
            
        } catch (Exception e) {
            System.out.println("Se tiene el siguiente error: " + e.getMessage() );
        }

        return listaCliente;
    }

}
