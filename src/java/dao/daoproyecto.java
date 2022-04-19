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
public class daoproyecto {
   conexion cn= new  conexion();
     Connection con;
     PreparedStatement ps;
     ResultSet rs;
     
     /* Contar numero de proyectos*/
     
     public String numerodeproyectos()
     {
         String numero="";
         String sql="select count(*) from proyecto where elimina='activo'";
         
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
     /*numero de proyectos pendientes*/
      public String numerodeproyectospendientes()
     {
         String numero="";
         String sql="select count(*) from proyecto where elimina='activo' and estado='Pendiente'";
         
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
     /*numero de proyectos en proceso*/
      public String numerodeproyectosenproceso()
     {
         String numero="";
         String sql="select count(*) from proyecto where elimina='activo' and estado='En Proceso'";
         
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
       /*numero de proyectos terminados*/
      public String numerodeproyectosterminados()
     {
         String numero="";
         String sql="select count(*) from proyecto where elimina='activo' and estado='Terminado'";
         
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
     
    /*agregar proyecto*/
    
         public String agregar(beanproyecto pro){
         String out;
         String sql="insert into proyecto(inicio,estado,fin,elimina,idcliente,idtrabajador,tipo,nombre,condicion,mantenimiento)value (?,?,?,?,?,?,?,?,?,?)";
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, pro.getInicio());
           ps.setString(2, pro.getEstado());
           ps.setString(3, pro.getFin());
           ps.setString(4, pro.getElimina());
           ps.setInt(5, pro.getIdcliente().getIdcliente());
           ps.setInt(6, pro.getIdtrabajador().getIdtrabajador()); 
           ps.setString(7, pro.getTipo());
           ps.setString(8, pro.getNombre());
           ps.setString(9, pro.getCondicion());
           ps.setString(10, pro.getMantenimiento());
           ps.executeUpdate();
           
           out = "registrado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;       
        
     }
    
    /* actualizar proyecto*/
         public String actualizarproyecto(beanproyecto pro){
         String out;
         String sql="update proyecto set inicio=? ,fin=? ,idcliente=?,idtrabajador=?,nombre=? where idproyecto=?";
            try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, pro.getInicio());
           ps.setString(2, pro.getFin());
           ps.setInt(3,pro.getIdcliente().getIdcliente());
           ps.setInt(4,pro.getIdtrabajador().getIdtrabajador());
           ps.setString(5,pro.getNombre());
           ps.setInt(6,pro.getIdproyecto()); 
           ps.executeUpdate();
           out = "modificado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;
     }
        
    /*Modificar Fecha fin*/
       public String modificarfecha(beanproyecto pro){
         String out;
         String sql="update proyecto set fin=? where idproyecto=?";
            try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1,pro.getFin() );
           ps.setInt(2,pro.getIdproyecto()); 
           ps.executeUpdate();
           out = "modificado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;
     }
         
         
    /*Listar Proyectos por soportes*/
         
      public List listarpoyectosporsoporte(){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni"
                + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente "
                + "inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador"
                + " where proyecto.elimina='activo' and proyecto.tipo='Soporte'"; 
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
      
    /*Listar Proyectos por Desarrollo*/
       public List listarpoyectospordesarrollo(){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni,proyecto.condicion,cliente.idcliente"
                + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador"
                + " where proyecto.elimina='activo' and proyecto.tipo='Desarrollo' and proyecto.mantenimiento='no'"; 
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
               cli.setIdcliente(rs.getInt(13));
               pro.setIdcliente(cli);
               tra.setNombre(rs.getString(9));
               tra.setApellido(rs.getString(10));
               pro.setIdtrabajador(tra);
               pro.setCondicion(rs.getString(12));
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
       
     /*listar proyectos de desarrollo terminados*/  
          public List listarpoyectospordesarrollomantenimientoterminado(){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni,proyecto.condicion,cliente.idcliente"
                + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador"
                + " where proyecto.elimina='activo' and proyecto.tipo='Desarrollo' and proyecto.mantenimiento='no' and proyecto.estado='Terminado'"; 
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
                cli.setIdcliente(rs.getInt(13));
               pro.setIdcliente(cli);
               tra.setNombre(rs.getString(9));
               tra.setApellido(rs.getString(10));
               pro.setIdtrabajador(tra);
               pro.setCondicion(rs.getString(12));
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
       
       
       
       
       
       
       
    /*Listar proyectos de desarrollo en mantenimiento*/
          public List listarpoyectospordesarrollomantenimiento(){
        String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,cliente.nombre,cliente.apellido,trabajador.nombre,trabajador.apellido,cliente.dni,proyecto.condicion"
                + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador"
                + " where proyecto.elimina='activo' and proyecto.tipo='Desarrollo' and proyecto.mantenimiento='si'"; 
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
       
       
       
       
       
    
    /*cancelar proyecto*/
      
    public String eliminar (int idproyecto){
      String out;
      String sql="update proyecto set elimina='no activo' where idproyecto="+idproyecto;
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
    
  /*capturar proyecto*/
    public beanproyecto proyecto(int idproyecto){
         beanproyecto bpro =new beanproyecto();
         beancliente cli=new beancliente();
         beantrabajador tra=new beantrabajador();
         String sql="select proyecto.idproyecto , proyecto.inicio, proyecto.fin , proyecto.nombre,cliente.idcliente,cliente.nombre,cliente.apellido,trabajador.idtrabajador,trabajador.nombre,trabajador.apellido,proyecto.estado"
                 + " from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente "
                 + "inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador where  proyecto.idproyecto="+idproyecto;
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
             while(rs.next()){
              bpro.setIdproyecto(rs.getInt(1));
              bpro.setInicio(rs.getString(2));
              bpro.setFin(rs.getString(3));
              bpro.setNombre(rs.getString(4));
              cli.setIdcliente(rs.getInt(5));
              cli.setNombrecli(rs.getString(6));
              cli.setApellidocli(rs.getString(7));
              bpro.setIdcliente(cli);
              tra.setIdtrabajador(rs.getInt(8));
              tra.setNombre(rs.getString(9));
              tra.setApellido(rs.getString(10));
              bpro.setIdtrabajador(tra);
              bpro.setEstado(rs.getString(11));
           }
            ps.close();
           }catch(Exception e){
               
           }
         return bpro;
     }
    
  /*modificar condicion*/
     public String actualizarproyectocondicion(beanproyecto pro){
         String out;
         String sql="update proyecto set condicion='si' where idproyecto=?";
            try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setInt(1,pro.getIdproyecto()); 
           ps.executeUpdate();
           out = "modificado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;
     }
    
}
