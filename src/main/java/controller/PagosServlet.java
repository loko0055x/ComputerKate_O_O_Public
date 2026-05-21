/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Categoria;
import models.Producto;
import models.Usuario;
import models.Venta;
import repository.CategoriaImpl;

import repository.ProductoImpl;
import repository.VentaImpl;
import service.CategoriaServiceImpl;
import service.ICategoriaService;

import service.IProductoService;
import service.ProductoServiceImpl;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "PagosServlet", urlPatterns = {"/PagosServlet", "/EliminarProductoServlet", "/formpagos", "/carritodelete", "/paginaDeConfirmacion"})
public class PagosServlet extends HttpServlet {

    public static boolean estado = false;
    public static List<Producto> arr = new ArrayList<>();

    private CategoriaImpl impl = new CategoriaImpl();
    private ICategoriaService categoriaService = new CategoriaServiceImpl(impl);

    private ProductoImpl implprod = new ProductoImpl();
    private IProductoService productoService = new ProductoServiceImpl(implprod);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // muy importante
        String url = request.getServletPath();

        if (url.equals("/PagosServlet")) {
            agregarcrrito(request, response);
        } else if (url.equals("/EliminarProductoServlet")) {
            eliminarcarrito(request, response);

        } else if (url.equals("/formpagos")) {
            formpagos(request, response);

        } else if (url.equals("/carritodelete")) {
            cerrarsession(request, response);
        } else if (url.equals("/paginaDeConfirmacion")) {
            paginaDeConfirmacion(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    List<Producto> productos;
    List<Categoria> categorias;

    public Producto buscarproducto(int idproducto) {

        try {
            Producto px = arr.stream().filter(x -> {
                return x.getIdproducto() == idproducto;
            }).findFirst().get();
            System.out.println("SI EXISTE Y SE ESTA REPITIENDO EL CODIGO ");
            return px;
        } catch (Exception e) {

            System.out.println("" + e.getMessage());
        }
        return null;
    }

    private void agregarcrrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("idproducto"));

            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            float precio = Float.parseFloat(request.getParameter("precio"));
            int cantidad = 1;
            String imagen = request.getParameter("rutaimagen");
            int stock = Integer.parseInt(request.getParameter("cantidad"));
            int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));

            float total = cantidad * precio;

            Producto p = new Producto(id, idcategoria, titulo, descripcion, precio, cantidad, "marca", total, imagen);
            productos = productoService.findAll();

            HttpSession session = request.getSession();

            Producto probusc = buscarproducto(id);
            if (probusc == null) {
                arr.add(p);
            } else {
                int cant = probusc.getCantidad() + 1;
                //  5    >  2
                if (stock >= cant) {
                    probusc.setCantidad(cant);
                    probusc.setTotal(probusc.getCantidad() * precio);
                    // arr.set(id, probusc);

                }
            }

            session.setAttribute("arreglo", arr);
            session.setAttribute("total", sacareltotal());

            request.setAttribute("productos", productos);

            request.getRequestDispatcher("/Productos.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(PagosServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarproducto(int idproducto) {
        arr.removeIf(x -> {
            return x.getIdproducto() == idproducto;
        });
    }
    float preciototal = 0;

    public float sacareltotal() {
        preciototal = 0;

        arr.forEach(x -> {
            preciototal = preciototal + x.getTotal();
        });
        ;
        return preciototal;
    }

    private void eliminarcarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            int id = Integer.parseInt(request.getParameter("idproducto"));
            int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            eliminarproducto(id);
            productos = productoService.findAll();
            session.setAttribute("total", sacareltotal());

            session.setAttribute("arreglo", arr);
            request.setAttribute("productos", productos);

            request.getRequestDispatcher("/Productos.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PagosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void formpagos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/Pagos.jsp").forward(request, response);
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) {
        try {
            productos = productoService.findAll();
            HttpSession session = request.getSession();
            arr = new ArrayList<>();
            preciototal = 0;
            session.invalidate();
            productos = productoService.findAll();
            categorias = categoriaService.findAll();
            request.setAttribute("productos", productos);
            request.setAttribute("categorias", categorias);

            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(PagosServlet.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ServletException ex) {
            Logger.getLogger(PagosServlet.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (IOException ex) {
            Logger.getLogger(PagosServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void paginaDeConfirmacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            VentaImpl im = new VentaImpl();
            Usuario uusario = (Usuario) request.getSession().getAttribute("usuario");

            Venta ven = new Venta(0, uusario.getId(), sacareltotal(), "YAPE", "-", "Pendiente", null, true);
            im.save(ven);
            int idventa = im.getLastId();

            for (int k = 0; k < arr.size(); k++) {
                System.out.println("el id venta es  "+idventa+arr.get(k).getIdproducto());
                im.saveDetalleVenta(idventa, arr.get(k).getIdproducto(), arr.get(k).getCantidad(), arr.get(k).getPrecio(), arr.get(k).getTotal());
                // productoService.actualizarstockproducto(arr.get(k).getIdproducto(), arr.get(k).getCantidad(), 0);

            }

            productos = productoService.findAll();
            categorias = categoriaService.findAll();
            request.setAttribute("productos", productos);
            request.setAttribute("categorias", categorias);
            arr = new ArrayList<>();
            preciototal = 0;
            request.getSession().removeAttribute("total");
            request.getSession().removeAttribute("arreglo");

            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(PagosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
