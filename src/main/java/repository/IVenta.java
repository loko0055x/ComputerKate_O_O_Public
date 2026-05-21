/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;

import java.sql.SQLException;
import models.Venta;

public interface IVenta  extends ICrudRepository<Venta, Integer>{
    int getLastId() throws  SQLException;
}
