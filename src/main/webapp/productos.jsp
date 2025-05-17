<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.negocio.*"
    import="com.productos.login.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<% 
    String usuario; 
	String pwd;
    HttpSession sesion = request.getSession(); 
    if (sesion.getAttribute("usuario") == null)   //Se verifica si existe la variable      
    { 
     %> 
     <jsp:forward page="iniciarSesion.jsp"> 
     <jsp:param name="error" value="Debe registrarse en el sistema."/> 
     </jsp:forward> 
     <% 
    } 
    else 
    { 
    usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos 
    int perfil=(Integer)sesion.getAttribute("perfil"); 
    %> 
    <main>
    	<header>
    		<h1>Mate y sus repuestos</h1>
            <h2 class="destacado">Repuestos de todo tipo</h2>
            <h4 id="favorito">Dar un mantenimiento regular a sus vehículos</h4>
    	</header>
    	<nav>
    		<%
    			pagina pag = new pagina ();
    			String menu = pag.mostrarMenu(perfil);
    		%>
    	</nav>
    	<div class="agrupar-productos">
    		<section class="form-box-products">
    			<h2>Gestionar Productos</h2>
    			<form action="ingresarProductos.jsp" method="get" enctype="multipart/form-data">
    				<div class="form-group">
    					<label for="nombre">Nombre</label>
    					<input type="text" id="nombre" name="nombre" required>
    				</div>
    				<div>
    					<label for="cmbCategoria">Escoja la categoria</label>
    					<%
    						Categoria cat = new Categoria ();
    						out.print (cat.mostrarCategoria());
    					%>
    				</div>
    				<div class="form-group">
    					<label for="cantidad">Cantidad</label>
    					<input type="number" id="cantidad" name="cantidad" required min="0" step="1">
    				</div>
    				<div class="form-group">
    					<label for="precio">Precio</label>
    					<input type="number" id="precio" name="precio" required min"0" step="0.1">
    				</div>
    				<div class="form-group">
                    	<label for="fileFoto">Foto:</label>
                    	<input type="file" name="fileFoto" id="fileFoto" accept=".jpg,.jpeg,.png">
                	</div>
                	<div class="form-buttons">
                	    <button type="submit" id="btnEnviar">Enviar</button>
    					<button type="reset">Borrar</button>
                	</div>

    			</form>
    		</section>
    	</div>
    	<div class="contenedor-categorias">
    		<%
    			Product pr = new Product ();
    			out.print(pr.reporteProducto());
    		%>
    	</div>
    </main>
<%}%>