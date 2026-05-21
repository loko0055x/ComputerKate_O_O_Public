<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PC Gamer Store | Premium Hardware</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <!-- Main Style -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- NAVBAR -->
    <header>
        <div class="nav">
            <div class="logo">
                <span style="font-size: 24px;">🖥️</span> PC Gamer Storexxxxxxx
            </div>
            <nav class="menu">
                <a href="#" class="active" onclick="showSection('home')">Inicio</a>
                <a href="#products">Productos</a>
                <a href="#">Categorías</a>
                <a href="#">¿Qué vas a jugar?</a>
                <a href="#">Nosotros</a>
                <a href="#">Contacto</a>
            </nav>
            <div class="nav-right">
                <div class="cart-icon" onclick="toggleCart()">
                    🛒 <span class="count" id="cart-count">0</span>
                </div>
                <button class="login-btn" onclick="toggleLogin()">Iniciar Sesión</button>
            </div>
        </div>
    </header>

    <!-- HOME SECTION -->
    <div id="home-section">
        <section class="hero">
            <div class="hero-content">
                <h1>PC Gamer <br><span>RGB Series</span></h1>
                <p>Equipos de alto rendimiento diseñados para gamers que no aceptan compromisos. Estética futurista y potencia sin límites.</p>
                <button class="cta" onclick="window.location.href='#products'">Explorar Catálogo</button>
            </div>
        </section>

        <!-- NEW CATEGORIES SECTION -->
        <section class="categories-section">
            <h2>Categorías</h2>
            <p>Encuentra lo que necesitas para tu setup ideal</p>
            
            <div class="cat-grid">
                <div class="cat-card" onclick="filterCategory('pc-gamer', document.getElementById('filter-pc'))">
                    <div class="cat-icon">🖥️</div>
                    <span>PC Gamer</span>
                </div>
                <div class="cat-card" onclick="filterCategory('laptop', document.getElementById('filter-laptop'))">
                    <div class="cat-icon">💻</div>
                    <span>Laptop</span>
                </div>
                <div class="cat-card" onclick="filterCategory('monitor', document.getElementById('filter-monitor'))">
                    <div class="cat-icon">🖥️</div>
                    <span>Monitor</span>
                </div>
                <div class="cat-card" onclick="filterCategory('escritorio', document.getElementById('filter-escritorio'))">
                    <div class="cat-icon">🪑</div>
                    <span>Escritorio</span>
                </div>
                <div class="cat-card" onclick="filterCategory('accesorios', document.getElementById('filter-accesorios'))">
                    <div class="cat-icon">🖱️</div>
                    <span>Accesorios</span>
                </div>
                <div class="cat-card" onclick="filterCategory('antivirus', document.getElementById('filter-antivirus'))">
                    <div class="cat-icon">🛡️</div>
                    <span>Antivirus</span>
                </div>
            </div>
        </section>

        <!-- PRODUCTS AREA -->
        <main class="content-container" id="products">
            <h2 class="section-title">Productos</h2>
            
            <div class="filters">
                <button class="filter-btn active" id="filter-all" onclick="filterCategory('all', this)">Todos</button>
                <button class="filter-btn" id="filter-pc" onclick="filterCategory('pc-gamer', this)">💻 PC Gamer</button>
                <button class="filter-btn" id="filter-laptop" onclick="filterCategory('laptop', this)">💻 Laptop</button>
                <button class="filter-btn" id="filter-monitor" onclick="filterCategory('monitor', this)">🖥️ Monitor</button>
                <button class="filter-btn" id="filter-escritorio" onclick="filterCategory('escritorio', this)">🪑 Escritorio</button>
                <button class="filter-btn" id="filter-accesorios" onclick="filterCategory('accesorios', this)">⌨️ Accesorios</button>
                <button class="filter-btn" id="filter-antivirus" onclick="filterCategory('antivirus', this)">🛡️ Antivirus</button>
            </div>

            <div class="grid" id="products-grid">
                <!-- Products will be injected here by script.js -->
            </div>
        </main>
    </div>

    <!-- CHECKOUT SECTION (HIDDEN BY DEFAULT) -->
    <div id="checkout-section" class="checkout-section">
        <h2 class="section-title" style="margin-bottom: 40px;">Finalizar Compra</h2>
        
        <div class="checkout-grid">
            <div class="checkout-form-col">
                <div class="checkout-card" style="margin-bottom: 25px;">
                    <h3>Datos de Envío</h3>
                    <form id="checkout-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label>Nombre completo</label>
                                <input type="text" placeholder="Juan Pérez" required>
                            </div>
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="text" placeholder="+51 999 999 999" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Dirección</label>
                                <input type="text" placeholder="Av. Lima 123" required>
                            </div>
                            <div class="form-group">
                                <label>Ciudad</label>
                                <input type="text" placeholder="Lima" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Distrito</label>
                                <input type="text" placeholder="Miraflores" required>
                            </div>
                            <div class="form-group">
                                <label>Referencia</label>
                                <input type="text" placeholder="Cerca al parque...">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="checkout-card">
                    <h3>Método de Pago</h3>
                    <div class="payment-methods">
                        <div class="payment-method" onclick="selectPayment('yape', this)">
                            <span>Yape</span>
                        </div>
                        <div class="payment-method" onclick="selectPayment('plin', this)">
                            <span>Plin</span>
                        </div>
                        <div class="payment-method active" onclick="selectPayment('paypal', this)">
                            <span style="font-weight: 800; color: #0070ba;">PayPal</span>
                        </div>
                        <div class="payment-method" onclick="selectPayment('mercado', this)">
                            <span>MercadoPago</span>
                        </div>
                    </div>
                </div>
                
                <button type="submit" form="checkout-form" class="checkout-btn" id="confirm-checkout-btn" style="margin-top: 30px; font-size: 16px;">
                    Confirmar Compra
                </button>
            </div>

            <div class="checkout-summary-col">
                <div class="checkout-card">
                    <h3>Resumen</h3>
                    <div id="checkout-summary-item" style="display: flex; gap: 15px; align-items: center; margin-bottom: 20px;">
                        <img src="" id="checkout-summary-img" style="width: 50px; height: 50px; border-radius: 8px; object-fit: cover; border: 1px solid var(--border); display: none;">
                        <div style="flex: 1;">
                            <p style="font-weight: 600; font-size: 14px;">Total de productos</p>
                        </div>
                    </div>
                    <div class="total-row" style="border-top: 1px solid var(--border); padding-top: 15px;">
                        <span>Total:</span>
                        <span id="checkout-total-val" style="color: var(--primary);">$0</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CART SIDEBAR -->
    <div class="cart-overlay" id="cart-overlay">
        <div class="cart-header">
            <h2>Carrito (<span id="cart-count-sidebar">0</span>)</h2>
            <div class="close-cart" onclick="toggleCart()">✕</div>
        </div>
        <div class="cart-items" id="cart-items">
            <!-- Items by JS -->
        </div>
        <div class="cart-footer">
            <div class="total-row">
                <span>Total:</span>
                <span id="cart-total">$0</span>
            </div>
            <button class="checkout-btn" onclick="showSection('checkout')">Realizar Compra</button>
        </div>
    </div>

    <!-- AUTH MODAL -->
    <div class="auth-container" id="auth-modal">
        <div class="auth-card">
            <div class="icon">🖥️</div>
            <h2>Iniciar Sesión</h2>
            <p>Ingresa para continuar con tu compra</p>
            <form id="login-form">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" placeholder="tu@email.com" required>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="password" placeholder="••••••••" required>
                </div>
                <button type="submit" class="submit-btn" onclick="toggleLogin()">Ingresar</button>
            </form>
            <div class="auth-footer">
                ¿No tienes cuenta? <a href="#">Continuar como invitado</a>
            </div>
            <button onclick="toggleLogin()" style="background: none; border: none; color: var(--text-dim); margin-top: 20px; cursor: pointer;">Cerrar</button>
        </div>
    </div>

    <!-- FOOTER -->
    <footer>
        <div class="footer-grid">
            <div class="footer-col">
                <h4 class="logo" style="margin-bottom: 15px;">PC Gamer Store</h4>
                <p style="font-size: 14px; color: var(--text-dim);">Tu tienda de confianza para equipos gamer de alto rendimiento. Envíos a todo el país.</p>
                <div class="social-links">
                    <a href="#" class="social-btn">f</a>
                    <a href="#" class="social-btn">i</a>
                    <a href="#" class="social-btn">y</a>
                </div>
            </div>
            <div class="footer-col">
                <h4>Acerca de Nosotros</h4>
                <ul>
                    <li><a href="#">Nuestra Empresa</a></li>
                    <li><a href="#">Nuestros Locales</a></li>
                    <li><a href="#">Modalidades de Pago</a></li>
                    <li><a href="#">Delivery Lima</a></li>
                    <li><a href="#">Envíos a Provincia</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Garantías</h4>
                <ul>
                    <li><a href="#">T & C Garantía</a></li>
                    <li><a href="#">Términos y Condiciones</a></li>
                    <li><a href="#">Política de Privacidad</a></li>
                    <li><a href="#">Serv. Mant. y Reparación</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Métodos de Pago</h4>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                    <div style="border: 1px solid var(--border); padding: 5px; border-radius: 5px; text-align: center; color: var(--text-dim); font-size: 10px;">YAPE</div>
                    <div style="border: 1px solid var(--border); padding: 5px; border-radius: 5px; text-align: center; color: var(--text-dim); font-size: 10px;">PLIN</div>
                    <div style="border: 1px solid var(--border); padding: 5px; border-radius: 5px; text-align: center; color: var(--text-dim); font-size: 10px;">PAYPAL</div>
                    <div style="border: 1px solid var(--border); padding: 5px; border-radius: 5px; text-align: center; color: var(--text-dim); font-size: 10px;">MERCADO PAGO</div>
                </div>
            </div>
        </div>
        <div class="copyright">
            Copyright 2026 © PC Gamer Store. Todos los derechos reservados.
        </div>
    </footer>

    <!-- WHATSAPP FLOAT -->
    <div class="whatsapp-float">💬</div>

    <script src="js/script.js"></script>
</body>
</html>
