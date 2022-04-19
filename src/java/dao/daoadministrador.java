/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.beanadministrador;
import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hp
 */
public class daoadministrador {
    
        
     conexion cn= new  conexion();
     Connection con;
     PreparedStatement ps;
     ResultSet rs;
     /*validar Administrador */
      public beanadministrador validar(String dni, String clave){
         beanadministrador badm =new beanadministrador();
         String sql="select * from administrador where dni=? and clave=?";
         
         try{
             con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, dni);
            ps.setString(2, clave);
            rs=ps.executeQuery();
             while(rs.next()){
              badm.setIdadministrador(rs.getInt("idadministrador"));
              badm.setNombreadmi(rs.getString("nombre"));
              badm.setApellidosadmi(rs.getString("apellido"));
              badm.setClaveadmi(rs.getString("clave"));
              badm.setDniadmi(rs.getString("dni"));
            }
             
             ps.close();
         }    catch(Exception e){    
        }
         
         return badm;
     }
    
    /*capturar a administrador*/
      
        public beanadministrador administrador(int idadministrador){
         beanadministrador badm =new beanadministrador();
         String sql="select *from administrador where idadministrador="+idadministrador;
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
             while(rs.next()){
              badm.setIdadministrador(rs.getInt("idadministrador"));
              badm.setNombreadmi(rs.getString("nombre"));
               badm.setApellidosadmi(rs.getString("apellido"));
               badm.setDniadmi(rs.getString("dni"));
               badm.setTelefonoadmi(rs.getString("telefono"));
               badm.setCorreoadmi(rs.getString("correo"));
               badm.setClaveadmi(rs.getString("clave"));
           }
          
             ps.close();
           }catch(Exception e){
               
           }
         return badm;
     }  
        
      /*metodo de actualizar administrador*/
      public String actualizar ( beanadministrador adm){
         String out;
         String sql="update administrador set telefono=? , correo=? where idadministrador=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1,adm.getTelefonoadmi());
              ps.setString(2,adm.getCorreoadmi());
              ps.setInt(3, adm.getIdadministrador());
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
     
     public String actualizarclave(beanadministrador admi, String clavenueva){
                String out;
         String sql="Update administrador set clave=? where idadministrador=? and clave=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1, clavenueva);
              ps.setInt(2, admi.getIdadministrador());
              ps.setString(3,admi.getClaveadmi());
              ps.executeUpdate();
             out = "Correcto...";
             
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;  
     }    
     /*validar Dni*/   
      public String Dni( String dni)
     {
         String numero="";
         String sql="select count(*) from  administrador where dni="+dni;
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
   /* ver si es trabajador y cliente nuevo o antiguo*/
     public String condicion(String fechaingreso){
         String numero="";
         String sql="select  timestampdiff( year,'"+fechaingreso+"',date(now()))";
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
      
      
      
      
      
      
      
}
