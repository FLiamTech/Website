<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mate y sus Repuestos</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <main>
        <!-- Encabezado -->
        <header>
            <a href="index.jsp">
                <img src="images/logo2.png" alt="Inicio - Mate y sus repuestos" width="80" height="80" class="logo-header"/>
            </a>
            <div class="container">
                <h1>Mate y sus Repuestos</h1>
                <h2 class="destacado">Repuestos de todo tipo para tu vehículo</h2>
                <h4 id="favorito">Da un mantenimiento regular a tus vehículos</h4>
            </div>
        </header>

        <!-- Navegación -->
        <nav>
        <nav>
            <a class="active" href="consulta.jsp">Ver Productos</a>
            <a href="registro.jsp">Login</a>
        </nav>
        </nav>

        <!-- Contenido principal -->
        <div class="agrupar">
            <section class="login-box">
                <h2>Inicio de Sesión</h2>
                <form action="validarLogin.jsp" method="post">
                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" id="usuario" name="usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contraseña:</label>
                        <input type="password" id="contrasena" name="contrasena" required>
                    </div>
                    <div class="form-buttons">
                    	<button type="submit" class="btn">Iniciar Sesión</button>
                    </div>
                    
                </form>
                <p>¿No tienes una cuenta? <a href="login.jsp">Registrarse</a></p>
            </section>

            <aside>
                <a href="https://www.linkedin.com/in/fabian-liam-a3b5b235b/" target="_blank" rel="noopener noreferrer">
                    Ver más información sobre los desarrolladores
                </a>
                <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1Shi2EO4QsKKZSgoJ7D8D9EbAb2I474g&ehbc=2E312F"
                        title="Ubicación de la empresa">
                </iframe>
            </aside>
        </div>

        <!-- Pie de página -->
        <footer>
            <ul>
                <li>
                    <a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">
                        <img src="iconos/facebook_icono.png" width="40" height="40" alt="Facebook"/>
                    </a>
                </li>
                <li>
                    <a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">
                        <img src="iconos/instagram_icono.png" width="40" height="40" alt="Instagram"/>
                    </a>
                </li>
                <li>
                    <a href="https://www.tiktok.com" target="_blank" rel="noopener noreferrer">
                        <img src="iconos/tiktok_icono.png" width="40" height="40" alt="TikTok"/>
                    </a>
                </li>
                <li>
                    <a href="https://www.x.com" target="_blank" rel="noopener noreferrer">
                        <img src="iconos/x_icono.png" width="40" height="40" alt="X (Twitter)"/>
                    </a>
                </li>
            </ul>
        </footer>
    </main>
</body>
</html>
