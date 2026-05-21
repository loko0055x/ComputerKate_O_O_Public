/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;

import java.sql.SQLException;
import java.util.List;


public interface ICrudRepository<T, ID> {
    T save(T t) throws SQLException;
    T update(T t) throws SQLException;
    void deleteById(ID id) throws SQLException;
    T findById(ID id) throws SQLException;
    List<T> findAll() throws SQLException;
}