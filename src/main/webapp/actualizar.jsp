<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.negocio.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actualizar Stock</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	Product producto = new Product();
	Categoria cat = new Categoria ();
    String id = request.getParameter("id");
    int cantidad= -1;
    String nombre = "";
    double precio = -0.1;
    int id_cat = -1;
    String categoria = "";
    if (id != null && producto.obtenerProductoPorId(id)) {
        cantidad = producto.getCantidad();
        precio = producto.getPrecio();
        nombre = producto.getNombre();
        id_cat = producto.getId_categoria();
        categoria = cat.nombreCat(id_cat);
    }
    String mensaje = "";
	if ("POST".equalsIgnoreCase(request.getMethod())) {
	    try {
	        String nuevoNombre = request.getParameter("nombre_n");
	        int nuevaCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
	        int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad_n"));
	        double nuevoPrecio = Double.parseDouble(request.getParameter("precio_n"));

	        Product pr = new Product();
	        pr.setCantidad(nuevaCantidad);
	        pr.setNombre(nuevoNombre);
	        pr.setId_categoria(nuevaCategoria);
	        pr.setPrecio(nuevoPrecio);
	        mensaje = pr.actualizarProducto(id);
	    } catch (Exception e) {
	        mensaje = "Error al actualizar: " + e.getMessage();
	    }
	}
%>

	<h2>Datos actuales acerca del producto</h2>
	<div class="registro-cliente">
		<p><strong>Nombre actual: </strong><%=nombre%></p>
		<p><strong>Cantidad actual: </strong><%=cantidad %></p>
		<p><strong>Precio actual: </strong><%=precio %></p>
		<p><strong>Categoria: </strong><%=categoria %></p>
		<p><strong>ID: </strong><%=id %></p>
	</div>
		
    <div class="agrupar-productos">
        <section class="form-box-products">
            <h2>Actualizar Producto</h2>
            <form method="post">
            	<input type="hidden" name="id" value="<%= id %>">
            	<div class="form-group">
            		<label for="nombre_n">Nuevo Nombre</label>
    				<input type="text" id="nombre_n" name="nombre_n" required>
            	</div>
            	<div>
            		<label for="cmbCategoria" class="mensaje">Nueva Categoria</label>
            		<%
            			out.print (cat.mostrarCategoria());
            		%>
            	</div>
                <div class="form-group">
                    <label for="cantidad_n">Nueva Cantidad</label>
                    <input type="number" id="cantidad_n" name="cantidad_n" required min="0" step="1">
                </div>
                <div class="form-group">
            		<label for="precio_n">Nuevo Precio</label>
    				<input type="number" id="precio_n" name="precio_n" required min="0" step="0.1">
            	</div>
                <div class="form-buttons">
                    <button type="submit">Aceptar</button>
                    <button type="button" onclick="window.location.href='productos.jsp'">Cancelar</button>
                </div>
            </form>
            <% if (!mensaje.equals("")) { %>
                <p class="mensaje"><strong><%= mensaje %></strong></p>
                <a href="productos.jsp">Volver</a>
            <% } %>
        </section>
    </div>
</body>
</html>