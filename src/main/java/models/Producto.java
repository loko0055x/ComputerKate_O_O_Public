/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Usuario
 */
public class Producto {

    private int idproducto;

    // muchos productos 1 categoria
    private Categoria categoria;

    private String titulo;
    private String descripcion;
    private float precio;
    private int cantidad;
    private String marca;
    private float total;
    private String rutaimagen;
    private int stockbd;
    private int idcategoria;

    public Producto(int idproducto, String titulo, String descripcion, float precio, int cantidad, String rutaimagen, int stockbd, int idcategoria) {
        this.idproducto = idproducto;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.rutaimagen = rutaimagen;

        this.stockbd = stockbd;
        this.idcategoria = (idcategoria);
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public Producto(int idproducto, String titulo, String descripcion, float precio, int cantidad, String rutaimagen, int stockbd) {
        this.idproducto = idproducto;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.rutaimagen = rutaimagen;

        this.stockbd = stockbd;

    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getRutaimagen() {
        return rutaimagen;
    }

    public void setRutaimagen(String rutaimagen) {
        this.rutaimagen = rutaimagen;
    }

 

    public Producto() {
    }

    @Override
    public String toString() {
        return "Producto [idproducto=" + idproducto + ", categoria=" + categoria + ", titulo=" + titulo
                + ", descripcion=" + descripcion + ", precio=" + precio + ", cantidad=" + cantidad + ", marca=" + marca
                + ", total=" + total + ", rutaimagen=" + rutaimagen + "]";
    }

    public int getStockbd() {
        return stockbd;
    }

    public void setStockbd(int stockbd) {
        this.stockbd = stockbd;
    }

    public Producto(int idproducto, int idcategoria, String titulo, String descripcion, float precio, int cantidad,
            String marca, float total, String rutaimagen) {
        this.idproducto = idproducto;
        this.idcategoria = idcategoria;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.marca = marca;
        this.total = total;
        this.rutaimagen = rutaimagen;
    }

}
