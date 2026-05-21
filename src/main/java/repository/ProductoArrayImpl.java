package repository;

import controller.PagosServlet;
import java.util.ArrayList;
import java.util.List;
import models.Producto;
import service.IProductoService;
import service.ProductoServiceImpl;

public class ProductoArrayImpl implements IProductoArray {

    List<Producto> arreglo = new ArrayList<>();
    private ProductoImpl implprod = new ProductoImpl();
    private IProductoService productoService = new ProductoServiceImpl(implprod);

    @Override
    public void agregarproducto(Producto pro, int stockBD) {
        // significa que no existe por lo tanto lo agregara
        if (buscarproducto(pro.getIdproducto(), pro.getIdcategoria()) == null) {
            arreglo.add(pro);
        } else {
            // significa qeu el codigo es repetido entonces no lo tendra que agregar
            // mas bien tendra que actualizar el stokc
            actualizarstock(stockBD, pro);
        }
    }

    @Override
    public List<Producto> listarproductos() {
        return arreglo;
    }

    @Override
    public void actualizarstock(int stockBD, Producto pro) {

        int pos = retornarposicion(pro.getIdproducto(), pro.getIdcategoria());
        System.out.println("POSICION " + pos);
        Producto productoactualizado = update(arreglo.get(pos), stockBD, pro);
        arreglo.set(pos, productoactualizado);
    }

    // antiguo es del arreglo
    // reciente es que viene
    public Producto update(Producto proantiguo, int stockBD, Producto proreciente) {
        int cantidadantiguo = proantiguo.getCantidad();
        int cantidadreciente = proreciente.getCantidad();
        float precio = proantiguo.getPrecio();
        int sumarcantidad = cantidadantiguo + cantidadreciente;
        float total = sumarcantidad * precio;
        System.out.println("suma cantidad " + sumarcantidad);
        System.out.println("stock BD " + stockBD);
        // 22 > = 25
        if (sumarcantidad >= stockBD) {
            sumarcantidad = cantidadantiguo;
            total = proantiguo.getTotal();
        }

        if (PagosServlet.estado) {
            total = cantidadreciente * precio;
            sumarcantidad = cantidadreciente;
            PagosServlet.estado = false;
        }

        Producto proactualizado;

        proactualizado = new Producto(proantiguo.getIdproducto(), proantiguo.getIdcategoria(), proantiguo.getTitulo(),
                proantiguo.getDescripcion(), proantiguo.getPrecio(), sumarcantidad, proantiguo.getMarca(), total,
                proantiguo.getRutaimagen());
        return proactualizado;
    }

    @Override
    public void eliminarproducto(int idproducto, int idcategoria) {
        arreglo.removeIf(x -> {
            return x.getIdproducto() == idproducto && x.getIdcategoria() == idcategoria;
        });
    }

    int i = 0;
    int j = -1;

    @Override
    public int retornarposicion(int idproducto, int idcategoria) {
        arreglo.stream().forEach(x -> {
            if (x.getIdproducto() == idproducto && x.getIdcategoria() == idcategoria) {
                j = i;
                return;
            }
            i++;
        });
        return j;
    }

    float preciototal;

    @Override
    public float sacareltotal() {
        preciototal = 0;

        arreglo.forEach(x -> {
            preciototal = preciototal + x.getTotal();
        });
        ;
        return preciototal;
    }

    @Override
    public List<Producto> listarproductospornombre() {

        return null;
    }

    @Override
    public Producto buscarproducto(int idproducto, int idcategoria) {

        try {
            Producto px = arreglo.stream().filter(x -> {
                return x.getIdproducto() == idproducto && x.getIdcategoria() == idcategoria;
            }).findFirst().get();
            System.out.println("SI EXISTE Y SE ESTA REPITIENDO EL CODIGO ");
            return px;
        } catch (Exception e) {
            System.out.println("NO EXISTE ELCODIGO");

            System.out.println("" + e.getMessage());
        }
        return null;
    }

    @Override
    public void reiniciararreglo() {
        arreglo = new ArrayList<>();
    }

}
