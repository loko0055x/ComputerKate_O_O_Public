/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import models.DetalleVenta;

/**
 *
 * @author Usuario
 */
public class DetalleVentaImpl implements IDetalleVenta {

    private Connection conexion;

    public DetalleVentaImpl() {
        this.conexion = Conexion.getInstancia().getConexion();
    }

    @Override
    public DetalleVenta save(DetalleVenta t) throws SQLException {

        String query = "INSERT INTO DetalleVenta (idventa, idproducto, cantidad, precio, subtotal) "
                + "VALUES (?, ?, ?, ?, ?)";

        PreparedStatement stmt = conexion.prepareStatement(query);

        stmt.setInt(1, t.getIdventa());
        stmt.setInt(2, t.getIdproducto());
        stmt.setInt(3, t.getCantidad());
        stmt.setDouble(4, t.getPrecio());
        stmt.setDouble(5, t.getSubtotal());

        int filas = stmt.executeUpdate();

        if (filas == 0) {
            throw new SQLException("No se pudo insertar el detalle de venta");
        }

        stmt.close();

        return t;
    }

    @Override
    public DetalleVenta update(DetalleVenta t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteById(Integer id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public DetalleVenta findById(Integer id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<DetalleVenta> findAll() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
