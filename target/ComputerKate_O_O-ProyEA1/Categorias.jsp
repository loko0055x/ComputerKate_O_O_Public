<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Categorías</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/static/estilos/categories.css">  

    </head>
    <body>

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
                        <span class="logo-sub">MAYORISTA DE COMPUTxO</span>
                    </div>
                </div>

                <div class="search-container">
                    <form class="search-form">
                        <input type="text" class="search-input" placeholder="Buscar productos en IMPACTO.">
                        <button type="submit" class="search-btn">🔍</button>
                    </form>
                </div>

                <div class="nav-actions">
                    <div class="nav-action-item" onclick="window.location = ''">
                        <span> </span>
                    </div>

                </div>
            </div>

            <div class="category-bar">
                <%@include file="components/menus.jspf" %>         

            </div>
        </header>

        <!-- CONTENIDO | categorias.jsp -->
        <div class="main">
            <div class="page-header">
                <h1>Todas las Categorías</h1>
                <p>Explora nuestra amplia selección de productos gamer. Siempre con garantía y envío a todo el país.</p>
            </div>

            <!-- Estadísticas | JSP: datos desde Servlet -->
            <div class="stats-row">
                <div class="stat-card"><div class="s-icon">📦</div><h3>${cantidadproducto}+</h3><p>Productos disponibles</p></div>
                <div class="stat-card"><div class="s-icon">🏷️</div><h3>6</h3><p>Categorías activas</p></div>
                <div class="stat-card"><div class="s-icon">⭐</div><h3>4.9</h3><p>Calificación promedio</p></div>
                <div class="stat-card"><div class="s-icon">🚚</div><h3>24h</h3><p>Envío express Lima</p></div>
            </div>

            <!-- Grid de categorías | JSP:   -->
            <div class="cat-grid">


                <c:forEach var="x" items="${categorias}">

                    <div
                        class="cat-card"
                        onclick="window.location = 'ProductoServlet'"
                        >
                        <div class="cat-icon">${x.icon}️️</div>
                        <h2>${x.nombrecategoria}</h2>
                        <p>
                            ${x.descripcion}
                        </p>
                        <div class="cat-tags">
                            <c:forEach var="a" items="${x.productos}">

                                <span class="cat-tag">${a}</span>
                                 
                            </c:forEach>
                        </div>
                        <span class="cat-count">${x.cantidadcategoria} Productos</span>
                        <button class="ver-btn">Ver productos →</button>
                    </div>
                </c:forEach>
            </div>

            <!-- Banners promocionales -->
            <div class="banners">
                <div class="banner b1">
                    <div class="banner-text">
                        <h3>🔥 Ofertas de la semana</h3>
                        <p>Hasta 30% de descuento en PC Gamer y monitores seleccionados. Solo por tiempo limitado.</p>
                        <button class="banner-btn" onclick="window.location = '#'">Ver ofertas</button>
                    </div>
                    <div class="banner-icon">🖥️</div>
                </div>
                <div class="banner b2">
                    <div class="banner-text">
                        <h3>🎮 Arma tu Setup</h3>
                        <p>Combina productos de distintas categorías y obtén un descuento especial por bundle.</p>
                        <button class="banner-btn" onclick="window.location = '#'" style="background:#7c3aed;">Ver bundles</button>
                    </div>
                    <div class="banner-icon">🕹️</div>
                </div>
            </div>
        </div>

    </body>
</html>
