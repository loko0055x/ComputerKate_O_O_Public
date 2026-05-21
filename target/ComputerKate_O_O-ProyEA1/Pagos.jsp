<%-- 
    Document   : Pagos
    Created on : Mar 27, 2026, 2:19:00 PM
    Author     : Usuario
--%>

<%@page import="models.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="models.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Finalizar Compra</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="resources/static/estilos/pagos.css">  

    </head>

    <%
        HttpSession sesion = request.getSession();
        List<Producto> arreglo = (List<Producto>) sesion.getAttribute("arreglo");
        Usuario usuario = new Usuario(0, "", "", "", "", "", null, true);
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp"); // Cambia 'login.jsp' por la URL de la página que desees

        }
        usuario = (Usuario) session.getAttribute("usuario");

    %>
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
                    <div class="nav-action-item" onclick="window.location = '#'">
                        <span></span>
                    </div>
                    <div class="nav-action-item cart-btn" onclick="window.location = 'carritodelete'">
                        <span>👤 Cerrar Session</span>
                    </div>
                </div>
            </div>

            <div class="category-bar">
                <%@include file="components/menus.jspf" %>         

            </div>
        </header>

        <!-- CONTENIDO | checkout.jsp -->
        <div class="main">
            <div class="page-header">
                <h1>💳 Finalizar Compra</h1>
                <p>Completa tus datos para confirmar el pedido</p>
            </div>

            <!-- Steps de progreso -->
            <div class="steps">
                <div class="step">
                    <div class="step-circle active" id="step1">1</div>
                    <span class="step-label active">Envío</span>
                </div>
                <div class="step-line" id="line1"></div>
                <div class="step">
                    <div class="step-circle" id="step2">2</div>
                    <span class="step-label">Pago</span>
                </div>
                <div class="step-line" id="line2"></div>
                <div class="step">
                    <div class="step-circle" id="step3">3</div>
                    <span class="step-label">Confirmación</span>
                </div>
            </div>

            <!-- Formulario principal -->
            <div id="checkout-content">
                <div class="checkout-grid">
                    <!-- Columna izquierda -->
                    <div>

                        <!-- DATOS DE ENVÍO | JSP: BindingResult + @ModelAttribute DatosEnvio -->
                        <div class="ck-card">
                            <h3>📦 Datos de Envío</h3>
                            <form id="checkout-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="nombre">Nombre completo *</label>
                                        <input type="text" id="nombre" name="nombre" value="<%=usuario == null ? "" : usuario.getNombre() + " " + usuario.getApellido()%>" placeholder="Juan Pérez" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="telefono">Teléfono *</label>
                                        <input type="tel" id="telefono" name="telefono" placeholder="+51 999 999 999" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="email">Email *</label>
                                        <input type="text" id="email"  value="<%=usuario == null ? "" : usuario.getUsuario()%>" name="email" placeholder="tu@email.com" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="dni">DNI / RUC *</label>
                                        <input type="text" id="dni" name="dni" placeholder="12345678" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="direccion">Dirección *</label>
                                        <input type="text" id="direccion" name="direccion" placeholder="Av. Lima 123" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="ciudad">Ciudad *</label>
                                        <input type="text" id="ciudad" name="ciudad" placeholder="Lima" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="distrito">Distrito *</label>
                                        <input type="text" id="distrito" name="distrito" placeholder="Miraflores" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="referencia">Referencia</label>
                                        <input type="text" id="referencia" name="referencia" placeholder="Cerca al parque...">
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- MÉTODO DE PAGO | JSP: MetodoPago enum o tabla -->
                        <div class="ck-card">
                            <h3>💳 Método de Pago</h3>
                            <div class="pay-grid">
                                <div class="pay-opt active" onclick="selectPay('yape', this)">
                                    <div class="p-icon">💜</div><span>Yape</span>
                                </div>
                                <div class="pay-opt" onclick="selectPay('plin', this)">
                                    <div class="p-icon">💚</div><span>Plin</span>
                                </div>
                                <div class="pay-opt" onclick="selectPay('paypal', this)">
                                    <div class="p-icon">🔵</div><span>PayPal</span>
                                </div>
                                <div class="pay-opt" onclick="selectPay('mercado', this)">
                                    <div class="p-icon">🟡</div><span>MercadoPago</span>
                                </div>
                                <div class="pay-opt" onclick="selectPay('visa', this)">
                                    <div class="p-icon">💳</div><span>Visa</span>
                                </div>
                                <div class="pay-opt" onclick="selectPay('master', this)">
                                    <div class="p-icon">💳</div><span>Mastercard</span>
                                </div>
                            </div>
                            <!-- Campos de tarjeta (solo para Visa/Mastercard) -->
                            <div class="card-fields" id="card-fields">
                                <div class="form-row">
                                    <div class="form-group" style="grid-column:1/-1;">
                                        <label>Número de tarjeta</label>
                                        <input type="text" placeholder="4242 4242 4242 4242" maxlength="19">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group"><label>Vencimiento</label><input type="text" placeholder="MM/AA" maxlength="5"></div>
                                    <div class="form-group"><label>CVV</label><input type="text" placeholder="123" maxlength="4"></div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Columna derecha: Resumen -->
                    <!-- JSP: Datos del carrito desde HttpSession -->
                    <div>
                        <div class="ck-card" style="position:sticky;top:90px;">
                            <h3>🧾 Resumen del Pedido</h3>
                            <div id="summary-items">
                                <%                                    if (arreglo != null) {
                                        for (Producto p : arreglo) {
                                %>

                                <div class="summary-item">
                                    <div class="si-emoji">🖥️</div>
                                    <div class="si-info">
                                        <h4><%= p.getTitulo()%></h4>
                                        <p>Cantidad: <%= p.getCantidad()%> · $<%= p.getPrecio()%> c/u</p>
                                    </div>
                                    <span class="si-price">$<%= p.getTotal()%></span>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div class="total-block">
                                <div class="total-line"><span>Subtotalx</span><span id="subtotal-val">$ <%= session.getAttribute("total") == null ? "0" : session.getAttribute("total")%> </span></div>
                                <div class="total-line"><span>Envío</span><span style="color:#4caf50;">Gratis 🚚</span></div>
                                <div class="total-line"><span>IGV (0%)</span><span id="igv-val">$0</span></div>
                                <div class="total-line main"><span>Total</span><span id="total-val">$ <%= session.getAttribute("total") == null ? "0" : session.getAttribute("total")%></span></div>
                            </div>
                            <%
                                // Suponiendo que tienes una variable de sesión "usuarioAutenticado"
                                boolean usuarioAutenticado = (arreglo != null && arreglo.size() != 0);
                            %>
                            <button class="confirm-btn" id="confirm-btn" type="submit"
                                    onclick="if (<%= usuarioAutenticado%>) {
                                                this.disabled = true;
                                                window.location.href = 'paginaDeConfirmacion';
                                            }">
                                <%= usuarioAutenticado ? "Confirmar Compra" : "No hay items"%>

                            </button>
                            <a href="IndexServlet" style="display:block;text-align:center;margin-top:12px;color:var(--dim);font-size:13px;">← Seguir comprando</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Carrito vacío -->
            <div id="empty-cart" style="display:none;">
                <div class="empty-cart">
                    <div class="e-icon">🛒</div>
                    <p>Tu carrito está vacío. Agrega productos antes de pagar.</p>
                    <button class="back-btn" onclick="window.location = 'productos.html'">Ver Productos</button>
                </div>
            </div>

            <!-- Pantalla de éxito -->
            <div class="success-screen" id="success-screen">
                <div class="s-icon">✅</div>
                <h2>¡Compra Confirmada!</h2>
                <p>Tu pedido fue procesado exitosamente. Recibirás un correo de confirmación.</p>
                <div class="order-id">Pedido #<span id="order-number"></span></div><br>
                <button class="cta" onclick="window.location = 'index.html'">Volver al inicio</button>
            </div>
        </div>

        <script>

        </script>
    </body>
</html>
