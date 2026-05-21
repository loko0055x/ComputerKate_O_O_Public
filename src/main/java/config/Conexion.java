/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

/**
 *
 * @author Usuario
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    private static Conexion instancia;
    private Connection conexion;
    private final String URL = "jdbc:mysql://localhost:3306/spring_computer_o_o?useSSL=false&serverTimezone=UTC";
    private final String USER = "root";
    private final String PASSWORD = "1234";

    private Conexion() {
        try {
            //cargamos el driverxxD
            Class.forName("com.mysql.cj.jdbc.Driver");

            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Conexion getInstancia() {
        if (instancia == null) {
            instancia = new Conexion();
        }
        return instancia;
    }

    public Connection getConexion() {
        return conexion;
    }

    
    public static void main(String[] args) {
        System.out.println("xd"+Conexion.getInstancia().getConexion());

    }
}
