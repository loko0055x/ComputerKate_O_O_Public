/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import models.Categoria;
import models.Usuario;

/**
 *
 * @author Usuario
 */
public interface IUsuarioService {

    Usuario save(Usuario Usuario) throws SQLException;

    Usuario update(Usuario Usuario) throws SQLException;

    void deleteById(Integer id) throws SQLException;

    Usuario findById(Integer id) throws SQLException;

    List<Usuario> findAll() throws SQLException;

    Usuario login(String username, String password) throws SQLException;

}
