/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Usuario
 */
public class Carrito {
    private String nombre;
    private double precio;
    private String namestock;
    private int stock;
    private int stockmaximo;

    public Carrito(String nombre, double precio, String namestock, int stock, int stockmaximo) {
        this.nombre = nombre;
        this.precio = precio;
        this.namestock = namestock;
        this.stock = stock;
        this.stockmaximo = stockmaximo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNamestock() {
        return namestock;
    }

    public void setNamestock(String namestock) {
        this.namestock = namestock;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStockmaximo() {
        return stockmaximo;
    }

    public void setStockmaximo(int stockmaximo) {
        this.stockmaximo = stockmaximo;
    }
    
    
}
