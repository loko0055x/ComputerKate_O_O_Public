/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import models.Categoria;

/**
 *
 * @author Usuario
 */
public interface ICategoriaService {
    Categoria save(Categoria categoria) throws SQLException ;
    Categoria update(Categoria categoria) throws SQLException ;
    void deleteById(Integer id) throws SQLException ;
    Categoria findById(Integer id) throws SQLException ;
    List<Categoria> findAll() throws SQLException ; 
}
