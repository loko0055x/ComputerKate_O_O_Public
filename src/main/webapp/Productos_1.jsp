<%-- 
    Document   : productos
    Created on : Mar 23, 2026, 11:00:49 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store | Productos</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <style>
            /* ===== BASE ===== */
            /* ===== BASE ===== */
            :root{
                --primary:#3de0d0;
                --glow:rgba(61,224,208,.35);
                --bg:#0a0f14;
                --card:#0f1720;
                --input:#1b252d;
                --border:#1f2a33;
                --text:#d9e1e8;
                --dim:#9aa7b2;
            }
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:'Outfit',sans-serif;
            }
            body{
                background:var(--bg);
                color:var(--text);
                overflow-x:hidden;
            }
            a{
                text-decoration:none;
            }

            /* ===== TOP BAR ===== */
            .header-top {
                background:#070b0f;
                height:35px;
                display:flex;
                align-items:center;
                justify-content:flex-end;
                padding:0 60px;
                color:var(--dim);
                font-size:12px;
                gap:20px;
                border-bottom:1px solid var(--border);
            }
            .header-top a {
                color:var(--dim);
                transition:.3s;
            }
            .header-top a:hover {
                color:var(--primary);
            }

            /* ===== MAIN HEADER ===== */
            header {
                position:sticky;
                top:0;
                width:100%;
                background:rgba(15,23,32,0.95);
                backdrop-filter:blur(10px);
                border-bottom:1px solid var(--border);
                z-index:1000;
                padding:10px 0;
            }
            .header-container {
                display:flex;
                align-items:center;
                justify-content:space-between;
                padding:10px 60px;
                max-width:1400px;
                margin:0 auto;
                gap:30px;
            }

            /* LOGO STYLE */
            .logo-container {
                display:flex;
                align-items:center;
                gap:15px;
                min-width:250px;
            }
            .logo-icon {
                width:45px;
                height:45px;
                background:var(--primary);
                color:#000;
                display:flex;
                align-items:center;
                justify-content:center;
                border-radius:4px;
                font-size:24px;
            }
            .logo-text {
                display:flex;
                flex-direction:column;
            }
            .logo-main {
                font-size:32px;
                font-weight:800;
                color:var(--primary);
                line-height:1;
                text-shadow:0 0 10px var(--glow);
            }
            .logo-sub {
                font-size:10px;
                font-weight:700;
                color:var(--dim);
                letter-spacing:2px;
                margin-top:2px;
            }

            /* SEARCH BAR */
            .search-container {
                flex:1;
                max-width:800px;
                position:relative;
            }
            .search-form {
                display:flex;
                align-items:center;
                background:var(--input);
                border:1px solid var(--border);
                border-radius:50px;
                padding:3px;
                padding-left:20px;
                transition:.3s;
            }
            .search-form:focus-within {
                border-color:var(--primary);
                box-shadow:0 0 10px var(--glow);
            }
            .search-input {
                flex:1;
                border:none;
                background:transparent;
                padding:10px 0;
                font-size:14px;
                color:var(--text);
                outline:none;
            }
            .search-btn {
                background:var(--primary);
                color:#000;
                border:none;
                width:50px;
                height:42px;
                border-radius:0 50px 50px 0;
                cursor:pointer;
                display:flex;
                align-items:center;
                justify-content:center;
                font-size:18px;
                margin-right:-2px;
            }

            /* MENU & ICONS */
            .nav-actions {
                display:flex;
                align-items:center;
                gap:25px;
            }
            .nav-action-item {
                display:flex;
                flex-direction:column;
                align-items:center;
                color:var(--dim);
                cursor:pointer;
                transition:.3s;
                font-size:12px;
            }
            .nav-action-item:hover {
                color:var(--primary);
            }

            .cart-btn {
                position:relative;
            }
            .cart-badge {
                position:absolute;
                top:-5px;
                right:-5px;
                background:var(--primary);
                color:#000;
                font-size:10px;
                padding:2px 6px;
                border-radius:50%;
                font-weight:700;
            }

            /* CATEGORY BAR */
            .category-bar {
                background:rgba(10,15,20,0.5);
                border-top:1px solid var(--border);
                padding:10px 60px;
            }
            .cat-links {
                display:flex;
                gap:25px;
                max-width:1400px;
                margin:0 auto;
            }
            .cat-links a {
                color:var(--dim);
                font-weight:600;
                font-size:13px;
                text-transform:uppercase;
                transition:.3s;
            }
            .cat-links a:hover,.cat-links a.active {
                color:var(--primary);
            }

            /* ===== CARRITO SIDEBAR ===== */
            .cart-overlay{
                position:fixed;
                top:0;
                right:-100%;
                width:390px;
                height:100%;
                background:var(--card);
                border-left:1px solid var(--border);
                z-index:1500;
                transition:.4s;
                display:flex;
                flex-direction:column;
                padding:28px;
            }
            .cart-overlay.open{
                right:0;
            }
            .cart-head{
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:25px;
            }
            .cart-head h2{
                color:var(--primary);
                font-size:20px;
            }
            .close-cart{
                cursor:pointer;
                font-size:22px;
                color:var(--dim);
            }
            .cart-body{
                flex:1;
                overflow-y:auto;
            }
            .cart-item{
                display:flex;
                gap:12px;
                margin-bottom:18px;
                padding-bottom:18px;
                border-bottom:1px solid var(--border);
            }
            .ci-img{
                width:55px;
                height:55px;
                border-radius:8px;
                background:#141e28;
                display:flex;
                align-items:center;
                justify-content:center;
                font-size:26px;
                flex-shrink:0;
            }
            .ci-info h4{
                font-size:13px;
                margin-bottom:3px;
            }
            .ci-info p{
                color:var(--dim);
                font-size:12px;
                margin-bottom:7px;
            }
            .ci-controls{
                display:flex;
                align-items:center;
                gap:10px;
            }
            .qty-btn{
                background:var(--input);
                border:1px solid var(--border);
                color:#fff;
                width:24px;
                height:24px;
                display:flex;
                align-items:center;
                justify-content:center;
                border-radius:4px;
                cursor:pointer;
                font-size:14px;
            }
            .cart-foot{
                border-top:1px solid var(--border);
                padding-top:18px;
            }
            .total-row{
                display:flex;
                justify-content:space-between;
                font-size:18px;
                font-weight:700;
                margin-bottom:14px;
            }
            .total-row span:last-child{
                color:var(--primary);
            }
            .checkout-btn{
                width:100%;
                background:var(--primary);
                border:none;
                padding:14px;
                border-radius:10px;
                font-weight:700;
                cursor:pointer;
                font-size:15px;
                transition:.3s;
            }
            .checkout-btn:hover{
                box-shadow:0 0 15px var(--glow);
            }

            /* ===== CONTENIDO PRINCIPAL ===== */
            .main{
                padding:40px 60px 80px;
                max-width:1400px;
                margin:0 auto;
            }
            .page-top{
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:10px;
            }
            .section-title{
                color:var(--primary);
                font-size:32px;
                text-shadow:0 0 10px var(--glow);
            }
            .results-count{
                color:var(--dim);
                font-size:14px;
            }

            /* ===== LAYOUT SIDEBAR + GRID ===== */
            .layout{
                display:grid;
                grid-template-columns:220px 1fr;
                gap:30px;
                margin-top:30px;
            }

            /* ===== SIDEBAR FILTROS ===== */
            .sidebar{
                background:var(--card);
                border:1px solid var(--border);
                border-radius:14px;
                padding:22px;
                height:fit-content;
                position:sticky;
                top:90px;
            }
            .sidebar h3{
                color:var(--primary);
                font-size:14px;
                text-transform:uppercase;
                margin-bottom:16px;
                letter-spacing:1px;
            }
            .sidebar-section{
                margin-bottom:24px;
            }
            .sidebar-section h4{
                font-size:13px;
                color:var(--dim);
                margin-bottom:12px;
                text-transform:uppercase;
                letter-spacing:.5px;
            }
            .filter-item{
                display:flex;
                align-items:center;
                gap:9px;
                margin-bottom:9px;
                cursor:pointer;
                padding:6px 8px;
                border-radius:8px;
                transition:.3s;
            }
            .filter-item:hover{
                background:rgba(61,224,208,.06);
            }
            .filter-item input[type=radio]{
                accent-color:var(--primary);
            }
            .filter-item label{
                cursor:pointer;
                font-size:13px;
                color:var(--dim);
            }
            .filter-item.active label{
                color:var(--primary);
            }
            .price-range{
                width:100%;
                accent-color:var(--primary);
                margin:8px 0;
            }
            .price-labels{
                display:flex;
                justify-content:space-between;
                font-size:12px;
                color:var(--dim);
            }

            /* ===== FILTROS TOP ===== */
            .top-filters{
                display:flex;
                gap:10px;
                margin-bottom:22px;
                flex-wrap:wrap;
            }
            .filter-btn{
                background:rgba(255,255,255,.05);
                border:1px solid var(--border);
                color:var(--dim);
                padding:8px 18px;
                border-radius:12px;
                cursor:pointer;
                white-space:nowrap;
                transition:.3s;
                font-size:13px;
            }
            .filter-btn:hover,.filter-btn.active{
                background:var(--primary);
                color:#000;
                border-color:var(--primary);
            }

            /* ===== GRID PRODUCTOS ===== */
            .grid{
                display:grid;
                grid-template-columns:repeat(auto-fill,minmax(255px,1fr));
                gap:22px;
            }
            .card{
                background:var(--card);
                border:1px solid var(--border);
                border-radius:15px;
                overflow:hidden;
                transition:.3s;
                position:relative;
            }
            .card:hover{
                transform:translateY(-8px);
                border-color:var(--primary);
                box-shadow:0 10px 30px rgba(0,0,0,.5);
            }
            .card-img{
                width:100%;
                height:175px;
                background:#141e28;
                display:flex;
                align-items:center;
                justify-content:center;
                font-size:62px;
            }
            .tag{
                position:absolute;
                top:12px;
                left:12px;
                background:var(--primary);
                color:#000;
                font-size:11px;
                font-weight:800;
                padding:3px 10px;
                border-radius:20px;
            }
            .card-body{
                padding:18px;
            }
            .card-body h3{
                font-size:16px;
                margin-bottom:6px;
            }
            .specs{
                color:var(--dim);
                font-size:12px;
                margin-bottom:4px;
            }
            .desc{
                color:var(--dim);
                font-size:11px;
                margin-bottom:14px;
            }
            .price-row{
                display:flex;
                justify-content:space-between;
                align-items:center;
            }
            .price{
                font-size:20px;
                font-weight:700;
                color:var(--primary);
            }
            .buy-btn{
                background:var(--primary);
                border:none;
                padding:8px 14px;
                border-radius:8px;
                font-weight:700;
                cursor:pointer;
                transition:.3s;
                font-size:13px;
            }
            .buy-btn:hover{
                background:#fff;
                transform:scale(1.05);
            }

            /* ===== TOAST ===== */
            .toast{
                position:fixed;
                bottom:28px;
                left:50%;
                transform:translateX(-50%) translateY(20px);
                background:var(--card);
                border:1px solid var(--primary);
                padding:12px 24px;
                border-radius:10px;
                font-size:14px;
                z-index:3000;
                opacity:0;
                transition:.3s;
                pointer-events:none;
            }
            .toast.show{
                transform:translateX(-50%) translateY(0);
                opacity:1;
            }

            /* ===== BADGE DESC ===== */
            .badge-desc{
                display:inline-block;
                background:rgba(61,224,208,.1);
                border:1px solid var(--primary);
                color:var(--primary);
                font-size:11px;
                padding:2px 8px;
                border-radius:20px;
                margin-bottom:8px;
            }
        </style>
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
                    <div class="nav-action-item" onclick="window.location = 'login.html'">
                        <span>👤 Mi Cuenta</span>
                    </div>
                    <div class="nav-action-item cart-btn" onclick="toggleCart()">
                        <span>🛒 Mi Carrito</span>
                        <span class="cart-badge" id="cart-count">0</span>
                    </div>
                </div>
            </div>

            <div class="category-bar">
                <div class="cat-links">
                    <a href="index.html">Inicio</a>
                    <a href="productos.html" class="active">Productos</a>
                    <a href="categorias.html">Categorías</a>
                    <a href="nosotros.html">Nosotros</a>
                </div>
            </div>
        </header>

        <!-- CARRITO SIDEBAR | carrito.jsp -->
        <div class="cart-overlay" id="cart-overlay">
            <div class="cart-head">
                <h2>🛒 Carrito (<span id="cart-side-count">0</span>)</h2>
                <div class="close-cart" onclick="toggleCart()">✕</div>
            </div>
            <div class="cart-body" id="cart-items"></div>
            <div class="cart-foot">
                <div class="total-row"><span>Total:</span><span id="cart-total">$0</span></div>
                <button class="checkout-btn" onclick="enviarCarrito()">Ir al pago →</button>            </div>
        </div>

        <!-- CONTENIDO | productos.jsp -->
        <div class="main">
            <div class="page-top">
                <h1 class="section-title">🖥️ Productos</h1>
                <span class="results-count" id="result-count">20 productos</span>
            </div>

            <!-- Filtros rápidos por categoría -->
            <div class="top-filters">
                <button class="filter-btn active" data-cat="all" onclick="filterCat('all', this)">Todos</button>
                <button class="filter-btn" data-cat="pc-gamer" onclick="filterCat('pc-gamer', this)">💻 PC Gamer</button>
                <button class="filter-btn" data-cat="laptop" onclick="filterCat('laptop', this)">💻 Laptops</button>
                <button class="filter-btn" data-cat="monitor" onclick="filterCat('monitor', this)">🖥️ Monitores</button>
                <button class="filter-btn" data-cat="escritorio" onclick="filterCat('escritorio', this)">🪑 Escritorios</button>
                <button class="filter-btn" data-cat="accesorios" onclick="filterCat('accesorios', this)">🖱️ Accesorios</button>
                <button class="filter-btn" data-cat="antivirus" onclick="filterCat('antivirus', this)">🛡️ Antivirus</button>
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

                            <span class="tag">Popular</span>
                            <div class="card-img">🖥️</div>
                            <div class="card-body">
                                <h3>${p.titulo}</h3>
                                <p class="specs">${p.descripcion}</p>
                                <p class="desc">-</p>
                                <div class="price-row">
                                    <span class="price">$${p.precio}</span>
                                    <button class="buy-btn"
                                            onclick="addToCart(this)"
                                            data-id="${p.idproducto}"
                                            data-name="${p.titulo}"
                                            data-price="${p.precio}"
                                            data-stock="${p.cantidad}">
                                        🛒 Agregar
                                    </button>
                                </div>
                            </div>
                        </div>


                    </c:forEach>
                </div>


            </div>
        </div>

        <!-- TOAST -->
        <div class="toast" id="toast"></div>


    </body>

    <script>
        // Antes de enviar el formulario, ponemos el carrito en el input oculto
       
        function enviarCarrito() {
            const cartJson = JSON.stringify(cart); // cart es tu array de JS

            // Usando POST con fetch
            fetch('PagosServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: cartJson
            })
                    .then(res => res.text())
                    .then(data => console.log("Respuesta del servidor:", data))
                    .catch(err => console.error(err));
        }
    </script>
    <script>
        let cart = JSON.parse(localStorage.getItem("cart") || "[]");

