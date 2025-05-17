<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.negocio.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingreso de productos</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<%	
	// Extremos los datos de cada producto agregado
	String nombre = request.getParameter ("nombre");
	String categoria = request.getParameter ("cmbCategoria");
	int cantidad = Integer.parseInt(request.getParameter("cantidad"));
	double precio = Double.parseDouble(request.getParameter("precio"));
	
	Product nuevoProducto = new Product ();
	nuevoProducto.setNombre(nombre);
	try
	{
		int estado = Integer.parseInt(categoria);
		nuevoProducto.setId_categoria(estado);	
	} catch (NumberFormatException e) {
		nuevoProducto.setId_categoria(1);
	}
	nuevoProducto.setCantidad(cantidad);
	nuevoProducto.setPrecio(precio);
	
	String resultado = nuevoProducto.agregarProducto();
%>
	<h2>Datos del producto</h2>
	<p class="registro"><strong><%= nombre %></strong></p>
	<div class="registro-cliente">
		<p><strong>Nombre:</strong><%= request.getParameter ("nombre") %></p>
		<p><strong>Categoria:</strong><%= request.getParameter ("cmbCategoria") %></p>
		<p><strong>Cantidad:</strong><%= request.getParameter ("cantidad") %></p>
		<p><strong>Precio:</strong><%= request.getParameter ("precio") %></p>
	</div>
	<div class="registro">
		<a href="productos.jsp">Volver al inicio</a>
	</div>
</body>
</html>