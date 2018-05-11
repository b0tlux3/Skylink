/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.dao;

import java.util.ArrayList;
import skylinksystem.vo.Categoria;


/**
 *
 * @author Docente
 */
public interface IMantenimientoCategoriaAdm {
    
     public ArrayList getListaCategoria();

    public int insertCategoria(Categoria cat);

    public int updateCategoria(Categoria cat);

    public int deleteCategoria(Categoria cat);
    
    
    
}
