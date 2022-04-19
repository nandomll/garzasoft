/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import bean.beanadministrador;
import dao.daoadministrador;

/**
 *
 * @author hp
 */
public class logicadministrador {
   
     public beanadministrador validar(String dni , String contra){
        daoadministrador daadm =new daoadministrador();
        return (daadm.validar(dni, contra));
    }
    
   public beanadministrador administrador(int idadmnistrador){
      daoadministrador daadm =new daoadministrador();
      return daadm.administrador(idadmnistrador);
   } 
   
   
   
   
   public String actualizar (beanadministrador adm){
        beanadministrador badministrador=new beanadministrador();
        daoadministrador dadministrador =new daoadministrador();
        badministrador.setTelefonoadmi(adm.getTelefonoadmi());
        badministrador.setCorreoadmi(adm.getCorreoadmi());
        badministrador.setIdadministrador(adm.getIdadministrador());
        return dadministrador.actualizar(badministrador);
   }
    
   public String actualizarclave(beanadministrador adm, String clavenueva){
        beanadministrador badministrador=new beanadministrador();
        daoadministrador dadministrador =new daoadministrador();
         badministrador.setClaveadmi(adm.getClaveadmi());
         badministrador.setIdadministrador(adm.getIdadministrador());
         return dadministrador.actualizarclave(badministrador, clavenueva);
   } 
    
}
