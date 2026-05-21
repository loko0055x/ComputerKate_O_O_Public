/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import models.Producto;
import repository.IProducto;

/**
 *
 * @author Usuario
 */
public class ProductoServiceImpl implements IProductoService {

    private IProducto productoRepository;

    public ProductoServiceImpl(IProducto productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    public List<Producto> listarproductoxcategoria(int idcategoria) throws SQLException {
        return productoRepository.listarproductoxcategoria(idcategoria);
    }

    @Override
    public void actualizarstockproducto(int cantidad, int idproducto, int idcategoria) throws SQLException {
        productoRepository.actualizarstockproducto(cantidad, idproducto, idcategoria);
    }

    @Override
    public List<Producto> buscarxdescripcion(int idcategoria, String descripcion) throws SQLException {
        return productoRepository.buscarxdescripcion(idcategoria, descripcion);
    }

    @Override
    public Producto save(Producto producto) throws SQLException  {
        return productoRepository.save(producto);
    }

    @Override
    public Producto update(Producto producto)throws SQLException  {
        return productoRepository.update(producto);
    }

    @Override
    public void deleteById(Integer id) throws SQLException  {
        productoRepository.deleteById(id);
    }

    @Override
    public Producto findById(Integer id)  throws SQLException {
        return productoRepository.findById(id);
    }

    @Override
    public List<Producto> findAll()  throws SQLException {
        return productoRepository.findAll();
    }

    @Override
    public List<Producto> buscarxdescripcion(String string) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
