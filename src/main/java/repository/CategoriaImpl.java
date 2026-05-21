/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import models.Categoria;

public class CategoriaImpl implements ICategoria {

    private Connection conexion;

    public CategoriaImpl() {
        this.conexion = Conexion.getInstancia().getConexion();
    }

    @Override
    public Categoria save(Categoria t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Categoria update(Categoria t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Categoria findById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Categoria> findAll() throws SQLException {
        List<Categoria> categorias = new ArrayList<>();

        String query = "SELECT \n"
                + "    cat.*,\n"
                + "    (\n"
                + "        SELECT GROUP_CONCAT(sub.titulo SEPARATOR ',')\n"
                + "        FROM (\n"
                + "            SELECT p.titulo\n"
                + "            FROM Producto p\n"
                + "            WHERE p.idcategoria = cat.idcategoria\n"
                + "            ORDER BY RAND()\n"
                + "            LIMIT 3\n"
                + "        ) AS sub\n"
                + "    ) AS Productos , (select count(*) from Producto p where p.idcategoria = cat.idcategoria) as cantidad\n"
                + "FROM categoria cat;";

        PreparedStatement stmt = conexion.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {

            Categoria c = new Categoria();
            c.setIdcategoria(rs.getInt("idcategoria"));
            c.setNombrecategoria(rs.getString("nombrecategoria"));
            c.setRutaimagen(rs.getString("rutaimagen"));
            c.setDescripcion(rs.getString("descripcion"));
            c.setIcon(rs.getString("icon"));
            c.setProductos(
                    Arrays.asList(rs.getString("Productos").split(","))
            );

            c.setCantidadcategoria((rs.getInt("cantidad")));
            //   System.out.println("xD" + c.getCantidadcategoria());
            categorias.add(c);
        }

        rs.close();
        stmt.close();

        return categorias;
    }

}
