/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skylinksystem.dao;

import java.util.ArrayList;
import skylinksystem.vo.Movimiento;

/**
 *
 * @author Docente
 */
public interface IMantenimientoMovimientoAdm {
     public ArrayList getListaMovimiento();

    public int insertMovimiento(Movimiento mov);

    public int updateMovimiento(Movimiento mov);

    public int deleteMovimiento(Movimiento mov);
    
}
