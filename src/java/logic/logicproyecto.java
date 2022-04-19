/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import bean.beanproyecto;
import dao.daoproyecto;
import java.util.List;

/**
 *
 * @author hp
 */
public class logicproyecto {
   public String numerodeproyectos(){
       daoproyecto dproyecto = new daoproyecto();
       return dproyecto.numerodeproyectos();
   } 
    public String numerodeproyectospendientes(){
       daoproyecto dproyecto = new daoproyecto();
       return dproyecto.numerodeproyectospendientes();
   } 
    public String numerodeproyectosenproceso(){
       daoproyecto dproyecto = new daoproyecto();
       return dproyecto.numerodeproyectosenproceso();
   } 
    public String numerodeproyectosterminado(){
       daoproyecto dproyecto = new daoproyecto();
       return dproyecto.numerodeproyectosterminados();
   }
    
   public String agregar( beanproyecto pro){
          daoproyecto dproyecto = new daoproyecto();
          beanproyecto bproyecto =new beanproyecto();
          bproyecto.setInicio(pro.getInicio());
          bproyecto.setEstado("Pendiente");
          bproyecto.setFin(pro.getFin());
          bproyecto.setElimina("activo");
          bproyecto.setIdcliente(pro.getIdcliente());
          bproyecto.setIdtrabajador(pro.getIdtrabajador());
          bproyecto.setTipo(pro.getTipo());
          bproyecto.setNombre(pro.getNombre());
          bproyecto.setCondicion(pro.getCondicion());
          bproyecto.setMantenimiento(pro.getMantenimiento());
          return dproyecto.agregar(bproyecto);
   }
   
   public String actualizarproyecto( beanproyecto pro){
        daoproyecto dproyecto = new daoproyecto();
        beanproyecto bproyecto =new beanproyecto();
        bproyecto.setInicio(pro.getInicio());
        bproyecto.setFin(pro.getFin());
        bproyecto.setIdcliente(pro.getIdcliente());
        bproyecto.setIdtrabajador(pro.getIdtrabajador());
        bproyecto.setNombre(pro.getNombre());
        bproyecto.setIdproyecto(pro.getIdproyecto());
        return dproyecto.actualizarproyecto(bproyecto);
   }
    
   public String modificarfecha(beanproyecto pro){
      daoproyecto dproyecto = new daoproyecto();
        beanproyecto bproyecto =new beanproyecto(); 
        bproyecto.setFin(pro.getFin());
        bproyecto.setIdproyecto(pro.getIdproyecto());
        return dproyecto.modificarfecha(bproyecto);
   }
   public List listarproyectosporsoporte(){
        daoproyecto dproyecto = new daoproyecto();
        return dproyecto.listarpoyectosporsoporte();
   }
    public List listarproyectosporsoportemantenimiento(){
        daoproyecto dproyecto = new daoproyecto();
        return dproyecto.listarpoyectospordesarrollomantenimiento();
   }
   public List listarproyectosporsoportemantenimientoterminado(){
        daoproyecto dproyecto = new daoproyecto();
        return dproyecto.listarpoyectospordesarrollomantenimientoterminado();
   }
   public List listarproyectospordesarrollo(){
        daoproyecto dproyecto = new daoproyecto();
        return dproyecto.listarpoyectospordesarrollo();
   }
  
   public String elimina(int idproyecto){
      daoproyecto dproyecto = new daoproyecto();
      return dproyecto.eliminar(idproyecto);
   } 
   
   public beanproyecto proyecto(int idproyecto){
         daoproyecto dproyecto = new daoproyecto();
         return dproyecto.proyecto(idproyecto);
   }
   
     public String actualizarproyectocondicion( beanproyecto pro){
        daoproyecto dproyecto = new daoproyecto();
        beanproyecto bproyecto =new beanproyecto();
        bproyecto.setIdproyecto(pro.getIdproyecto());
        return dproyecto.actualizarproyectocondicion(bproyecto);
   }
}
