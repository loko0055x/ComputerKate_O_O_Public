/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author Usuario
 */
public class Categoria {

    private int idcategoria;
    private String nombrecategoria;
    private String rutaimagen;
    private String descripcion;
    private String icon;
    private List<String> productos;
    private int cantidadcategoria;

    public Categoria(int idcategoria, String nombrecategoria, String rutaimagen, String descripcion, String icon, List<String> productos, int cantidadcategoria) {
        this.idcategoria = idcategoria;
        this.nombrecategoria = nombrecategoria;
        this.rutaimagen = rutaimagen;
        this.descripcion = descripcion;
        this.icon = icon;
        this.productos = productos;
        this.cantidadcategoria = cantidadcategoria;
    }
    
    
    
    public Categoria(int idcategoria, String nombrecategoria, String rutaimagen, String descripcion, String icon) {
        this.idcategoria = idcategoria;
        this.nombrecategoria = nombrecategoria;
        this.rutaimagen = rutaimagen;
        this.descripcion = descripcion;
        this.icon = icon;
    }

    public Categoria(int idcategoria, String nombrecategoria, String rutaimagen, String descripcion, String icon, List<String> productos) {
        this.idcategoria = idcategoria;
        this.nombrecategoria = nombrecategoria;
        this.rutaimagen = rutaimagen;
        this.descripcion = descripcion;
        this.icon = icon;
        this.productos = productos;
    }

    public Categoria(int idcategoria, String nombrecategoria, String rutaimagen, String descripcion) {
        this.idcategoria = idcategoria;
        this.nombrecategoria = nombrecategoria;
        this.rutaimagen = rutaimagen;
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNombrecategoria() {
        return nombrecategoria;
    }

    public void setNombrecategoria(String nombrecategoria) {
        this.nombrecategoria = nombrecategoria;
    }

    public String getRutaimagen() {
        return rutaimagen;
    }

    public void setRutaimagen(String rutaimagen) {
        this.rutaimagen = rutaimagen;
    }

    public Categoria(int idcategoria, String nombrecategoria, String rutaimagen) {
        this.idcategoria = idcategoria;
        this.nombrecategoria = nombrecategoria;
        this.rutaimagen = rutaimagen;
    }

    public Categoria() {
    }

    public Categoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<String> getProductos() {
        return productos;
    }

    public void setProductos(List<String> productos) {
        this.productos = productos;
    }

    public int getCantidadcategoria() {
        return cantidadcategoria;
    }

    public void setCantidadcategoria(int cantidadcategoria) {
         this.cantidadcategoria = cantidadcategoria;
    }
}
