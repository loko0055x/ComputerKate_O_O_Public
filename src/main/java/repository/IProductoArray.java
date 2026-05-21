/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package repository;
import java.util.List;

   
/**
 *
 * @author Usuario
 */
import models.Producto;
public interface IProductoArray {
    public void agregarproducto(Producto pro, int stockBD);

	public List<Producto> listarproductos();

	public void actualizarstock(int cantidad, Producto pro);

	public void eliminarproducto(int idproducto, int idcategoria);

	public Producto buscarproducto(int idcategoria, int idproducto);

	public List<Producto> listarproductospornombre();

	public int retornarposicion(int idcategoria, int idproducto);

	public float sacareltotal();

	public void reiniciararreglo();
}
