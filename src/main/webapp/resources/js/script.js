const products = [
    {
        id: 1,
        name: "PC Gamer RGB",
        category: "pc-gamer",
        price: 999,
        specs: "Ryzen 5 | RTX 3060 | 16GB RAM | SSD 512GB",
        desc: "La bestia definitiva para gaming competitivo",
        image: "pc_gamer_rgb_cyan_neon_1773080082905.png",
        tag: "Popular"
    },
    {
        id: 2,
        name: "Gamer Pro MAX",
        category: "pc-gamer",
        price: 1799,
        specs: "Intel i7 | RTX 4070Ti | 32GB RAM | SSD 1TB",
        desc: "Potencia extrema para los más exigentes",
        image: "gamer_pro_max_desktop_1773080099385.png",
        tag: "Nuevo"
    },
    {
        id: 3,
        name: "Kit Gamer Pro",
        category: "accesorios",
        price: 149,
        specs: "Teclado mecánico | Mouse RGB | Mousepad XL",
        desc: "Todo lo que necesitas para empezar a jugar",
        image: "kit_gamer_pro_accessories_1773080116296.png",
        tag: ""
    },
    {
        id: 4,
        name: "Setup Gamer Completo",
        category: "monitor",
        price: 2499,
        specs: "Escritorio RGB | Monitor 27\" | Silla Gamer",
        desc: "Escritorio completo con iluminación RGB",
        image: "setup_gamer_completo_room_1773080135250.png",
        tag: "Oferta"
    },
    {
        id: 5,
        name: "Expert Gaming PC",
        category: "pc-gamer",
        price: 1299,
        specs: "Intel i5 | RTX 3070 | 16GB RAM | SSD 1TB",
        desc: "Equilibrio perfecto entre rendimiento y precio",
        image: "pc_gamer_rgb_cyan_neon_1773080082905.png",
        tag: ""
    },
    {
        id: 6,
        name: "Ultrawide Setup",
        category: "monitor",
        price: 3200,
        specs: "Monitor 49\" Curved | RTX 4080",
        desc: "Inmersión total en tus juegos favoritos",
        image: "setup_gamer_completo_room_1773080135250.png",
        tag: "Nuevo"
    }
];

let cart = [];

// DOM Elements
const grid = document.getElementById('products-grid');
const cartOverlay = document.getElementById('cart-overlay');
const cartItemsContainer = document.getElementById('cart-items');
const cartCount = document.getElementById('cart-count');
const cartTotal = document.getElementById('cart-total');
const checkoutTotalContainer = document.getElementById('checkout-total-val');
const checkoutSummaryIcon = document.getElementById('checkout-summary-img');
const loginModal = document.getElementById('auth-modal');

// Initial Load
document.addEventListener('DOMContentLoaded', () => {
    displayProducts(products);
    updateCart();
});

// Display Products
function displayProducts(items) {
    grid.innerHTML = items.map(product => `
        <div class="card" data-category="${product.category}">
            ${product.tag ? `<span class="tag">${product.tag}</span>` : ''}
            <div class="card-img">
                <img src="${product.image}" alt="${product.name}">
            </div>
            <div class="card-body">
                <h3>${product.name}</h3>
                <p class="specs">${product.specs}</p>
                <p class="desc">${product.desc}</p>
                <div class="price-row">
                    <span class="price">$${product.price.toLocaleString()}</span>
                    <button class="buy-btn" onclick="addToCart(${product.id})">
                        🛒 Comprar
                    </button>
                </div>
            </div>
        </div>
    `).join('');
}

// Category Filtering
function filterCategory(category, btn) {
    // Update active button
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    const filtered = category === 'all' ? products : products.filter(p => p.category === category);
    displayProducts(filtered);
}

// Cart Logic
function toggleCart() {
    cartOverlay.classList.toggle('active');
}

function addToCart(id) {
    const product = products.find(p => p.id === id);
    const inCart = cart.find(item => item.id === id);

    if (inCart) {
        inCart.qty++;
    } else {
        cart.push({ ...product, qty: 1 });
    }
    
    updateCart();
    if(!cartOverlay.classList.contains('active')) toggleCart();
}

function updateCart() {
    // Update count
    const totalItems = cart.reduce((acc, item) => acc + item.qty, 0);
    cartCount.innerText = totalItems;

    // Display items
    cartItemsContainer.innerHTML = cart.map((item, index) => `
        <div class="cart-item">
            <img src="${item.image}" alt="${item.name}">
            <div class="cart-item-info">
                <h4>${item.name}</h4>
                <p>$${item.price.toLocaleString()}</p>
                <div class="cart-item-controls">
                    <button class="qty-btn" onclick="changeQty(${index}, -1)">-</button>
                    <span>${item.qty}</span>
                    <button class="qty-btn" onclick="changeQty(${index}, 1)">+</button>
                    <span style="margin-left: auto; color: var(--primary); font-weight:700">$${(item.price * item.qty).toLocaleString()}</span>
                </div>
            </div>
            <span style="cursor:pointer; font-size: 18px" onclick="removeFromCart(${index})">🗑️</span>
        </div>
    `).join('');

    // Update total
    const total = cart.reduce((acc, item) => acc + (item.price * item.qty), 0);
    cartTotal.innerText = `$${total.toLocaleString()}`;
    
    // Update checkout if visible
    if(checkoutTotalContainer) {
        checkoutTotalContainer.innerText = `$${total.toLocaleString()}`;
        const checkoutBtn = document.getElementById('confirm-checkout-btn');
        if(checkoutBtn) checkoutBtn.innerText = `Confirmar Compra — $${total.toLocaleString()}`;
    }
}

function changeQty(index, delta) {
    cart[index].qty += delta;
    if (cart[index].qty < 1) {
        cart.splice(index, 1);
    }
    updateCart();
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

// Navigation Logic
function showSection(sectionId) {
    document.getElementById('home-section').style.display = 'none';
    document.getElementById('checkout-section').style.display = 'none';
    
    if(sectionId === 'home') {
        document.getElementById('home-section').style.display = 'block';
    } else {
        document.getElementById('checkout-section').style.display = 'block';
        window.scrollTo(0, 0);
    }
    
    // Close cart if transitioning to checkout
    if(sectionId === 'checkout') cartOverlay.classList.remove('active');
}

// Auth Modal
function toggleLogin() {
    loginModal.style.display = loginModal.style.display === 'flex' ? 'none' : 'flex';
}

// Payment Selection
function selectPayment(method, element) {
    document.querySelectorAll('.payment-method').forEach(m => m.classList.remove('active'));
    element.classList.add('active');
}

// Prevent Default Form Actions
window.addEventListener('submit', (e) => {
    e.preventDefault();
    if(e.target.id === 'login-form') {
        alert('Sesión iniciada correctamente');
        toggleLogin();
    }
    if(e.target.id === 'checkout-form') {
        alert('¡Compra realizada con éxito! Recibirás un correo de confirmación.');
        cart = [];
        updateCart();
        showSection('home');
    }
});
