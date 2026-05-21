/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.internal.org.jline.reader.UserInterruptException;
import models.Usuario;
import repository.UsuarioImpl;
import service.IUsuarioService;
import service.UsuarioServiceImpl;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private UsuarioImpl impl = new UsuarioImpl();
    private IUsuarioService usuarioserv = new UsuarioServiceImpl(impl);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();
         if (url.equals("/aggcategoria")) {
            //  aggCategoria(request, response);
        } else if (url.equals("/eliminarcategoria")) {
            //eliminarcategoria(request, response);
        } else if (url.equals("/retornarcat")) {
            //  retornarcat(request, response);
        } else if (url.equals("/actualizarcat")) {
            // actualizarCat(request, response);
        } else if (url.equals("/getAll")) {
            //  getAll(request, response);
        } else if (url.equals("/login")) {
            // login(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String usuario = request.getParameter("email");
            String password = request.getParameter("password");

            Usuario usuarioValido = usuarioserv.login(usuario, password);

 
            if (usuarioValido != null) {
                request.getSession().setAttribute("usuario", usuarioValido);
            } else {
            }
            request.getRequestDispatcher("/Pagos.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace(); // loguear el error para debugging
            response.setContentType("text/plain");
            response.getWriter().write("errorSQL"); // avisamos al JS que hubo error en BD
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
