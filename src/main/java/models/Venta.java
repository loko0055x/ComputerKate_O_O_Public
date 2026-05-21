/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author Usuario
 */
public class Venta {

    private int idventa;
    private int idusuario;
    private double total;
    private String metodoPago;
    private String observaciones;
    private String estadoVenta;
    private java.util.Date fechaCreacion;
    private boolean estado;

    // Getters y setters

    public int getIdventa() {
        return idventa;
    }

    public void setIdventa(int idventa) {
        this.idventa = idventa;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getEstadoVenta() {
        return estadoVenta;
    }

    public void setEstadoVenta(String estadoVenta) {
        this.estadoVenta = estadoVenta;
    }

    public java.util.Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(java.util.Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Venta(int idventa, int idusuario, double total, String metodoPago, String observaciones, String estadoVenta, Date fechaCreacion, boolean estado) {
        this.idventa = idventa;
        this.idusuario = idusuario;
        this.total = total;
        this.metodoPago = metodoPago;
        this.observaciones = observaciones;
        this.estadoVenta = estadoVenta;
        this.fechaCreacion = fechaCreacion;
        this.estado = estado;
    }
    
}