// Agregar al carrito desde JSP
        function addToCart(btn) {
            const id = btn.dataset.id;
            const name = btn.dataset.name;
            const price = parseFloat(btn.dataset.price);
            const stock = parseInt(btn.dataset.stock);

            const ex = cart.find(x => x.id == id);
            if (ex) {
                if (ex.qty >= stock) {
                    showToast("Stock máximo alcanzado 🚫");
                    return;
                }
                ex.qty++;
            } else {
                cart.push({id, name, price, qty: 1, stock, emoji: "🖥️"});
            }

            saveCart();
            updateCartUI();
            showToast("¡" + name + " agregado! 🛒");
            if (!document.getElementById("cart-overlay").classList.contains("open"))
                toggleCart();
        }

        function changeQty(i, d) {
            let item = cart[i];
            if (d === 1 && item.qty >= item.stock) {
                alert("No hay más stock");
                return;
            }
            if (d === -1 && item.qty <= 1) {
                alert("Mínimo es 1");
                return;
            }
            item.qty += d;
            saveCart();
            updateCartUI();
        }

        function removeItem(i) {
            cart.splice(i, 1);
            saveCart();
            updateCartUI();
        }

        function saveCart() {
            localStorage.setItem("cart", JSON.stringify(cart));
        }

        function updateCartUI() {
            const total = cart.reduce((a, x) => a + Number(x.price) * x.qty, 0);
            const count = cart.length; // <-- ahora cuenta productos distintos

            const cartCount = document.getElementById("cart-count");
            const cartSideCount = document.getElementById("cart-side-count");
            const cartTotal = document.getElementById("cart-total");
            const cartItems = document.getElementById("cart-items");
            if (!cartCount || !cartSideCount || !cartTotal || !cartItems)
                return;

            cartCount.innerText = count;
            cartSideCount.innerText = count;
            cartTotal.innerText = "$" + total.toLocaleString();

            if (cart.length === 0) {
                cartItems.innerHTML = '<p style="color:var(--dim);text-align:center;padding:40px 0;">Tu carrito está vacío</p>';
                return;
            }

            let html = "";
            cart.forEach((item, i) => {
                html += '\
        <div class="cart-item">\
            <div class="ci-img">' + (item.emoji || "🖥️") + '</div>\
            <div class="ci-info" style="flex:1;">\
                <h4>' + item.name + '</h4>\
                <p>$' + Number(item.price).toLocaleString() + '</p>\
                <div class="ci-controls">\
                    <button class="qty-btn" onclick="changeQty(' + i + ',-1)">−</button>\
                    <span>' + item.qty + '</span>\
                    <button class="qty-btn" onclick="changeQty(' + i + ',1)">+</button>\
                    <span style="margin-left:auto;color:var(--primary);font-weight:700;">$' + (Number(item.price) * item.qty).toLocaleString() + '</span>\
                </div>\
            </div>\
            <span style="cursor:pointer;font-size:16px;" onclick="removeItem(' + i + ')">🗑️</span>\
        </div>';
            });

            cartItems.innerHTML = html;
        }

        function toggleCart() {
            document.getElementById("cart-overlay").classList.toggle("open");
        }

        function showToast(msg) {
            const t = document.getElementById("toast");
            t.innerText = msg;
            t.classList.add("show");
            setTimeout(() => t.classList.remove("show"), 2800);
        }

// Inicializar carrito al cargar
        updateCartUI();
    </script>
</html>
