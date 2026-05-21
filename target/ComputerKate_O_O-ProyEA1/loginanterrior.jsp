<%-- 
    Document   : login
    Created on : Mar 7, 2026, 8:34:39 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PC Gamer Store - Login</title>

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:Arial, Helvetica, sans-serif;
            }

            body{
                background:#050b14;
                color:white;
            }

            /* NAVBAR */

            nav{
                display:flex;
                justify-content:space-between;
                align-items:center;
                padding:15px 60px;
                border-bottom:2px solid #0ff;
            }

            .logo{
                color:#00eaff;
                font-weight:bold;
                font-size:18px;
            }

            .menu{
                display:flex;
                gap:30px;
                font-size:14px;
            }

            .menu a{
                text-decoration:none;
                color:#cfd9ff;
            }

            .menu a:hover{
                color:#00eaff;
            }

            .login-btn{
                border:1px solid #00eaff;
                padding:8px 16px;
                border-radius:20px;
                background:transparent;
                color:#00eaff;
                cursor:pointer;
            }

            /* LOGIN SECTION */

            .container{
                height:85vh;
                display:flex;
                justify-content:center;
                align-items:center;
            }

            /* CARD */

            .login-card{
                width:350px;
                padding:40px;
                background:rgba(255,255,255,0.03);
                border-radius:12px;
                border:1px solid rgba(0,255,255,0.3);
                box-shadow:0 0 20px rgba(0,255,255,0.15);
                text-align:center;
            }

            .icon{
                font-size:40px;
                color:#00eaff;
                margin-bottom:10px;
            }

            .login-card h2{
                color:#00eaff;
                margin-bottom:5px;
            }

            .login-card p{
                font-size:13px;
                color:#9db3c7;
                margin-bottom:25px;
            }

            /* INPUTS */

            .input-group{
                text-align:left;
                margin-bottom:18px;
            }

            .input-group label{
                font-size:12px;
                color:#b6c6e3;
            }

            .input-group input{
                width:100%;
                margin-top:5px;
                padding:10px;
                border-radius:6px;
                border:1px solid #1d2c3a;
                background:#0c1624;
                color:white;
                outline:none;
            }

            .input-group input:focus{
                border:1px solid #00eaff;
            }

            /* BUTTON */

            .btn-login{
                width:100%;
                padding:12px;
                border:none;
                border-radius:8px;
                background:#00eaff;
                color:#001018;
                font-weight:bold;
                cursor:pointer;
                margin-top:10px;
            }

            .btn-login:hover{
                background:#00c7d6;
            }

            /* GUEST */

            .guest{
                margin-top:15px;
                font-size:12px;
                color:#8fa3b8;
            }

            .guest span{
                color:#00eaff;
                cursor:pointer;
            }

            .error{
                color:red;
                margin-top:10px;
                font-size:13px;
            }

        </style>
    </head>

    <body>

        <nav>

            <div class="logo">💻 PC Gamer Store</div>

            <div class="menu">
                <a href="#">INICIO</a>
                <a href="#">PRODUCTOS</a>
                <a href="#">CATEGORÍAS</a>
                <a href="#">¿QUÉ VAS A JUGAR?</a>
                <a href="#">ACERCA DE NOSOTROS</a>
                <a href="#">CONTÁCTANOS</a>
            </div>

            <button class="login-btn">Iniciar Sesión</button>

        </nav>

        <div class="container">

            <div class="login-card">

                <div class="icon">🖥️</div>

                <h2>Iniciar Sesión</h2>

                <p>Ingresa para continuar con tu compra</p>

                <form id="loginForm">

                    <div class="input-group">
                        <label>Email</label>
                        <input type="text" name="email" id="email" placeholder="tu@email.com" required>
                    </div>

                    <div class="input-group">
                        <label>Contraseña</label>
                        <input type="password" name="password" id="password" placeholder="******" required>
                    </div>

                    <button type="submit" class="btn-login">Ingresar</button>

                </form>

                <div id="error" class="error"></div>

                <div class="guest">
                    ¿No tienes cuenta? <span>Continuar como invitado</span>
                </div>

            </div>

        </div>

        <script>
            document.getElementById("loginForm").addEventListener("submit", function (e) {
                e.preventDefault();  

                let email = document.getElementById("email").value.trim();
                let password = document.getElementById("password").value.trim();

                // Validación básica
                if (!email || !password) {
                    document.getElementById("error").innerText = "Por favor completa todos los campos";
                    return;
                }

                fetch("LoginServlet", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: "email=" + encodeURIComponent(email) + "&password=" + encodeURIComponent(password)
                })
                        .then(response => response.text())
                        .then(data => {
                            if (data === "ok") {
                                 window.location = "CategoriaServlet?action=getAll";
                            } else if (data === "errorSQL") {
                                 document.getElementById("error").innerText = "Error en la base de datos, intente más tarde";
                            } else {
                                 document.getElementById("error").innerText = "Email o contraseña incorrectos";
                            }
                        })
                        .catch(err => {
                            console.error("Error en fetch:", err);
                            document.getElementById("error").innerText = "Ocurrió un error al conectar con el servidor";
                        });
            });
        </script>

    </body>
</html>