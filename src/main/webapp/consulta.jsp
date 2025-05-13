<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import= "com.productos.negocio.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mate y sus repuestos</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>    
    <main>
        <header>
        	<a href="index.jsp">
                <img src="images/logo2.png" alt="Inicio - Mate y sus repuestos" width="80" height="80" class="logo-header"/>
            </a>
            <h1>Mate y sus repuestos</h1>
            <h2 class="destacado">Repuestos de todo tipo</h2>
            <h4 id="favorito">Dar un mantenimiento regular a sus vehículos</h4>
        </header>

        <nav>
            <a class="active" href="consulta.jsp">Ver Productos</a>
            <a href="registro.jsp">Login</a>
            <a href="categoria.jsp">Categoria</a>
        </nav>

        <div class="agrupar">
            <section>
                		<h3>Catalogo Productos</h3>
		<% 
			Product pr = new Product ();
			out.print(pr.consultarTodo());
		%>
            </section>

            <aside>
                <a href="https://www.linkedin.com/in/fabian-liam-a3b5b235b/" target="_blank" rel="noopener noreferrer">
                    Ver más información sobre los desarrolladores
                </a>
                <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1Shi2EO4QsKKZSgoJ7D8D9EbAb2I474g&ehbc=2E312F"
                        width="200" height="200" title="Ubicación de la empresa">
                </iframe>
            </aside>
        </div>

        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/facebook_icono.png" width="40" height="40" alt="Facebook"/>
                </a></li>
                <li><a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/instagram_icono.png" width="40" height="40" alt="Instagram"/>
                </a></li>
                <li><a href="https://www.tiktok.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/tiktok_icono.png" width="40" height="40" alt="TikTok"/>
                </a></li>
                <li><a href="https://www.x.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/x_icono.png" width="40" height="40" alt="X (Twitter)"/>
                </a></li>
            </ul>
        </footer>
    </main>
</body>
</html>
