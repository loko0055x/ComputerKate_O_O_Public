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
        <title>PC Gamer Store | Iniciar Sesión</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="resources/static/estilos/login.css">  

    </head>
    <body>
        <%

            if (session.getAttribute("usuario") != null) {
                response.sendRedirect("Pagos.jsp"); // Cambia 'login.jsp' por la URL de la página que desees

            }
        %>

         
        

        <!-- CONTENIDO | login.jsp / registro.jsp -->
        <div class="auth-page">
            <div class="auth-wrap">
                <div class="brand">
                    <div class="b-icon">🖥️</div>
                    <h1>PC Gamer Store</h1>
                    <p>Accede a tu cuenta para continuar</p>
                </div>

                <div class="tab-btns">
                    <button class="tab-btn active" id="tab-login" onclick="switchTab('login')">Iniciar Sesión</button>
                    <button class="tab-btn" id="tab-registro" onclick="switchTab('registro')">Crear Cuenta</button>
                </div>

                <!-- ALERTA -->
                <div class="alert" id="alert-msg"></div>

                <div class="auth-card">

                    <!-- PANEL LOGIN | JSP: action="/login" method="POST" -->
                    <div id="login-panel">
                        <form id="login-form" action="LoginServlet"  method="post">
                            <div class="form-group">
                                <label for="login-email">Email</label>
                                <div class="input-wrap">
                                    <span class="i-icon">📧</span>
                                    <input type="text" id="login-email" name="email" placeholder="tu@email.com" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login-pass">Contraseña</label>
                                <div class="input-wrap">
                                    <span class="i-icon">🔒</span>
                                    <input type="password" id="login-pass" name="password" placeholder="••••••••" required>
                                    <span class="password-toggle" onclick="togglePass('login-pass')">👁️</span>
                                </div>
                            </div>
                            <div class="forgot"><a href="#">¿Olvidaste tu contraseña?</a></div>
                            <button type="submit" class="submit-btn">Iniciar Sesión →</button>
                        </form>
                        <div class="divider"><hr><span>o continúa con</span><hr></div>
                        <div class="social-logins">
                            <button class="social-login-btn">🔵 Google</button>
                            <button class="social-login-btn">⚫ Facebook</button>
                        </div>
                        <div class="auth-footer">¿No tienes cuenta? <a href="#" onclick="switchTab('registro')">Regístrate gratis</a></div>
                    </div>

                    <!-- PANEL REGISTRO | JSP: action="/registro" method="POST" -->
                    <div id="registro-panel" style="display:none;">
                        <form id="registro-form"    method="post" action="crearcuenta">
                            <div class="form-row" style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                                <div class="form-group" style="margin-bottom:0;">
                                    <label>Nombre</label>
                                    <div class="input-wrap">
                                        <span class="i-icon">👤</span>
                                        <input type="text" name="nombre" placeholder="Juan" required>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom:0;">
                                    <label>Apellido</label>
                                    <div class="input-wrap">
                                        <span class="i-icon">👤</span>
                                        <input type="text" name="apellido" placeholder="Pérez" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top:16px;">
                                <label>Email</label>
                                <div class="input-wrap">
                                    <span class="i-icon">📧</span>
                                    <input type="text" name="email" placeholder="tu@email.com" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Teléfono</label>
                                <div class="input-wrap">
                                    <span class="i-icon">📱</span>
                                    <input type="tel" name="telefono" placeholder="+51 999 999 999">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Contraseña</label>
                                <div class="input-wrap">
                                    <span class="i-icon">🔒</span>
                                    <input type="password" id="reg-pass" name="password" placeholder="Mínimo 8 caracteres" required >
                                    <span class="password-toggle" onclick="togglePass('reg-pass')">👁️</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Confirmar contraseña</label>
                                <div class="input-wrap">
                                    <span class="i-icon">🔒</span>
                                    <input type="password" id="reg-pass2" name="password2" placeholder="Repite tu contraseña" required>
                                </div>
                            </div>
                            <button type="submit" class="submit-btn">Crear mi cuenta →</button>
                            <div class="terms">Al registrarte aceptas nuestros <a href="#">Términos de Uso</a> y <a href="#">Política de Privacidad</a></div>
                        </form>
                        <div class="auth-footer" style="margin-top:16px;">¿Ya tienes cuenta? <a href="#" onclick="switchTab('login')">Inicia sesión</a></div>
                    </div>

                </div><!-- end auth-card -->

                <!-- Beneficios de registrarse -->
                <div class="benefits" id="benefits-login">
                    <div class="benefit"><div class="b-i">🚚</div><p>Envío gratis en tu primer pedido</p></div>
                    <div class="benefit"><div class="b-i">🎮</div><p>Ofertas exclusivas para miembros</p></div>
                    <div class="benefit"><div class="b-i">🔔</div><p>Alertas de stock y nuevos productos</p></div>
                    <div class="benefit"><div class="b-i">🏆</div><p>Programa de puntos y recompensas</p></div>
                </div>
            </div>
        </div>

        <script>
            function switchTab(tab) {
                document.getElementById("login-panel").style.display =
                        tab === "login" ? "block" : "none";
                document.getElementById("registro-panel").style.display =
                        tab === "registro" ? "block" : "none";
                document
                        .getElementById("tab-login")
                        .classList.toggle("active", tab === "login");
                document
                        .getElementById("tab-registro")
                        .classList.toggle("active", tab === "registro");
                hideAlert();
            }

            function togglePass(id) {
                const input = document.getElementById(id);
                input.type = input.type === 'password' ? 'text' : 'password';
            }

            function showAlert(msg, type) {
                const a = document.getElementById('alert-msg');
                a.innerText = msg;
                a.className = 'alert ' + type;
                a.style.display = 'block';
            }

            function hideAlert() {
                document.getElementById('alert-msg').style.display = 'none';
            }

            function handleLogin(e) {
                e.preventDefault();
                // JSP: Eliminar esto y usar acción del Servlet /LoginServlet
                showAlert('✅ Sesión iniciada correctamente. Redirigiendo...', 'success');
                setTimeout(() => window.location.href = 'index.html', 1500);
            }

            function handleRegistro(e) {
                e.preventDefault();
                const p1 = document.getElementById('reg-pass').value;
                const p2 = document.getElementById('reg-pass2').value;
                if (p1 !== p2) {
                    showAlert('❌ Las contraseñas no coinciden.', 'error');
                    return;
                }
                // JSP: Eliminar esto y usar acción del Servlet /RegistroServlet
                showAlert('✅ Cuenta creada exitosamente. ¡Bienvenido!', 'success');
                setTimeout(() => window.location.href = 'index.html', 1500);
            }
        </script>
    </body>
</html>
