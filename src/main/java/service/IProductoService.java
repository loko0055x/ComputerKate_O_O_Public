/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import models.Producto;

/**
 *
 * @author Usuario
 */
public interface IProductoService {

    List<Producto> listarproductoxcategoria(int idcategoria) throws SQLException;

    void actualizarstockproducto(int cantidad, int idproducto, int idcategoria) throws SQLException;

    List<Producto> buscarxdescripcion(int idcategoria, String descripcion) throws SQLException;

    List<Producto> buscarxdescripcion(String descripcion) throws SQLException;

    Producto save(Producto producto) throws SQLException;

    Producto update(Producto producto) throws SQLException;

    void deleteById(Integer id) throws SQLException;

    Producto findById(Integer id) throws SQLException;

    List<Producto> findAll() throws SQLException;

}
