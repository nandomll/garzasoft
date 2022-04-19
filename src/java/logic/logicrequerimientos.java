/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import bean.beanrequerimientos;
import dao.daorequerimientos;
import java.util.List;

/**
 *
 * @author hp
 */
public class logicrequerimientos {
    public String agregar(beanrequerimientos req){
        daorequerimientos drequerimientos=new daorequerimientos();
        beanrequerimientos brequerimientos=new beanrequerimientos();
        brequerimientos.setRequerimientos(req.getRequerimientos());
        brequerimientos.setEstado("Pendiente");
        brequerimientos.setElimina("activo");
        brequerimientos.setIdproyecto(req.getIdproyecto());
        
        return drequerimientos.agregar(brequerimientos);
    }
    
    public List listar(int idproyecto){
      daorequerimientos drequerimientos=new daorequerimientos();
      return drequerimientos.listar(idproyecto);
    }
    
    public String actualizar ( beanrequerimientos req){
      daorequerimientos drequerimientos=new daorequerimientos();
      beanrequerimientos brequerimientos=new beanrequerimientos(); 
      brequerimientos.setRequerimientos(req.getRequerimientos());
      brequerimientos.setIdrequeriminetos(req.getIdrequeriminetos());
      return drequerimientos.actualizar(brequerimientos);
    }
    
    public String eliminar (int idrequerimiento){
        daorequerimientos drequerimientos=new daorequerimientos();
        return drequerimientos.eliminar(idrequerimiento);
    }
    
    public String numrequerimientos(int idproyecto){
      daorequerimientos drequerimientos=new daorequerimientos(); 
      return drequerimientos.numeroderequerimientos(idproyecto);
    }
    
     public String numrequerimientosenproceso(int idproyecto){
      daorequerimientos drequerimientos=new daorequerimientos(); 
      return drequerimientos.numrequerimientosenproceso(idproyecto);
    }
     
     public String numrequerimientoterminados(int idproyecto){
      daorequerimientos drequerimientos=new daorequerimientos(); 
      return drequerimientos.numrequerimientosterminados(idproyecto);
    }
    
    public String actualizaraenproceso(int idrequerimiento){
      daorequerimientos drequerimientos=new daorequerimientos();
      return drequerimientos.actualizaraenproceso(idrequerimiento);
    }
    
     public String actualizaraterminado(int idrequerimiento){
      daorequerimientos drequerimientos=new daorequerimientos();
      return drequerimientos.actualizaraenterminado(idrequerimiento);
    }
    
}
