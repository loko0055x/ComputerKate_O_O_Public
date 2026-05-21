/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import models.Producto;

public interface IProducto extends ICrudRepository<Producto, Integer> {

    List<Producto> listarproductoxcategoria(int idcategoria) throws SQLException;

    void actualizarstockproducto(int cantidad, int idproducto, int idcategoria) throws SQLException;

    List<Producto> buscarxdescripcion(int idcategoria, String descripcion) throws SQLException;

    List<Producto> buscarxdescripcion(String descripcion) throws SQLException;

    //List<Producto> getListProductRamdon(String descripcion) throws SQLException;

}
