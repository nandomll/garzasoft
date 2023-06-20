/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author hp
 */
public class beanrequerimientos {
    private int idrequeriminetos ;
    private String requerimientos;
    private String estado;
    private String elimina;
    private beanproyecto idproyecto;

    public int getIdrequeriminetos() {
        return idrequeriminetos;
    }

    public void setIdrequeriminetos(int idrequeriminetos) {
        this.idrequeriminetos = idrequeriminetos;
    }

    public String getRequerimientos() {
        return requerimientos;
    }

    public void setRequerimientos(String requerimientos) {
        this.requerimientos = requerimientos;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getElimina() {
        return elimina;
    }

    public void setElimina(String elimina) {
        this.elimina = elimina;
    }

    public beanproyecto getIdproyecto() {
        return idproyecto;
    }

    public void setIdproyecto(beanproyecto idproyecto) {
        this.idproyecto = idproyecto;
    }
    
}
