/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import models.Categoria;
import models.Producto;
import models.Usuario;

public interface IUsuario  extends ICrudRepository<Usuario, Integer>{
        Usuario login(String username,String password) throws SQLException ; 

}
