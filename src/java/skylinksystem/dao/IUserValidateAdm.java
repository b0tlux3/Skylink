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
 * @author Docente
 */
public interface IUserValidateAdm {
    
    public Usuario validarUsuario(String usuario, String password);
    
}
