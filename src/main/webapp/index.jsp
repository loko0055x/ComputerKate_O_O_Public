<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Inicio</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/static/estilos/index.css">  


    </head>
    <body>

        <div class="header-top">
            <a href="#">Servicio Técnico</a>
            <a href="#">Tiendas</a>
            <a href="#">Contactar</a>
        </div>

        <header>
            <div class="header-container">
                <div class="logo-container" onclick="window.location = '#'" style="cursor:pointer;">
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
                        <span> </span>
                    </div>

                </div>
            </div>
            <div class="category-bar">
                <%@include file="components/menus.jspf" %>         
            </div>
        </header>

        <!-- HERO | futuro: inicio.jsp -->
        <section class="hero">
            <div>
                <h1>PC Gamer <br><span>RGB Series</span></h1>
                <p>Equipos de alto rendimiento diseñados para gamers que no aceptan compromisos. Estética futurista y potencia sin límites.</p>
                <button class="cta" onclick="window.location = '#'">Explorar Catálogo</button>
            </div>
        </section>

        <!-- CATEGORÍAS | futuro: categorias.jsp -->
        <div class="home-cats">
            <h2>Categorías Destacadas</h2>
            <p>Encuentra lo que necesitas para tu setup ideal</p>
            <div class="cat-row">
                <c:forEach var="x" items="${categorias}">
                    <div class="cat-card" onclick="window.location = 'CategoriaServlet'"><div class="icon">${x.icon}️</div><span>${x.nombrecategoria}</span></div>
                </c:forEach>

            
            </div>
        </div>

        <!-- PRODUCTOS POPULARES | futuro: productosDestacados.jsp -->
        <div class="featured">
            <h2 class="section-title">⭐ Productos Populares</h2>
            <div class="grid" id="featured-grid">

                <c:forEach var="p" items="${productos}">
                    <div class="card">
                        <input type="hidden" name="id" value="${p.idproducto}"> <!-- id del registro a actualizar -->

                        <span class="tag">Popular</span> 
                        <div class="card-img">
                            <img src="${p.rutaimagen}" alt="alt"/>
 
                            ️</div>
                        <div class="card-body">

                            <h3>${p.titulo}</h3>
                            <p class="specs">${p.descripcion}</p><p class="desc">-</p>
                            <div class="price-row">
                                <span class="price">$${p.precio}</span>
                                <button class="buy-btn" onclick="window.location = 'ProductoServlet'">🛒 Ver más</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <!-- FOOTER | futuro: footer.jsp -->
        <footer>
            <div class="footer-grid">
                <div class="footer-col">
                    <h4>PC Gamer Store</h4>
                    <p style="font-size:13px;color:var(--dim);line-height:1.7;">Tu tienda de confianza para equipos gamer. Envíos a todo el país.</p>
                    <div class="social-links">
                        <a href="#" class="social-btn">f</a>
                        <a href="#" class="social-btn">ig</a>
                        <a href="#" class="social-btn">yt</a>
                    </div>
                </div>
                <div class="footer-col">
                    <h4>Empresa</h4>
                    <ul>
                        <li><a href="NosotrosServlet">Nuestra Historia</a></li>
                        <li><a href="#">Nuestros Locales</a></li>
                        <li><a href="#">Delivery Lima</a></li>
                        <li><a href="#">Envíos Provincia</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Garantías</h4>
                    <ul>
                        <li><a href="#">T &amp; C Garantía</a></li>
                        <li><a href="#">Términos y Cond.</a></li>
                        <li><a href="#">Política Privacidad</a></li>
                        <li><a href="#">Mantenimiento</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Métodos de Pago</h4>
                    <div class="pay-badges">
                        <div class="pay-badge">YAPE</div><div class="pay-badge">PLIN</div>
                        <div class="pay-badge">PAYPAL</div><div class="pay-badge">MERCADO PAGO</div>
                        <div class="pay-badge">VISA</div><div class="pay-badge">MASTERCARD</div>
                    </div>
                </div>
            </div>
            <div class="copyright">Copyright 2026 © PC Gamer Store. Todos los derechos reservados.</div>
        </footer>

        <script>
            function showPayment(button) {
                const paymentDiv = button.nextElementSibling;
                paymentDiv.style.display =
                        paymentDiv.style.display === "block" ? "none" : "block";
            }
        </script>
        <div
            id="n8n-chat"
            style="z-index: 9999; position: fixed; bottom: 20px; right: 20px"
            ></div>
        <link
            href="https://cdn.jsdelivr.net/npm/@n8n/chat/dist/style.css"
            rel="stylesheet"
            />
        <script type="module">
            import { createChat } from "https://cdn.jsdelivr.net/npm/@n8n/chat/dist/chat.bundle.es.js";

            createChat({
                webhookUrl:
                        "https://protrusible-miki-hooly.ngrok-free.app/webhook/3da1de86-8ab8-4360-85c7-67954ae6b733/chat", // Cambia por tu URL real
                webhookConfig: {
                    method: "POST",
                    headers: {},
                },
                target: "#n8n-chat",
                mode: "window",
                chatInputKey: "chatInput",
                chatSessionKey: "sessionId",
                metadata: {},
                showWelcomeScreen: false,
                defaultLanguage: "en",
                initialMessages: [
                    "Hola! 👋",
                    "Soy un bot pregunta lo que deseas ?",
                ],
                i18n: {
                    en: {
                        title: "PC GAMER KAT O_O",
                        subtitle: "Estoy aquí para ayudarte 24/7.",
                        footer: "",
                        getStarted: "Nueva conversación",
                        inputPlaceholder: "Escribe tu pregunta...",
                    },
                },
            });
        </script>

    </body>

    <script>


    </script>
</html>
