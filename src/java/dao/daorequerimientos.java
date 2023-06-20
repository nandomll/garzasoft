/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.beanrequerimientos;
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
public class daorequerimientos {
    conexion cn= new  conexion();
     Connection con;
     PreparedStatement ps;
     ResultSet rs;
     /*Listar Requerimientos*/
         public List listar( int idproyecto){
        String sql="select*from requerimientos where elimina='activo' and idproyecto="+idproyecto; 
       ArrayList<beanrequerimientos> lista = new ArrayList();
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
               beanrequerimientos req =new beanrequerimientos();
               req.setIdrequeriminetos(rs.getInt("idrequerimientos"));
               req.setRequerimientos(rs.getString("requerimientos"));
               req.setEstado(rs.getString("estado"));
              
               lista.add(req);
            }
            ps.close();
               return lista; 
        }catch(Exception e)
        {
            out.print("ERROR" + e);
            return null;
        }     
     }
      
     /*agregar requerimientos*/
     
         public String agregar(beanrequerimientos req){
         String out;
         String sql="insert into requerimientos(requerimientos,estado,elimina,idproyecto) value(?,?,?,?)";
         try{
           con=cn.getConnection();
           ps=con.prepareStatement(sql);
           ps.setString(1, req.getRequerimientos());
           ps.setString(2, req.getEstado());
           ps.setString(3, req.getElimina());
           ps.setInt(4, req.getIdproyecto().getIdproyecto());
           ps.executeUpdate();
           
           out = "registrado";
           ps.close();
         }catch(Exception e)
        {
            out = "Error" + e.getMessage();
        }
           
         return out;          
     }     
   /* Modificar requerimientos*/
       public String actualizar ( beanrequerimientos req){
         String out;
         String sql="update requerimientos set requerimientos=? where idrequerimientos=?";
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.setString(1,req.getRequerimientos());          
              ps.setInt(2, req.getIdrequeriminetos());
              ps.executeUpdate();
             out = "modificado";
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     }
    
   /*Eliminar requerimiento*/
          public String eliminar ( int idrequerimiento){
         String out;
         String sql="update requerimientos set elimina='no activo' where idrequerimientos="+idrequerimiento;
          try{
              con=cn.getConnection();
              ps=con.prepareStatement(sql);
              ps.executeUpdate();
             out = "eliminado";
             ps.close();
                }catch(Exception e)
             {
                 out = "Error" + e.getMessage();
             }

              return out;
     } 
      
      /*numero de requerimientos*/
      public String numeroderequerimientos(int idproyecto)
     {
         String numero="";
         String sql="select count(*) from requerimientos where elimina='activo' and idproyecto="+idproyecto;
         
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
      
     /*numero de requerimientos en proceso*/
         public String numrequerimientosenproceso(int idproyecto)
     {
         String numero="";
         String sql="select count(*) from requerimientos where elimina='activo' and estado='En Proceso' and idproyecto="+idproyecto;
         
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
         /*numero de requerimientos en proceso*/
         public String numrequerimientosterminados(int idproyecto)
     {
         String numero="";
         String sql="select count(*) from requerimientos where elimina='activo' and estado='Terminado' and idproyecto="+idproyecto;
         
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
         
      /*actualizar requerimientos a en proceso*/
        public String actualizaraenproceso(int idrequerimiento){
          String out;
         String sql="update requerimientos set estado='En Proceso' where idrequerimientos="+idrequerimiento;
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
         
        /*actualizar requerimientos a terminados*/
        public String actualizaraenterminado(int idrequerimiento){
          String out;
         String sql="update requerimientos set estado='Terminado' where idrequerimientos="+idrequerimiento;
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
         
         
         
         
}
