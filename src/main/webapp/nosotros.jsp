<%-- 
    Document   : nosotros
    Created on : Mar 10, 2026, 9:49:44 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Nosotros</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/static/estilos/nosotros.css">  

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
                    <div class="nav-action-item"  ">
                        <span> </span>
                    </div>
                    <div class="nav-action-item cart-btn"  ">
                        <span></span>
                        <span class="cart-badge"></span>
                    </div>
                </div>
            </div>

            <div class="category-bar">
                <%@include file="components/menus.jspf" %>         

            </div>
        </header>

        <!-- HERO | nosotros.jsp -->
        <div class="about-hero">
            <div>
                <h1>Somos <span>PC Gamer Store</span></h1>
                <p>Desde 2015 llevamos la mejor tecnología gamer a cada rincón del país. Pasión, garantía y servicio de calidad.</p>
                <button class="cta-btn" onclick="window.location = '#'">Ver Productos</button>
                <button class="cta-btn outline" onclick="window.location = '#'">Únete hoy</button>
            </div>
        </div>

        <div class="main">

            <!-- MISIÓN Y VISIÓN -->
            <div class="duo-grid">
                <div class="info-card">
                    <div class="ic-icon">🎯</div>
                    <h3>Nuestra Misión</h3>
                    <p>Democratizar el acceso a tecnología gamer de calidad. Ofrecemos equipos de alta gama a precios justos, con asesoría personalizada, garantía real y servicio post-venta que realmente funciona.</p>
                </div>
                <div class="info-card">
                    <div class="ic-icon">🚀</div>
                    <h3>Nuestra Visión</h3>
                    <p>Ser la tienda gamer #1 de Latinoamérica para 2030, reconocida por innovación constante, la comunidad más grande de gamers y el mejor servicio al cliente del mercado.</p>
                </div>
            </div>

            <!-- ESTADÍSTICAS | JSP: datos desde DAO/Estadisticas -->
            <div class="stats">
                <div class="stat"><div class="s-num">+5K</div><p>Pedidos enviados</p></div>
                <div class="stat"><div class="s-num">4.9★</div><p>Calificación promedio</p></div>
                <div class="stat"><div class="s-num">25+</div><p>Ciudades con cobertura</p></div>
                <div class="stat"><div class="s-num">10K+</div><p>Clientes satisfechos</p></div>
            </div>

            <!-- VALORES -->
            <h2 class="section-title">Nuestros Valores</h2>
            <div class="valores-grid">
                <div class="valor-card"><div class="v-icon">🏆</div><h4>Calidad Garantizada</h4><p>Todos nuestros productos cuentan con garantía de fábrica y soporte técnico especializado.</p></div>
                <div class="valor-card"><div class="v-icon">⚡</div><h4>Velocidad y Eficiencia</h4><p>Procesamos y enviamos tu pedido en menos de 24 horas en Lima. Express disponible.</p></div>
                <div class="valor-card"><div class="v-icon">💬</div><h4>Soporte Real</h4><p>Atención por WhatsApp, chat y llamada. Resolvemos cualquier problema en el día.</p></div>
                <div class="valor-card"><div class="v-icon">💰</div><h4>Mejor Precio</h4><p>Encontraste más barato? Te igualamos el precio. Comprometidos con tu bolsillo.</p></div>
                <div class="valor-card"><div class="v-icon">🌍</div><h4>Envío a todo Perú</h4><p>Llegamos a más de 25 ciudades con embalaje seguro y número de seguimiento.</p></div>
                <div class="valor-card"><div class="v-icon">🔒</div><h4>Compra Segura</h4><p>Pagos encriptados SSL, múltiples métodos de pago y política de devolución de 30 días.</p></div>
            </div>

            <!-- EQUIPO | JSP: datos desde DAO/Empleados -->
            <h2 class="section-title">Nuestro Equipo</h2>
            <div class="team-grid">
                <div class="team-card">
                    <div class="avatar">👨‍💼</div>
                    <h4>Erick Obispo Rodriguez</h4>
                    <div class="role">CEO &amp; Fundador</div>
                    <p>Gamer desde los 12 años. Fundó PCGamer Store con la visión de hacer accesible la tecnología.</p>
                </div>
                <div class="team-card">
                    <div class="avatar">👩‍💻</div>
                    <h4>-</h4>
                    <div class="role">CTO</div>
                    <p>Experta en hardware y arquitectura de sistemas. Responsable de la innovación tecnológica.</p>
                </div>
                <div class="team-card">
                    <div class="avatar">👨‍🎨</div>
                    <h4>Luis Torres</h4>
                    <div class="role">Director de Marketing</div>
                    <p>Creativo nato. Dirige todas las campañas digitales y la comunidad de gamers.</p>
                </div>
                <div class="team-card">
                    <div class="avatar">👩‍🔧</div>
                    <h4>-</h4>
                    <div class="role">Jefa de Soporte</div>
                    <p>Técnica certificada. Lidera el equipo de atención al cliente y servicio post-venta.</p>
                </div>
            </div>

            <!-- HISTORIA TIMELINE -->
            <h2 class="section-title">Nuestra Historia</h2>
            <div class="timeline">
                <div class="tl-item">
                    <div class="tl-left"><div class="tl-dot">2015</div><div class="tl-line"></div></div>
                    <div class="tl-content"><div class="tl-year">2015 — Fundación</div><h4>El comienzo</h4><p>Abrimos nuestras puertas en Miraflores, Lima, con solo 20 productos y un sueño: hacer que cada gamer tenga el mejor equipo.</p></div>
                </div>
                <div class="tl-item">
                    <div class="tl-left"><div class="tl-dot">2018</div><div class="tl-line"></div></div>
                    <div class="tl-content"><div class="tl-year">2018 — Expansión</div><h4>Primera tienda online</h4><p>Lanzamos nuestra tienda virtual con envíos a todo el país. Crecimos a 500+ productos y 5,000 clientes.</p></div>
                </div>
                <div class="tl-item">
                    <div class="tl-left"><div class="tl-dot">2021</div><div class="tl-line"></div></div>
                    <div class="tl-content"><div class="tl-year">2021 — Crecimiento</div><h4>+3 locales y app móvil</h4><p>Abrimos nuevas sedes en San Isidro y Surco. Lanzamos nuestra app con más de 10,000 descargas.</p></div>
                </div>
                <div class="tl-item">
                    <div class="tl-left"><div class="tl-dot">2026</div></div>
                    <div class="tl-content"><div class="tl-year">2026 — Hoy</div><h4>Líderes del mercado</h4><p>Más de 10,000 clientes satisfechos, 200+ productos y presencia en 25 ciudades del Perú. ¡Seguimos creciendo!</p></div>
                </div>
            </div>

            <!-- CTA FINAL -->
            <div class="cta-block">
                <h2>¿Listo para armar tu setup? 🎮</h2>
                <p>Únete a nuestra comunidad de gamers y obtén acceso a ofertas exclusivas, atención prioritaria y mucho más.</p>
                <button class="cta-btn" onclick="window.location = 'productos.html'">Ver Productos</button>
                <button class="cta-btn outline" onclick="window.location = 'login.html'">Crear Cuenta Gratis</button>
            </div>

        </div>

    </body>
</html>
