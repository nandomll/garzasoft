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
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author hp
 */
public class daotrabajador {
    
     conexion cn= new  conexion();
     Connection con;
     PreparedStatement ps;
     ResultSet rs;
     /*validar trabajador */
     public beantrabajador validar(String dni, String clave){
         beantrabajador btra =new beantrabajador();
         String sql="select * from trabajador where dni=? and clave=? and elimina='activo'";
         
         try{
             con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, clave);
            rs=ps.executeQuery();
             while(rs.next()){
              btra.setIdtrabajador(rs.getInt("idtrabajador"));
              btra.setNombre(rs.getString("nombre"));
              btra.setApellido(rs.getString("apellido"));
              btra.setClave(rs.getString("clave"));
              btra.setDni(rs.getString("dni"));
            }  
            ps.close();
            
         }    catch(Exception e){
            
        }
         
         return btra;
     }
    
    /*capturar un trabajador*/ 
     public beantrabajador trabajador(int idtrabajador){
         beantrabajador btra =new beantrabajador();
         String sql="select *from trabajador where idtrabajador="+idtrabajador;
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
             while(rs.next()){
               btra.setIdtrabajador(rs.getInt("idtrabajador"));
               btra.setNombre(rs.getString("nombre"));
               btra.setApellido(rs.getString("apellido"));
               btra.setDni(rs.getString("dni"));
               btra.setTelefono(rs.getString("telefono"));
               btra.setCorreo(rs.getString("correo"));
               btra.setClave(rs.getString("clave"));
           }
           ps.close();
           }catch(Exception e){
               
           }
         return btra;
     }
     /*metodo actualizar perfil trabajador */
     public String actualizar ( beantrabajador trab){
         String out;
         String sql="update trabajador set telefono=? , correo=? where idtrabajador=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1,trab.getTelefono());
              ps.setString(2, trab.getCorreo());
              ps.setInt(3, trab.getIdtrabajador());
              ps.executeUpdate();
             out = "Correcto...";
              ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
    
    /* metodo para actualizar clave*/  
     public String actualizarclave(beantrabajador trab, String clavenueva){
                String out;
         String sql="Update trabajador set clave=? where idtrabajador=? and clave=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1, clavenueva);
              ps.setInt(2, trab.getIdtrabajador());
              ps.setString(3, trab.getClave());
              ps.executeUpdate();
             out = "Correcto...";
              ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;  
     }
     
     /*Contar numero de trabajadores activos*/
      public String numerodetrabajadores()
     {
         String numero="";
         String sql="select count(*) from trabajador where elimina='activo'";
         
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
      
     /*validar Dni*/ 
       public String Dni( String dni)
     {
         String numero="";
         String sql="select count(*) from  trabajador where dni="+dni;
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
     
       
    /*Listar Trabajadores activos*/
     public List listar(){
        String sql="select*from trabajador where elimina='activo'"; 
       ArrayList<beantrabajador> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beantrabajador tra=new beantrabajador();
               tra.setIdtrabajador(rs.getInt("idtrabajador"));
               tra.setNombre(rs.getString("nombre"));
               tra.setApellido(rs.getString("apellido"));
               tra.setTelefono(rs.getString("telefono"));
               tra.setCorreo(rs.getString("correo"));
               tra.setDni(rs.getString("dni"));
               tra.setSexo(rs.getString("sexo"));
               tra.setCondicion(rs.getString("condicion"));
               tra.setIngreso(rs.getString("ingreso"));
               tra.setClave(rs.getString("clave"));
               tra.setEstado(rs.getString("estado"));
               lista.add(tra);
            }
               ps.close();
               return lista; 
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
     
     /*cambiar estado de libre a ocupado*/ 
     public String actualizarlibre(int idtrabajador){
          String out;
         String sql="update trabajador set estado= 'ocupado' where idtrabajador="+idtrabajador;
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.executeUpdate();
              out = "Correcto...";
              ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
     
     /*cambiar estado de ocupado a libre*/
      public String actualizarocupado(int idtrabajador){
          String out;
         String sql="update trabajador set estado= 'libre' where idtrabajador="+idtrabajador;
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.executeUpdate();
              out = "Correcto...";
              ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
      
      /* Agregar trabajador*/
        public String agregar(beantrabajador trab){
         String out;
         String sql="insert into trabajador(nombre,apellido,telefono,correo,clave,ingreso,condicion,elimina,dni,sexo,estado)"
                 + " values (?,?,?,?,?,?,?,?,?,?,?);";
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, trab.getNombre());
           ps.setString(2, trab.getApellido());
           ps.setString(3, trab.getTelefono());
           ps.setString(4, trab.getCorreo());
           ps.setString(5, trab.getClave());
           ps.setString(6, trab.getIngreso());
           ps.setString(7,trab.getCondicion());
           ps.setString(8,trab.getElimina());
           ps.setString(9,trab.getDni());
           ps.setString(10,trab.getSexo());
           ps.setString(11, trab.getEstado());
           ps.executeUpdate();
           
           out = "registrado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;       
        
     }
        
       /* Actualizar Trabajador*/
      public String actualizartrabajador(beantrabajador trab){
         String out;
         String sql="update trabajador set nombre=? ,apellido=?,telefono=?,correo=?, clave=?, ingreso=?,condicion=?,dni=?,sexo=? where idtrabajador=?;";
            try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, trab.getNombre());
           ps.setString(2, trab.getApellido());
           ps.setString(3, trab.getTelefono());
           ps.setString(4, trab.getCorreo());
           ps.setString(5, trab.getClave());
           ps.setString(6, trab.getIngreso());
           ps.setString(7,trab.getCondicion());
           ps.setString(8, trab.getDni());
           ps.setString(9,trab.getSexo());
           ps.setInt(10, trab.getIdtrabajador());
           
           ps.executeUpdate();
           out = "modificado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;
     }   
       
     /*eliminar trabajador*/
    public String eliminar (int idtrabajador){
      String out;
      String sql="update trabajador set elimina='noactivo' where idtrabajador="+idtrabajador;
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
    
    /*Listar Trabajadores activos y libres*/
     public List listarporestado(){
        String sql="select *from trabajador where elimina='activo'and estado='libre'"; 
       ArrayList<beantrabajador> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beantrabajador tra=new beantrabajador();
               tra.setIdtrabajador(rs.getInt("idtrabajador"));
               tra.setNombre(rs.getString("nombre"));
               tra.setApellido(rs.getString("apellido"));
               tra.setTelefono(rs.getString("telefono"));
               tra.setCorreo(rs.getString("correo"));
               tra.setDni(rs.getString("dni"));
               tra.setSexo(rs.getString("sexo"));
               tra.setCondicion(rs.getString("condicion"));
               tra.setIngreso(rs.getString("ingreso"));
               tra.setClave(rs.getString("clave"));
               tra.setEstado(rs.getString("estado"));
               lista.add(tra);
            }
               ps.close();
               return lista; 
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
     
         
       /*capturar proyecto not*/
   public beanproyecto proyecto(int idtrabajador){
         beanproyecto bpro =new beanproyecto();
         
         String sql="select proyecto.idproyecto , proyecto.inicio,proyecto.estado, proyecto.fin ,proyecto.tipo, proyecto.nombre,proyecto.condicion,proyecto.mantenimiento from proyecto inner join cliente on proyecto.idcliente=cliente.idcliente inner join trabajador on proyecto.idtrabajador= trabajador.idtrabajador"
                 + "  where proyecto.elimina='activo' and trabajador.idtrabajador="+idtrabajador +" order by proyecto.idproyecto";
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
             while(rs.next()){
              bpro.setIdproyecto(rs.getInt(1));
              bpro.setInicio(rs.getString(2));
              bpro.setEstado(rs.getString(3));
              bpro.setFin(rs.getString(4));
              bpro.setTipo(rs.getString(5));
             bpro.setNombre(rs.getString(6));
             bpro.setCondicion(rs.getString(7));
             bpro.setMantenimiento(rs.getString(8));
           }
            ps.close();
           }catch(Exception e){
               
           }
         return bpro;
     }
   
   /*Actualizar estado del proyecto a en proceso*/
   public String actualizaraenproceso(int idproyecto){
          String out;
         String sql="update proyecto set estado='En Proceso' where idproyecto="+idproyecto;
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.executeUpdate();
             out = "Correcto...";
              ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
   
      /*Actualizar estado del proyecto a Terminado*/
     public String actualizarterminado(int idproyecto){
          String out;
         String sql="update proyecto set estado='Terminado' where idproyecto="+idproyecto;
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.executeUpdate();
             out = "Correcto...";
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
     
     
     
     public beanproyecto listarpordni( String dnitrabajador){
        beanproyecto bpro=new beanproyecto();
        String sql="select proyecto.idproyecto ,proyecto.nombre, proyecto.inicio, proyecto.fin, proyecto.estado from proyecto inner join trabajador on proyecto.idtrabajador=trabajador.idtrabajador   where  trabajador.dni= "+dnitrabajador+" order by proyecto.idproyecto"; 
       
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
        
               bpro.setIdproyecto(rs.getInt("idproyecto"));
               bpro.setNombre(rs.getString("nombre"));
               bpro.setInicio(rs.getString("inicio"));
               bpro.setFin(rs.getString("fin"));
               bpro.setEstado(rs.getString("estado"));
            }
           ps.close();
        }catch(Exception e)
        {
           
        }  
        return bpro;
     }
     
}
