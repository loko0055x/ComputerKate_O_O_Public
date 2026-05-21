<%-- 
    Document   : carrito
    Created on : Apr 4, 2026, 7:36:52 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Carrito Simple</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                gap: 40px;
                padding: 20px;
            }
            .productos, .carrito {
                width: 300px;
            }
            .producto {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 10px;
            }
            button {
                background: #28a745;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
            }
            .carrito {
                border-left: 2px solid #000;
                padding-left: 20px;
            }
        </style>
    </head>
    <body>

        <!-- PRODUCTOS -->
        <div class="productos">
            <h2>Productos</h2>
            <div class="producto"> <p>Producto 1 - $10 - Stock: <span id="stock1">5</span></p> <button onclick="agregarProducto('Producto 1', 10, 'stock1', 5)">Agregar</button> </div> <div class="producto"> <p>Producto 2 - $15 - Stock: <span id="stock2">3</span></p> <button onclick="agregarProducto('Producto 2', 15, 'stock2', 3)">Agregar</button> </div> <div class="producto"> <p>Producto 3 - $20 - Stock: <span id="stock3">4</span></p> <button onclick="agregarProducto('Producto 3', 20, 'stock3', 4)">Agregar</button> </div> <div class="producto"> <p>Producto 4 - $25 - Stock: <span id="stock4">2</span></p> <button onclick="agregarProducto('Producto 4', 25, 'stock4', 2)">Agregar</button> </div> <div class="producto"> <p>Producto 5 - $30 - Stock: <span id="stock5">6</span></p> <button onclick="agregarProducto('Producto 5', 30, 'stock5', 6)">Agregar</button> </div>
        </div>

        <!-- CARRITO -->
        <div class="carrito">
            <h2>Carrito</h2>
            <ul id="listaCarrito"></ul>
            <h3>Total: $<span id="total">0</span></h3>
            <button onclick="borrartodo()">Vaciar Carrito</button>      
            <button onclick="irservlet()">Ir servlet</button>
        </div>

        <script>
            
            let carrito = [];
            let total = 0;
            
            // Cargar carrito desde localStorage
            if (localStorage.getItem("carrito")) {
                carrito = JSON.parse(localStorage.getItem("carrito"));
                actualizarTotal();
                mostrarCarrito();
            }
            
            function agregarProducto(nombre, precio, namestock, stockmaximo) {
                if (!nombre || precio <= 0) {
                    alert("Datos inválidos");
                    return;
                }
                
                let pos = getIndexByName(nombre);
                
                if (pos === -1) {
                    let subtotal = precio * 1;
                    
                    carrito.push({
                        nombre: nombre,
                        precio: precio,
                        namestock: namestock,
                        stock: 1,
                        stockmaximo: stockmaximo,
                        subtotal: subtotal,
                    });
                    
                    actualizarTotal();
                    localStorage.setItem("carrito", JSON.stringify(carrito));
                    mostrarCarrito();
                } else {
                    
                    let stockmaximo = carrito[pos].stockmaximo;
                    let stockactual = carrito[pos].stock;
                    
                    actualizarstock(
                            pos,
                            stockactual,
                            stockmaximo,
                            carrito,
                            );
                    
                    localStorage.setItem("carrito", JSON.stringify(carrito));
                    
                    actualizarTotal();
                    mostrarCarrito();
                }
            }
            
            function getIndexByName(nombre) {
                let n = -1;
                
                for (let i = 0; i < carrito.length; i++) {
                    if (carrito[i].nombre === nombre) {
                        n = i;
                        break;
                    }
                }
                
                return n;
            }
            
            function actualizarstock(pos, stock, stockmaximo) {
                let stockactual = stock + 1;
                
                if (stockactual <= stockmaximo) {
                    carrito[pos].stock = stockactual;
                    carrito[pos].subtotal = stockactual * carrito[pos].precio;
                }
                
                
            }
            
            function mostrarCarrito() {
                const lista = document.getElementById("listaCarrito");
                
                lista.innerHTML = "";
                
                for (let i = 0; i < carrito.length; i++) {
                    const li = document.createElement("li");
                    
                    li.textContent =
                            carrito[i].nombre + " - $" + carrito[i].precio + " x " + carrito[i].stock;
                    const btnEliminar = document.createElement("button");
                    btnEliminar.innerHTML = "🗑️"; // ícono de basura
                    btnEliminar.title = "Eliminar";
                    btnEliminar.style.marginLeft = "10px";
                    btnEliminar.onclick = () => {
                        borrarProducto(carrito[i].nombre);
                    };
                    
                    li.appendChild(btnEliminar);
                    lista.appendChild(li);
                }
                
                document.getElementById("total").textContent = total;
            }
            
            function actualizarTotal() {
                total = 0;
                
                for (let i = 0; i < carrito.length; i++) {
                    total += carrito[i].subtotal;
                }
            }
            
            function borrartodo() {
                if (localStorage.getItem("carrito")) {
                    carrito = [];
                    total = 0;
                    
                    localStorage.removeItem("carrito");
                    mostrarCarrito();
                }
            }
            
            function borrarProducto(nombre) {
                const index = getIndexByName(nombre)
                if (index !== -1) {
                    carrito.splice(index, 1);
                    localStorage.setItem("carrito", JSON.stringify(carrito));
                    actualizarTotal();
                    mostrarCarrito();
                }
            }
            
            function  irservlet() {
                // Obtener carrito del localStorage
                
                console.log(carrito);
                // Enviar al servlet vía POST
                fetch('CarritoCompras', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                     body: JSON.stringify(carrito) // ← CLAVE: esto convierte a JSON string
                })
                        .then(response => response.text())
                        .then(data => {
                            console.log('Respuesta del servlet:', data);
                        })
                        .catch(error => console.error('Error:', error));
            }
            
        </script>

    </body>
</html>