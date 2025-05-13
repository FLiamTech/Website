<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import= "com.productos.negocio.*" import="com.productos.login.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mate y sus repuestos</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    <style>
        select, table {
            margin-top: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #999;
            padding: 10px;
            text-align: left;
        }
        .contenedor {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <main>
        <header>
            <h1>Mate y sus repuestos</h1>
            <h2 class="destacado">Repuestos de todo tipo</h2>
            <h4 id="favorito">Dar un mantenimiento regular a sus vehículos</h4>
        </header>

        <nav>
            <a class="active" href="consulta.jsp">Ver Productos</a>
            <a href="registro.jsp">Login</a>
            <a href="categoria.jsp">Categoria</a>
        </nav>

			<div class="contenedor-categorias">
			    <h1>Categorías de productos</h1>
			
			    <form method="GET" action="" class="formulario-categoria">
			        <div class="form-control">
			            <label for="cmbCategoria">Selecciona una categoría:</label>
			            <%
			                Categoria cat = new Categoria();
			                out.print(cat.mostrarCategoria());  // combo <select>
			            %>
			        </div>
			
			        <div class="form-control">
			            <input type="submit" value="Filtrar productos" class="btn-filtrar">
			        </div>
			    </form>
			
			    <div class="resultados-productos">
			        <%
			            String categoriaSeleccionada = request.getParameter("cmbCategoria");
			            Product pr = new Product();
			
			            if (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty()) {
			                out.print(pr.buscarProductoCategoria(Integer.parseInt(categoriaSeleccionada)));
			            } else {
			                out.print(pr.consultarTodo());
			            }
			        %>
			    </div>
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