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
public class beanproyecto {
    private int idproyecto;
    private String inicio;
    private String estado;
    private String fin;
    private beancliente idcliente;
    private beantrabajador idtrabajador;
    private String elimina;
    private String tipo;
    private String nombre;
    private String mantenimiento;

    public String getMantenimiento() {
        return mantenimiento;
    }

    public void setMantenimiento(String mantenimiento) {
        this.mantenimiento = mantenimiento;
    }
    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }
    private String condicion;
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdproyecto() {
        return idproyecto;
    }

    public void setIdproyecto(int idproyecto) {
        this.idproyecto = idproyecto;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    public beancliente getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(beancliente idcliente) {
        this.idcliente = idcliente;
    }

    public beantrabajador getIdtrabajador() {
        return idtrabajador;
    }

    public void setIdtrabajador(beantrabajador idtrabajador) {
        this.idtrabajador = idtrabajador;
    }


    public String getElimina() {
        return elimina;
    }

    public void setElimina(String elimina) {
        this.elimina = elimina;
    }
    
}
