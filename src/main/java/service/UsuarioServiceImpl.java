/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdk.internal.org.jline.reader.UserInterruptException;
import models.Usuario;
import repository.IUsuario;
import repository.UsuarioImpl;

/**
 *
 * @author Usuario
 */
public class UsuarioServiceImpl implements IUsuarioService {

    private IUsuario usuarioRepo;

    public UsuarioServiceImpl(UsuarioImpl impl) {
  
         this.usuarioRepo = new UsuarioImpl();
    }

    @Override
    public Usuario save(Usuario usuario) throws SQLException {
        return usuarioRepo.save(usuario);
    }

    @Override
    public Usuario update(Usuario usuario) throws SQLException {

        return usuarioRepo.update(usuario);

    }

    @Override
    public void deleteById(Integer id) throws SQLException {

        usuarioRepo.deleteById(id);

    }

    @Override
    public Usuario findById(Integer id) throws SQLException {

        return usuarioRepo.findById(id);

    }

    @Override
    public List<Usuario> findAll() throws SQLException {

        return usuarioRepo.findAll();

    }

    @Override
    public Usuario login(String username, String password) throws SQLException {
        
        if (username == null || username.isEmpty()) {
            throw new UserInterruptException("El nombre de usuario no puede estar vacío.");
        }
        return usuarioRepo.login(username, password);

    }
}
