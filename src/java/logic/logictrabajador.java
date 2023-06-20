/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import bean.beanproyecto;
import bean.beantrabajador;
import dao.daoadministrador;
import dao.daocliente;
import dao.daotrabajador;
import java.util.List;

/**
 *
 * @author hp
 */
public class logictrabajador {
    public beantrabajador validar(String dni , String contra){
        daotrabajador datrab =new daotrabajador();
        return (datrab.validar(dni, contra));
    }
    
    public beantrabajador trabajador(int idtrabajador){
        daotrabajador datrab =new daotrabajador();
        return (datrab.trabajador(idtrabajador));
    }
    
    public String actualizar(beantrabajador trab){
        beantrabajador btrabajador=new beantrabajador();
        daotrabajador dtrabajador=new daotrabajador();
        btrabajador.setTelefono(trab.getTelefono());
        btrabajador.setCorreo(trab.getCorreo());
        btrabajador.setIdtrabajador(trab.getIdtrabajador());
        return dtrabajador.actualizar(btrabajador);
    }
    public String actualizarclave(beantrabajador trab ,String clavenueva){
         beantrabajador btrabajador=new beantrabajador();
         daotrabajador dtrabajador=new daotrabajador();
         btrabajador.setClave(trab.getClave());
         btrabajador.setIdtrabajador(trab.getIdtrabajador());
         return dtrabajador.actualizarclave(btrabajador, clavenueva);
    }
    public String numerodetrabajadores(){
         daotrabajador dtrabajador=new daotrabajador();
         return dtrabajador.numerodetrabajadores();
    }
     public List listar(){
         daotrabajador dtrabajador=new daotrabajador();
       return ( dtrabajador.listar());
    }
     
     public String actualizarlibre(int idtrabajador){
        daotrabajador dtrabajador=new daotrabajador();
        return dtrabajador.actualizarlibre(idtrabajador);
     }
      
     public String actualizarocupado(int idtrabajador){
        daotrabajador dtrabajador=new daotrabajador();
        return dtrabajador.actualizarocupado(idtrabajador);
     }
     
     public String agregar(beantrabajador trab, String dni,String fechaingreso){
         beantrabajador btrabajador=new beantrabajador();
         daocliente dcliente=new daocliente();
         daotrabajador dtrabajador=new daotrabajador();
         daoadministrador dadministrador=new daoadministrador();
         
       if(dcliente.Dni(dni).equalsIgnoreCase("0") && dtrabajador.Dni(dni).equalsIgnoreCase("0")
           && dadministrador.Dni(dni).equalsIgnoreCase("0")){
          btrabajador.setNombre(trab.getNombre());
          btrabajador.setApellido(trab.getApellido());
          btrabajador.setTelefono(trab.getTelefono());
          btrabajador.setCorreo(trab.getCorreo());
          btrabajador.setClave(trab.getClave());
          btrabajador.setIngreso(trab.getIngreso());
          btrabajador.setDni(trab.getDni());
          btrabajador.setSexo(trab.getSexo());
          btrabajador.setElimina("activo");
          btrabajador.setEstado("libre");
          int condicion=Integer.parseInt(dadministrador.condicion(fechaingreso));
          if(condicion>=5){
              btrabajador.setCondicion("Antiguo");
          }else{
              btrabajador.setCondicion("Nuevo");
          }
          
          return dtrabajador.agregar(btrabajador);
        }else{
          return "errordni";  
        }
        
    }
     
     public String actualizartrabajador(beantrabajador trab,String dni, String fechaingreso){
         beantrabajador btrabajador=new beantrabajador();
       daocliente dcliente=new daocliente();
       daotrabajador dtrabajador=new daotrabajador();
       daoadministrador dadministrador=new daoadministrador();
        if(dcliente.Dni(dni).equalsIgnoreCase("0") && dtrabajador.Dni(dni).equalsIgnoreCase("0")
           && dadministrador.Dni(dni).equalsIgnoreCase("0")){
          return "errordni2";
        }else{
            
         btrabajador.setNombre(trab.getNombre());
         btrabajador.setApellido(trab.getApellido());
         btrabajador.setTelefono(trab.getTelefono());
         btrabajador.setCorreo(trab.getCorreo());
         btrabajador.setClave(trab.getClave());
         btrabajador.setIngreso(trab.getIngreso());
         btrabajador.setDni(trab.getDni());
         btrabajador.setSexo(trab.getSexo());
          int condicion=Integer.parseInt(dadministrador.condicion(fechaingreso));
          if(condicion>=5){
              btrabajador.setCondicion("Antiguo");
          }else{
              btrabajador.setCondicion("Nuevo");
          }
          btrabajador.setIdtrabajador(trab.getIdtrabajador());
          return dtrabajador.actualizartrabajador(btrabajador);
       }
 
  }   
    
    public String eliminar(int idtrabajador){
      daotrabajador dtrabajador=new daotrabajador();
      return dtrabajador.eliminar(idtrabajador);
    }
    
      public List listarporestado(){
         daotrabajador dtrabajador=new daotrabajador();
       return ( dtrabajador.listarporestado());
    }
     
    public beanproyecto proyecto(int idtrabajador){
      daotrabajador dtrabajador=new daotrabajador();
      
      return dtrabajador.proyecto(idtrabajador);
    }
    
    public String actualizaraproceso(int idproyecto){
     daotrabajador dtrabajador=new daotrabajador();
     return dtrabajador.actualizaraenproceso(idproyecto);
    }
    
     public String actualizaraterminado(int idproyecto){
     daotrabajador dtrabajador=new daotrabajador();
     return dtrabajador.actualizarterminado(idproyecto);
    }
     
    public beanproyecto listarpordni(String dnitrabajador){
      daotrabajador dtrabajador=new daotrabajador();
     return dtrabajador.listarpordni(dnitrabajador);  
    }
}
