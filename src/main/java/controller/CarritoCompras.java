/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.UnsupportedEncodingException;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Carrito;
@WebServlet(name = "CarritoCompras", urlPatterns = {"/CarritoCompras"})
public class CarritoCompras extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); // muy importante
        String url = request.getServletPath();

        if (url.equals("/CarritoCompras")) {
            // obtenerDataSinClase(request, response);
            obtenerDataConClase(request, response);

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

    private void obtenerDataSinClase(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Leer el body
        StringBuilder sb = new StringBuilder();
        String linea;
        try ( BufferedReader reader = request.getReader()) {
            while ((linea = reader.readLine()) != null) {
                sb.append(linea);
            }
        }

        String carritoJson = sb.toString();

        if (carritoJson == null || carritoJson.isEmpty()) {
            response.getWriter().write("Body vacío!");
            return;
        }
        // Parsear el JSON string a JsonArray
        JsonArray arreglo = JsonParser.parseString(carritoJson).getAsJsonArray();

        // Recorrer el arreglo
        for (JsonElement elemento : arreglo) {
            JsonObject producto = elemento.getAsJsonObject();

            // Acceder a los campos
            String nombre = producto.get("nombre").getAsString();
            double precio = producto.get("precio").getAsDouble();   // siempre Double
            String namestock = producto.get("namestock").getAsString();
            int stock = producto.get("stock").getAsInt();
            int stockmaximo = producto.get("stockmaximo").getAsInt();

            System.out.println("Nombre: " + nombre);
            System.out.println("Precio: " + precio);
            System.out.println("Namestock: " + namestock);
            System.out.println("Stock: " + stock);
            System.out.println("Stockmaximo: " + stockmaximo);
            System.out.println("----------");
        }

        response.setContentType("text/plain");
        response.getWriter().write("Carrito procesado OK");

    }

    private void obtenerDataConClase(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        // 1. Leer el body
        StringBuilder sb = new StringBuilder();
        String linea;
        try ( BufferedReader reader = request.getReader()) {
            while ((linea = reader.readLine()) != null) {
                sb.append(linea);
            }
        }

        String carritoJson = sb.toString().trim();
        System.out.println("JSON recibido: " + carritoJson);

        // 2. Validar que no esté vacío
        if (carritoJson.isEmpty() || !carritoJson.startsWith("[")) {
            response.setStatus(400);
            response.getWriter().write("Error: JSON inválido o vacío");
            return;
        }

        // 3. Convertir JSON a List<Producto> con Gson
        Gson gson = new Gson();
        Type tipoLista = new TypeToken<List<Carrito>>() {
        }.getType();
        List<Carrito> carrito = gson.fromJson(carritoJson, tipoLista);

        // 4. Recorrer y usar los productos
        System.out.println("Total productos: " + carrito.size());
        System.out.println("==========================");

        for (Carrito p : carrito) {
            System.out.println(p.getNombre());
            // Ya puedes usar cada producto como quieras
            // Por ejemplo insertar en base de datos:
            // dao.insertar(p);
        }

        // 5. Responder al cliente
        response.getWriter().write("Carrito recibido con " + carrito.size() + " productos OK");
    }

}
