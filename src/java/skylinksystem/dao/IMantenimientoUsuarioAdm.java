/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.dao;

import java.util.ArrayList;
import skylinksystem.vo.Usuario;

/**
 *
 * @author Usuario-Clone0
 */
public interface IMantenimientoUsuarioAdm {
    
    public ArrayList getListaUsuario();
    
     public int insertUsuario(Usuario usu);
    public int updateUsuario(Usuario usu);
    public int deleteUsuario(Usuario usu);
    
}
