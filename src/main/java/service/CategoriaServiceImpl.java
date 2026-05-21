/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import models.Categoria;
import repository.ICategoria;

/**
 *
 * @author Usuario
 */
import java.util.List;

public class CategoriaServiceImpl implements ICategoriaService {

    private ICategoria categoriarepo;

    public CategoriaServiceImpl(ICategoria categoriarepo) {
        this.categoriarepo = categoriarepo;
    }

    @Override
    public Categoria save(Categoria categoria) throws SQLException {
        return categoriarepo.save(categoria);
    }

    @Override
    public Categoria update(Categoria categoria) throws SQLException {
        return categoriarepo.update(categoria);
    }

    @Override
    public void deleteById(Integer id) throws SQLException {
        categoriarepo.deleteById(id);
    }

    @Override
    public Categoria findById(Integer id) throws SQLException {
        return categoriarepo.findById(id);
    }

    @Override
    public List<Categoria> findAll() throws SQLException {
        return categoriarepo.findAll();
    }
}
