<%-- 
    Document   : productos
    Created on : Mar 23, 2026, 11:00:49 PM
    Author     : Usuario
--%>

<%@page import="models.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Productos</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/static/estilos/products.css">  

    </head>
    <body>
        <% List< Producto> arreglo = (List<Producto>) session.getAttribute("arreglo");
        %>
        <div class="header-top">
            <a href="#">Servicio Técnico</a>
            <a href="#">Tiendas</a>
            <a href="#">Contactar</a>
        </div>

        <header>
            <div class="header-container">
                <div class="logo-container" onclick="window.location = 'index.html'" style="cursor:pointer;">
                    <div class="logo-icon">💠</div>
                    <div class="logo-text">
                        <span class="logo-main">IMPACTO</span>
                        <span class="logo-sub">MAYORISTA DE COMPUTO</span>
                    </div>
                </div>

                <div class="search-container">
                    <form class="search-form">
                        <input type="text" class="search-input" placeholder="Buscar productos en IMPACTO.">
                        <button type="submit" class="search-btn">🔍</button>
                    </form>
                </div>

                <div class="nav-actions">
                    <div class="nav-action-item" onclick="window.location = '#'">
                        <span>👤</span>
                    </div>
                    <div class="nav-action-item cart-btn" onclick="toggleCart()">
                        <span>🛒 Mi Carrito</span>
                        <span class="cart-badge" id="cart-count">
                            <%=arreglo == null ? "0" : arreglo.size()%>  
                    </div>
                </div>
            </div>

            <div class="category-bar">
                <%@include file="components/menus.jspf" %>         

            </div>
        </header>

        <!-- CARRITO SIDEBAR | carrito.jsp -->
        <div class="cart-overlay" id="cart-overlay">
            <div class="cart-head">
                <h2>🛒 Carrito (<span id="cart-side-count">                              <%=arreglo == null ? "0" : arreglo.size()%>  
                    </span>)</h2>
                <div class="close-cart" onclick="toggleCart()">✕</div>
            </div>
            <div class="cart-body" id="cart-items">
                <%
                    // Obtener la lista de productos almacenada en la sesión

                    // Verificar si la lista no es nula
                    if (arreglo != null) {
                        for (Producto p : arreglo) {
                %>
                <div class="cart-item">
                    <div class="ci-img">
                        <img src="<%= p.getRutaimagen()%>" alt="alt"/>
                    </div>
                    <div class="ci-info" style="flex:1;">
                        <h4><%= p.getTitulo()%></h4>
                        <p>$<%= p.getPrecio()%></p>
                        <div class="ci-controls">
                            <span><%= p.getCantidad()%></span>
                            <span style="margin-left:auto;color:var(--primary);font-weight:700;">
                                $<%= p.getPrecio() * p.getCantidad()%>
                            </span>
                        </div>
                    </div>
                    <span style="cursor:pointer;font-size:16px;" 
                          onclick="eliminarProducto(<%= p.getIdproducto()%>, <%= p.getIdcategoria()%>)">
                        🗑️
                    </span>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="cart-foot">
                <div class="total-row">
                    <span>Total:</span><span id="cart-total">$<%=session.getAttribute("total") == null ? "0" : session.getAttribute("total")%></span>
                </div>
                <button class="checkout-btn" onclick="window.location.href = 'formpagos'">Ir al pago →</button>            </div>
        </div>


        <!-- CONTENIDO | productos.jsp -->
        <div class="main">
            <div class="page-top">
                <h1 class="section-title">🖥️ Productos</h1>

                <span class="results-count" id="result-count"   > </span>            </div>

            <!-- Filtros rápidos por categoría 💻  🪑  🖱  🛡-->
            <div class="top-filters">
                <button class="filter-btn active" onclick="window.location.href = 'ProductoServlet'">Todos</button>                

                <c:forEach var="x" items="${categorias}">

                    <button class="filter-btn" data-cat="pc-gamer"
                            onclick="window.location.href = 'ProductoServletfilter?idcat=${x.idcategoria}'">

                        ${x.nombrecategoria}</button>
                    </c:forEach>


            </div>

            <div class="layout">
                <!-- Sidebar filtros avanzados -->
                <aside class="sidebar">
                    <h3>Filtros</h3>
                    <div class="sidebar-section">
                        <h4>Ordenar por</h4>
                        <div class="filter-item"><input type="radio" name="sort" id="s-rel" value="rel" checked onchange="sortProducts('rel')"><label for="s-rel">Relevancia</label></div>
                        <div class="filter-item"><input type="radio" name="sort" id="s-asc" value="asc" onchange="sortProducts('asc')"><label for="s-asc">Menor precio</label></div>
                        <div class="filter-item"><input type="radio" name="sort" id="s-desc" value="desc" onchange="sortProducts('desc')"><label for="s-desc">Mayor precio</label></div>
                    </div>
                    <div class="sidebar-section">
                        <h4>Solo con oferta</h4>
                        <div class="filter-item"><input type="checkbox" id="oferta-check" onchange="renderGrid()"><label for="oferta-check">Mostrar ofertas</label></div>
                    </div>
                </aside>


                <div class="grid" id="products-grid">
                    <c:forEach var="p" items="${productos}">
                        <!-- PRODUCTO 1 -->
                        <div class="card">
                            <input type="hidden" name="id" value="${p.idproducto}"> <!-- id del registro a actualizar -->
                            <input type="hidden" name="cantidad" value="${p.cantidad}"> <!-- id del registro a actualizar -->
                            <input type="hidden" name="categoria" value="${p.categoria.idcategoria}"> <!-- id del registro a actualizar -->

                            <span class="tag">Popular</span>
                            <div class="card-img">
                                <img src="${p.rutaimagen}" alt="alt"/>


                                ️</div>
                            <div class="card-body">
                                <h3>${p.titulo}</h3>
                                <p class="specs">${p.descripcion}</p>
                                <p class="desc">-</p>
                                <div class="price-row">
                                    <span class="price">$${p.precio}</span>
                                    <button class="buy-btn" onclick="agregarYAbrir(${p.idproducto},
                                                    '${p.titulo}',
                                                    '${p.descripcion}',
                                            ${p.precio},
                                            ${p.cantidad},
                                                    '${p.rutaimagen}',
                                            ${p.categoria.idcategoria}
                                            )">🛒 Agregar</button>                                </div>
                            </div>
                        </div>


                    </c:forEach>
                </div>


            </div>
        </div>






        <button onclick="toggleCart()">Abrir Carrito</button>

    </body>


    <script>
        function toggleCart() {
            document.getElementById("cart-overlay").classList.toggle("open");
        }
        function agregarYAbrir(idproducto, titulo, descripcion, precio, cantidad, rutaimagen, idcategoria) {

            window.location.href = 'PagosServlet?idproducto=' + idproducto +
                    '&titulo=' + encodeURIComponent(titulo) +
                    '&descripcion=' + encodeURIComponent(descripcion) +
                    '&precio=' + precio +
                    '&cantidad=' + cantidad +
                    '&rutaimagen=' + encodeURIComponent(rutaimagen) +
                    '&idcategoria=' + idcategoria;
        }

        /*function agregarYAbrir(id, titulo, descripcion, precio, cantidad, imagen, idcategoria) {
         
         // Crear parámetros
         const params = new URLSearchParams();
         params.append("idproducto", id);
         params.append("titulo", titulo);
         params.append("descripcion", descripcion);
         params.append("precio", precio);
         params.append("cantidad", cantidad);
         params.append("rutaimagen", imagen);
         params.append("idcategoria", idcategoria);
         
         fetch('PagosServlet', {
         method: 'POST',
         headers: {
         'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
         },
         body: params.toString()
         })
         .then(response => response.text())
         .then(result => {
         console.log("Servlet respondió:", result);
         window.location.reload();
         
         toggleCart(); // abrir modal
         })
         .catch(err => console.error("Error al llamar al servlet:", err));
         }*/
        function eliminarProducto(idproducto, idcategoria) {

            window.location.href = 'EliminarProductoServlet?idproducto=' + idproducto +
                    '&idcategoria=' + idcategoria;


        }
    </script>
</html>
