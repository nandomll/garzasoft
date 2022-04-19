/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.beancliente;
import bean.beanproyecto;
import bean.beantrabajador;
import config.conexion;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class daocliente {
    conexion cn= new  conexion();
     Connection con;
     PreparedStatement ps;
     ResultSet rs;
     
    /*validar cliente */
     public beancliente validar(String dni, String clave){
         beancliente bcli =new beancliente();
         String sql="select * from cliente where dni=? and clave=? and elimina='activo'";
         
         try{
             con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, clave);
            rs=ps.executeQuery();
             while(rs.next()){
              bcli.setIdcliente(rs.getInt("idcliente"));
              bcli.setNombrecli(rs.getString("nombre"));
              bcli.setApellidocli(rs.getString("apellido"));
              bcli.setClavecli(rs.getString("clave"));
              bcli.setDnicli(rs.getString("dni"));
              
            }  
             
             ps.close();
         }    catch(Exception e){
            
        }
         
         return bcli;
     }
    
    /*capturar un cliente*/ 
       public beancliente cliente(int idcliente){
         beancliente bcli =new beancliente();
         String sql="select *from cliente where idcliente="+idcliente;
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
             while(rs.next()){
               bcli.setIdcliente(rs.getInt("idcliente"));
               bcli.setNombrecli(rs.getString("nombre"));
               bcli.setApellidocli(rs.getString("apellido"));
               bcli.setDnicli(rs.getString("dni"));
               bcli.setTelefonocli(rs.getString("telefono"));
               bcli.setCorreocli(rs.getString("correo"));
               bcli.setClavecli(rs.getString("clave"));
           }
           ps.close();
           }catch(Exception e){
               
           }
         return bcli;
     }
       
      /*metodo actualizar perfil cliente*/ 
       
       public String actualizar ( beancliente cli){
         String out;
         String sql="update cliente set telefono=? , correo=? where idcliente=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1,cli.getTelefonocli());
              ps.setString(2,cli.getCorreocli());
              ps.setInt(3, cli.getIdcliente());
              ps.executeUpdate();
             out = "Correcto...";
             
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
       
     /*metodo para actualizar clave*/     
     public String actualizarclave(beancliente cli, String clavenueva){
                String out;
         String sql="Update cliente set clave=? where idcliente=? and clave=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1, clavenueva);
              ps.setInt(2, cli.getIdcliente());
              ps.setString(3, cli.getClavecli());
              ps.executeUpdate();
             out = "Correcto...";
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;  
     }
     
     /*Contar numero de cliente activos*/ 
     public String numerodeclientes()
     {
         String numero="";
         String sql="select count(*) from cliente where elimina='activo'";
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
             
            ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
     
     /*Listar Clientes activos*/
        public List listar(){
        String sql="select*from cliente where elimina='activo'"; 
       ArrayList<beancliente> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beancliente cli=new beancliente();
               cli.setIdcliente(rs.getInt("idcliente"));
               cli.setNombrecli(rs.getString("nombre"));
               cli.setApellidocli(rs.getString("apellido"));
               cli.setTelefonocli(rs.getString("telefono"));
               cli.setCorreocli(rs.getString("correo"));
               cli.setDnicli(rs.getString("dni"));
               cli.setSexocli(rs.getString("sexo"));
               cli.setCondicioncli(rs.getString("condicion"));
               cli.setIngresocli(rs.getString("ingreso"));
               cli.setClavecli(rs.getString("clave"));
               lista.add(cli);
            }
            ps.close();
               return lista; 
         
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
     
    /* validar dni*/
     public String Dni( String dni)
     {
         String numero="";
         String sql="select count(*) from cliente where dni="+dni;
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            } 
            
            ps.close();
         }catch(Exception e){
             
         }
         return numero;
     }
   /* Agregar cliente*/
        public String agregar(beancliente cli){
         String out;
         String sql="insert into cliente(nombre,apellido,telefono,correo,clave,ingreso,condicion,elimina,dni,sexo)"
                 + " values (?,?,?,?,?,?,?,?,?,?);";
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, cli.getNombrecli());
           ps.setString(2, cli.getApellidocli());
           ps.setString(3, cli.getTelefonocli());
           ps.setString(4, cli.getCorreocli());
           ps.setString(5, cli.getClavecli());
           ps.setString(6, cli.getIngresocli());
           ps.setString(7,cli.getCondicioncli());
           ps.setString(8,cli.getEliminacli());
           ps.setString(9,cli.getDnicli());
           ps.setString(10,cli.getSexocli());
           ps.executeUpdate();
           
           out = "registrado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;       
        
     }
     
    /* Actualizar cliente*/
      public String actualizarcliente(beancliente cli){
         String out;
         String sql="update cliente set nombre=? ,apellido=?,telefono=?,correo=?, clave=?, ingreso=?,condicion=?,dni=?,sexo=? where idcliente=?;";
            try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, cli.getNombrecli());
           ps.setString(2, cli.getApellidocli());
           ps.setString(3, cli.getTelefonocli());
           ps.setString(4, cli.getCorreocli());
           ps.setString(5, cli.getClavecli());
           ps.setString(6, cli.getIngresocli());
           ps.setString(7,cli.getCondicioncli());
           ps.setString(8, cli.getDnicli());
           ps.setString(9,cli.getSexocli());
           ps.setInt(10, cli.getIdcliente());
           
           ps.executeUpdate();
           out = "modificado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;
     }
     
    /*eliminar cliente*/
    public String eliminar (int idcliente){
      String out;
      String sql="update cliente set elimina='noactivo' where idcliente="+idcliente;
      try{

        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        out = "Eliminado";
        ps.close();
     } catch(Exception e)
     {
        out= "Error: " + e.getMessage(); 
     }

     return out;

  }
    
  /* Listar proyectos por cliente*/
    
       public List listarpordni( String dnicliente){
        String sql="select proyecto.nombre from proyecto inner join cliente"
                + " on proyecto.idcliente=cliente.idcliente where proyecto.mantenimiento='no' and cliente.dni="+dnicliente; 
       ArrayList<beanproyecto> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beanproyecto pro=new beanproyecto();
               pro.setNombre(rs.getString("nombre"));
               
               lista.add(pro);
            }
            
            ps.close();
               return lista;
               
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
       
       
       /*numero de proyectos por cliente*/
      public String numerodeproyectosporcliente( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente where cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
           ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
    /*numeros de proyecto de soporte por cliente*/  
     public String numerodesoportesporcliente( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente where proyecto.tipo='Soporte' and cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
           ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
     /*Numero de proyectos de desarrollo por cliente*/
     public String numerodedesarrolloporcliente( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente where proyecto.tipo='Desarrollo' and cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
            ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
     
     /*numero de proyectos pendientes por cliente*/
     
     public String numdeproyectospendientes( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente"
                 + " where proyecto.estado='Pendiente' and cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
           ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
     
     
     
     /*numero de proyectos en proceso por cliente*/
      public String numdeproyectosenproceso( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente"
                 + " where proyecto.estado='En Proceso' and cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
          ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
     
       /*numero de proyectos terminados por cliente*/
      public String numdeproyectosterminados( String dnicliente)
     {
         String numero="";
         String sql="select count(*) from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente"
                 + " where proyecto.estado='Terminado' and cliente.dni="+dnicliente;
         
         try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                numero=rs.getString(1);
            }
           ps.close();
         }catch(Exception e){
             
         }
         
         return numero;
     }
      
     /*listar proyectos de soporte por cliente*/
       public List listarpoyectosporsoporte(int idcliente){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente "
                + "inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador "
                + "where proyecto.elimina='activo' and proyecto.tipo='Soporte' and cliente.idcliente="+idcliente; 
       ArrayList<beanproyecto> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beanproyecto pro=new beanproyecto();
               beancliente cli=new beancliente();
               beantrabajador tra=new beantrabajador();
               pro.setIdproyecto(rs.getInt(1));
               pro.setInicio(rs.getString(2));
               pro.setEstado(rs.getString(3));
               pro.setFin(rs.getString(4));
               pro.setTipo(rs.getString(5));
               pro.setNombre(rs.getString(6));
               cli.setNombrecli(rs.getString(7));
               cli.setApellidocli(rs.getString(8));
               cli.setDnicli(rs.getString(11));
               pro.setIdcliente(cli);
               tra.setNombre(rs.getString(9));
               tra.setApellido(rs.getString(10));
               pro.setIdtrabajador(tra);
               lista.add(pro);
            }
               ps.close();
               return lista; 
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
       
      /*Listar Proyectos de Desarrollo  por cliente*/
       public List listarpoyectospordesarrollo( int idcliente){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni,proyecto.condicion,proyecto.mantenimiento"
                + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador"
                + " where proyecto.elimina='activo' and proyecto.tipo='Desarrollo' and cliente.idcliente="+idcliente; 
       ArrayList<beanproyecto> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beanproyecto pro=new beanproyecto();
               beancliente cli=new beancliente();
               beantrabajador tra=new beantrabajador();
               pro.setIdproyecto(rs.getInt(1));
               pro.setInicio(rs.getString(2));
               pro.setEstado(rs.getString(3));
               pro.setFin(rs.getString(4));
               pro.setTipo(rs.getString(5));
               pro.setNombre(rs.getString(6));
               cli.setNombrecli(rs.getString(7));
               cli.setApellidocli(rs.getString(8));
               cli.setDnicli(rs.getString(11));
               pro.setIdcliente(cli);
               tra.setNombre(rs.getString(9));
               tra.setApellido(rs.getString(10));
               pro.setIdtrabajador(tra);
               pro.setCondicion(rs.getString(12));
               pro.setMantenimiento(rs.getString(13));
               lista.add(pro);
            }
               ps.close();
               return lista; 
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }   

}
