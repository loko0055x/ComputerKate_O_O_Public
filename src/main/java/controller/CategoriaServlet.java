/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Categoria;
import models.Producto;
import repository.CategoriaImpl;
import repository.ProductoImpl;
import service.CategoriaServiceImpl;
import service.ICategoriaService;
import service.IProductoService;
import service.ProductoServiceImpl;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

    //private ICategoriaService categoriaService = new CategoriaServiceImpl(new CategoriaImpl());
    private CategoriaImpl impl = new CategoriaImpl();
    private ICategoriaService categoriaService = new CategoriaServiceImpl(impl);
    private ProductoImpl implprod = new ProductoImpl();
    private IProductoService productoService = new ProductoServiceImpl(implprod);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Categoria> categoria;
        List<Producto> producto = null;

        int quantyty;

        try {
            producto = productoService.findAll();
            quantyty = producto.size();
            categoria = categoriaService.findAll();

            System.out.println(""+categoria.get(0).getCantidadcategoria());
            request.setAttribute("categorias", categoria);
            request.setAttribute("cantidadproducto", quantyty);
        } catch (SQLException ex) {
          //  Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
             System.out.println(""+ex.getMessage());
        }

        request.getRequestDispatcher("/Categorias.jsp").forward(request, response);

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

}
