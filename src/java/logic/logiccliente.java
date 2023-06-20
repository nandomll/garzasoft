/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import bean.beancliente;
import dao.daoadministrador;
import dao.daocliente;
import dao.daotrabajador;
import java.util.List;

/**
 *
 * @author hp
 */
public class logiccliente {
     public beancliente validar(String dni , String contra){
        daocliente dacli =new daocliente();
        return (dacli.validar(dni, contra));
    }
    
    public beancliente cliente(int idcliente){
         daocliente dacli =new daocliente();
         return (dacli.cliente(idcliente));
    }
    
    
    public String actualizar(beancliente cli){
        beancliente bcliente =new beancliente();
        daocliente dcliente=new daocliente();
        bcliente.setTelefonocli(cli.getTelefonocli());
        bcliente.setCorreocli(cli.getCorreocli());
        bcliente.setIdcliente(cli.getIdcliente());
        return dcliente.actualizar(bcliente);
    }
    
    public String actualizarclave(beancliente cli, String clavenueva){
        beancliente bcliente =new beancliente();
        daocliente dcliente=new daocliente();
        bcliente.setClavecli(cli.getClavecli());
        bcliente.setIdcliente(cli.getIdcliente());
        return dcliente.actualizarclave(bcliente, clavenueva);
    }
    
    public String numerodecliente(){
      daocliente dcliente=new daocliente();
      return dcliente.numerodeclientes();
    }
    public List listar(){
        daocliente dcliente=new daocliente();
        /*llamar clientes nuevos
          recorrer la lista
          veificar el tiempo
          modificar condicion
          listar todos los clientes
        */
       return ( dcliente.listar());
    }
    
    
    public String agregar(beancliente cli, String dni,String fechaingreso){
         beancliente bcliente =new beancliente();
         daocliente dcliente=new daocliente();
         daotrabajador dtrabajador=new daotrabajador();
         daoadministrador dadministrador=new daoadministrador();
         
       if(dcliente.Dni(dni).equalsIgnoreCase("0") && dtrabajador.Dni(dni).equalsIgnoreCase("0")
           && dadministrador.Dni(dni).equalsIgnoreCase("0")){
          bcliente.setNombrecli(cli.getNombrecli());
          bcliente.setApellidocli(cli.getApellidocli());
          bcliente.setTelefonocli(cli.getTelefonocli());
          bcliente.setCorreocli(cli.getCorreocli());
          bcliente.setClavecli(cli.getClavecli());
          bcliente.setIngresocli(cli.getIngresocli());
          bcliente.setDnicli(cli.getDnicli());
          bcliente.setSexocli(cli.getSexocli());
          bcliente.setEliminacli("activo");
          int condicion=Integer.parseInt(dadministrador.condicion(fechaingreso));
          if(condicion>=5){
              bcliente.setCondicioncli("Antiguo");
          }else{
              bcliente.setCondicioncli("Nuevo");
          }
          
          return dcliente.agregar(bcliente);
        }else{
          return "errordni";  
        }
        
    }
    
  public String actualizarcliente(beancliente cli,String dni, String fechaingreso){
       beancliente bcliente =new beancliente();
       daocliente dcliente=new daocliente();
       daotrabajador dtrabajador=new daotrabajador();
       daoadministrador dadministrador=new daoadministrador();
        if(dcliente.Dni(dni).equalsIgnoreCase("0") && dtrabajador.Dni(dni).equalsIgnoreCase("0")
           && dadministrador.Dni(dni).equalsIgnoreCase("0")){
          return "errordni2";
        }else{
            
          bcliente.setNombrecli(cli.getNombrecli());
          bcliente.setApellidocli(cli.getApellidocli());
          bcliente.setTelefonocli(cli.getTelefonocli());
          bcliente.setCorreocli(cli.getCorreocli());
          bcliente.setClavecli(cli.getClavecli());
          bcliente.setIngresocli(cli.getIngresocli());
          bcliente.setDnicli(cli.getDnicli());
          bcliente.setSexocli(cli.getSexocli());
          int condicion=Integer.parseInt(dadministrador.condicion(fechaingreso));
          if(condicion>=5){
              bcliente.setCondicioncli("Antiguo");
          }else{
              bcliente.setCondicioncli("Nuevo");
          }
          bcliente.setIdcliente(cli.getIdcliente());
          return dcliente.actualizarcliente(bcliente);
       }
 
  }  
   
  public String eliminar(int idcliente){
      daocliente dcliente=new daocliente();
      return dcliente.eliminar(idcliente);
  }
  
  public List listarpordni(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.listarpordni(dnicliente);
  }
  
  public String numerodeproyectosporcliente(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numerodeproyectosporcliente(dnicliente);
  }
   public String numerodesoporteporcliente(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numerodesoportesporcliente(dnicliente);
  }
     public String numerodedesarrolloporcliente(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numerodedesarrolloporcliente(dnicliente);
  }
     public String numdeproyectospendientes(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numdeproyectospendientes(dnicliente);
  } 
   public String numdeproyectosenproceso(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numdeproyectosenproceso(dnicliente);
  }  
   
   public String numdeproyectosterminados(String dnicliente){
      daocliente dcliente=new daocliente();
      return dcliente.numdeproyectosterminados(dnicliente);
  } 
   
  public List listarpoyectosporsoporte(int idcliente){
    daocliente dcliente=new daocliente();
      return dcliente.listarpoyectosporsoporte(idcliente);  
  }
  public List listarpoyectospordesarrollo(int idcliente){
    daocliente dcliente=new daocliente();
      return dcliente.listarpoyectospordesarrollo(idcliente);  
  }
}
