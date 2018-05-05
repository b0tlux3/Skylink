package skylinksystem.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import skylinksystem.vo.Categoria;

public class CategoriaAdm {

    public ArrayList<Categoria> getListaCategoria() {
        Conexion conecta = new Conexion();
        Connection conn = conecta.getConnection();

        ArrayList<Categoria> listaCategoria = new ArrayList();

        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id_categoria, nom_categoria from categoria");

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

}
