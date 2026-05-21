/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Categoria;
import models.Producto;

public class ProductoImpl implements IProducto {

    private Connection conexion;

    public ProductoImpl() {
        this.conexion = Conexion.getInstancia().getConexion();
    }

    @Override
    public List<Producto> listarproductoxcategoria(int idcategoria) throws SQLException {
        List<Producto> productos = new ArrayList<>();
    
        String query = "SELECT * FROM producto WHERE idcategoria = " + idcategoria + ""; // Ajusta el nombre de la tabla si es diferente
        PreparedStatement stmt = conexion.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Producto p = new Producto();
            Categoria cat = new Categoria(rs.getInt("idcategoria"));
            p.setIdproducto(rs.getInt("idproducto"));
            p.setCategoria(cat);
            p.setTitulo(rs.getString("titulo"));
            p.setDescripcion(rs.getString("descripcion"));
            p.setPrecio(rs.getFloat("precio"));
            p.setCantidad(rs.getInt("cantidad"));
            p.setMarca(rs.getString("marca"));
            p.setTotal(rs.getFloat("total"));
            p.setRutaimagen(rs.getString("rutaimagen"));
              
            productos.add(p);
        }

        rs.close();
        stmt.close();
        return productos;

    }

    @Override
    public void actualizarstockproducto(int cantidad, int idproducto, int idcategoria)  throws SQLException{

        String query = "UPDATE producto SET cantidad = cantidad - ? WHERE idproducto = ? ";

        try {

            PreparedStatement stmt = conexion.prepareStatement(query);

            stmt.setInt(1, cantidad);
            stmt.setInt(2, idproducto);
           // stmt.setInt(3, idcategoria);

            int filas = stmt.executeUpdate();

            if (filas == 0) {
                throw new Exception("No se pudo actualizar el stock del producto");
            }

            stmt.close();

        } catch (Exception e) {
            throw new SQLException("Error al actualizar stock del producto", e);
        }
    }

    @Override
    public List<Producto> buscarxdescripcion(int idcategoria, String descripcion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Producto save(Producto t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Producto update(Producto t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Producto findById(Integer id) throws SQLException {
        Producto producto = null;

        String query = "SELECT * FROM producto WHERE idproducto = ?";

        PreparedStatement stmt = conexion.prepareStatement(query);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {

            producto = new Producto();
            Categoria cat = new Categoria(rs.getInt("idcategoria"));

            producto.setIdproducto(rs.getInt("idproducto"));
            producto.setCategoria(cat);
            producto.setTitulo(rs.getString("titulo"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setPrecio(rs.getFloat("precio"));
            producto.setCantidad(rs.getInt("cantidad"));
            producto.setMarca(rs.getString("marca"));
            producto.setTotal(rs.getFloat("total"));
            producto.setRutaimagen(rs.getString("rutaimagen"));
        }

        rs.close();
        stmt.close();

        return producto;
    }

    @Override
    public List<Producto> findAll() throws SQLException {
        List<Producto> productos = new ArrayList<>();

        String query = "SELECT * FROM producto"; // Ajusta el nombre de la tabla si es diferente
        PreparedStatement stmt = conexion.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Producto p = new Producto();
            Categoria cat = new Categoria(rs.getInt("idcategoria"));
            p.setIdproducto(rs.getInt("idproducto"));
            p.setCategoria(cat);
            p.setTitulo(rs.getString("titulo"));
            p.setDescripcion(rs.getString("descripcion"));
            p.setPrecio(rs.getFloat("precio"));
            p.setCantidad(rs.getInt("cantidad"));
            p.setMarca(rs.getString("marca"));
            p.setTotal(rs.getFloat("total"));
            p.setRutaimagen(rs.getString("rutaimagen"));
             productos.add(p);
         }

        rs.close();
        stmt.close();
 
        return productos;
    }

    @Override
    public List<Producto> buscarxdescripcion(String descripcion) throws SQLException {
        List<Producto> productos = new ArrayList<>();

        String query = "SELECT * FROM producto WHERE descripcion LIKE ?";

        PreparedStatement stmt = conexion.prepareStatement(query);
        stmt.setString(1, "%" + descripcion + "%");

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Categoria cat = new Categoria(rs.getInt("idcategoria"));

            Producto p = new Producto();

            p.setIdproducto(rs.getInt("idproducto"));
            p.setCategoria(cat);
            p.setTitulo(rs.getString("titulo"));
            p.setDescripcion(rs.getString("descripcion"));
            p.setPrecio(rs.getFloat("precio"));
            p.setCantidad(rs.getInt("cantidad"));
            p.setMarca(rs.getString("marca"));
            p.setTotal(rs.getFloat("total"));
            p.setRutaimagen(rs.getString("rutaimagen"));

            productos.add(p);
        }

        rs.close();
        stmt.close();

        return productos;

    }

}
