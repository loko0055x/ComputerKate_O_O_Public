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
import models.Usuario;
import repository.UsuarioImpl;
import service.IUsuarioService;
import service.UsuarioServiceImpl;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "crearcuenta", urlPatterns = {"/crearcuenta"})
public class crearcuenta extends HttpServlet {

    private UsuarioImpl impl = new UsuarioImpl();
    private IUsuarioService usuarioserv = new UsuarioServiceImpl(impl);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String usuarioStr = request.getParameter("email"); // tu form usa email
            String contrasena = request.getParameter("password");
            String confirmar = request.getParameter("password2");

            // 2. Validación básica
            if (!contrasena.equals(confirmar)) {
                request.setAttribute("error", "Las contraseñas no coinciden");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            // 3. Crear objeto Usuario
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setUsuario(usuarioStr);
            usuario.setContrasena(contrasena);
            usuario.setEstado(true);
            usuario.setFechaCreacion(null);
            usuario.setFoto("img/user.png");

            // 4. Guardar
            Usuario usuarioValido = usuarioserv.save(usuario);

            // 5. Resultado
            if (usuarioValido != null) {
                request.getSession().setAttribute("usuario", usuarioValido);

                request.getRequestDispatcher("/Pagos.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No se pudo registrar");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(); // loguear el error para debugging
            response.setContentType("text/plain");
            response.getWriter().write("errorSQL"); // avisamos al JS que hubo error en BD
        }
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

}
