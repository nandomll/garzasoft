/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hp
 */
public class conexion {
     private Connection con;
     
      public conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
         
    
      con = DriverManager.getConnection("jdbc:mysql://localhost:3307/garzasoft", "root", "root");
        } catch (Exception e) {
            System.err.println("Error" + e);
        }
    }
     
      public Connection getConnection() {
        return con;
    }
    // ver conexion
     public static void main(String[] args) {
       conexion c3 = new conexion();
        
        if (c3.getConnection() != null) {
            
                System.out.println("Conexion exitosa....");
                System.out.println("Ejecucion exitosa........");
            
            
            
        } else {
            System.out.println("Error de conexion");
        }
    }
    
      
      
     
     
     
}
