/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import config.Conexion;
import java.sql.*;

import java.util.List;
 
import models.Usuario;

public class UsuarioImpl implements IUsuario {

    private Connection conexion;

    public UsuarioImpl() {
        this.conexion = Conexion.getInstancia().getConexion();
    }

    @Override
    public Usuario save(Usuario t) throws SQLException {
        String query = "INSERT INTO usuario (nombre, apellido, usuario, contrasena, foto, estado) "
                 + "VALUES (?, ?, ?, ?, ?, ?)";

    PreparedStatement stmt = conexion.prepareStatement(query);

    stmt.setString(1, t.getNombre());
    stmt.setString(2, t.getApellido());
    stmt.setString(3, t.getUsuario());
    stmt.setString(4, t.getContrasena());  
    stmt.setString(5, t.getFoto());
    stmt.setBoolean(6, true);

    int filas = stmt.executeUpdate();

    if (filas == 0) {
        throw new SQLException("No se pudo insertar el usuario");
    }

    stmt.close();

    return t;
    }

    @Override
    public Usuario update(Usuario t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Usuario findById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Usuario> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Usuario login(String username, String password) throws SQLException {
        Usuario usuario = null;
        String query = "SELECT * FROM usuario WHERE usuario = ? AND contrasena = ?";

        PreparedStatement stmt = conexion.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            usuario = new Usuario();
            usuario.setId(rs.getInt("id"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setApellido(rs.getString("apellido"));
            usuario.setUsuario(rs.getString("usuario"));
            usuario.setContrasena(rs.getString("contrasena"));
            usuario.setFoto(rs.getString("foto"));
            usuario.setFechaCreacion(rs.getDate("fechaCreacion"));
            usuario.setEstado(rs.getBoolean("estado"));
        }

        return usuario;
    }

}
