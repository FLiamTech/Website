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
    String id = request.getParameter("id");
    int cantidad= -1;
    if (id != null && producto.obtenerProductoPorId(id)) {
        cantidad = producto.getCantidad(); 	
    }
    String mensaje = "";

    if (request.getParameter("cantidad_n") != null && id != null) {
        try {
            int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad_n"));
            producto.setCantidad(nuevaCantidad);
            mensaje = producto.actualizarStock(id);
        } catch (Exception e) {
            mensaje = "Error al actualizar: " + e.getMessage();
        }
    }
%>
    <div class="agrupar-productos">
        <section class="form-box-products">
            <h2>Actualizar Producto</h2>
            <form method="post">
            	<div class="mensaje">
            		<p><%=cantidad%>
            	</div>
                <div class="form-group">
                    <label for="cantidad_n">Nueva Cantidad</label>
                    <input type="number" id="cantidad_n" name="cantidad_n" required min="0" step="1">
                </div>
                <div class="form-buttons">
                    <button type="submit">Aceptar</button>
                    <button type="button" onclick="window.location.href='productos.jsp'">Cancelar</button>
                </div>
            </form>
            <% if (!mensaje.equals("")) { %>
                <p><strong><%= mensaje %></strong></p>
                <a href="productos.jsp">Volver</a>
            <% } %>
        </section>
    </div>
</body>
</html>