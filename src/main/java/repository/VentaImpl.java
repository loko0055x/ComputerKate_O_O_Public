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
import java.util.List;
import models.Usuario;
import models.Venta;

/**
 *
 * @author Usuario
 */
public class VentaImpl implements IVenta {

    private Connection conexion;

    public VentaImpl() {
        this.conexion = Conexion.getInstancia().getConexion();
    }

    @Override
    public Venta save(Venta t) throws SQLException {
        String query = "INSERT INTO Venta (idusuario, total, metodoPago, observaciones, estadoVenta, estado) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement stmt = conexion.prepareStatement(query);

        stmt.setInt(1, t.getIdusuario());
        stmt.setDouble(2, t.getTotal());
        stmt.setString(3, t.getMetodoPago());
        stmt.setString(4, t.getObservaciones());
        stmt.setString(5, t.getEstadoVenta());
        stmt.setBoolean(6, t.isEstado());

        int filas = stmt.executeUpdate();

        if (filas == 0) {
            throw new SQLException("No se pudo insertar la venta");
        }

        stmt.close();

        return t;

    }

    public void saveDetalleVenta(int idventa, int idproducto, int cantidad, double precio, double subtotal) throws SQLException {
        // SQL para insertar en la tabla detalleventa
        String query = "INSERT INTO detalleventa (idventa, idproducto, cantidad, precio, subtotal) "
                + "VALUES (?, ?, ?, ?, ?)";

        // Preparar el statement para la inserción
        PreparedStatement stmt = conexion.prepareStatement(query);

        // Establecer los valores de los parámetros
        stmt.setInt(1, idventa);         // Asigna el valor de idventa
        stmt.setInt(2, idproducto);      // Asigna el valor de idproducto
        stmt.setInt(3, cantidad);        // Asigna el valor de cantidad
        stmt.setDouble(4, precio);       // Asigna el valor de precio
        stmt.setDouble(5, subtotal);     // Asigna el valor de subtotal

        // Ejecutar el query
        int filas = stmt.executeUpdate();

        // Verificar si la inserción fue exitosa
        if (filas == 0) {
            throw new SQLException("No se pudo insertar el detalle de la venta");
        }

        // Cerrar el statement
        stmt.close();
    }

    @Override
    public Venta update(Venta t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteById(Integer id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Venta findById(Integer id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Venta> findAll() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getLastId() throws SQLException {

        String query = "SELECT MAX(idventa) AS ultimoID FROM Venta;";
        PreparedStatement stmt = conexion.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        int totalFilas = 0;

        if (rs.next()) {
            totalFilas = rs.getInt("ultimoID");
        }

        rs.close();
        stmt.close();

        return totalFilas;

    }

}
