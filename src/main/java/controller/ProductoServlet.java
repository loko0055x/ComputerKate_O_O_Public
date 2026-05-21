/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet", "/productos", "/ProductoServletfilter"})
public class ProductoServlet extends HttpServlet {

    private ProductoImpl implprod = new ProductoImpl();
    private IProductoService productoService = new ProductoServiceImpl(implprod);
    private CategoriaImpl impl = new CategoriaImpl();
    private ICategoriaService categoriaService = new CategoriaServiceImpl(impl);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // muy importante
        String url = request.getServletPath();

        if (url.equals("/ProductoServlet")) {
            mostrartodos(request, response);
        } else if (url.equals("/ProductoServletfilter")) {
            mostrartodosfiltro(request, response);

        }
    }

    private void mostrartodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> producto;
        List<Categoria> categorias;

        try {
            producto = productoService.findAll();
            categorias = categoriaService.findAll();
            request.setAttribute("productos", producto);
            request.setAttribute("categorias", categorias);

            System.out.println("" + categorias.size());
            request.getRequestDispatcher("/Productos.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void mostrartodosfiltro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> producto;
        List<Categoria> categorias;
        int id = Integer.parseInt(request.getParameter("idcat"));
        try {
            producto = productoService.listarproductoxcategoria(id);
            categorias = categoriaService.findAll();
            request.setAttribute("productos", producto);
            request.setAttribute("categorias", categorias);

            System.out.println("" + categorias.size());
            request.getRequestDispatcher("/Productos.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
