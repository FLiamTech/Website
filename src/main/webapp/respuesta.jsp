<%@page import="com.productos.login.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultado del Registro</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String estadoCivil = request.getParameter("cmbECivil");
    String residencia = request.getParameter("rdResidencia");
    String correo = request.getParameter("txtEmail");
    String clave = request.getParameter("txtClave");
    
    // Crear un objeto Usuario
    Usuario nuevoUsuario = new Usuario();
    nuevoUsuario.setNombre(nombre);
    nuevoUsuario.setCedula(cedula);
    nuevoUsuario.setCorreo(correo);
    nuevoUsuario.setClave(clave);

    // Interpretar estado civil como estado (ajustar según tus reglas)
    try {
        int estado = Integer.parseInt(estadoCivil);
        nuevoUsuario.setEstado(estado);
    } catch (NumberFormatException e) {
        nuevoUsuario.setEstado(1); // Por defecto Casado
    }

    // Guardar en la base de datos como cliente
    String resultado = nuevoUsuario.ingresarCliente();
%>

<h2 class="registro">Resultado del Registro</h2>
<p class="registro"><strong><%= resultado %></strong></p>

<div class="registro-cliente">
            <p><strong>Nombre:</strong> <%= request.getParameter("txtNombre") %></p>
            <p><strong>Cédula:</strong> <%= request.getParameter("txtCedula") %></p>
            <p><strong>Correo Registrado:</strong> <%= request.getParameter("txtEmail") %></p>
            <p><strong>Estado Civil:</strong> <%= request.getParameter("cmbECivil") %></p>
            <p><strong>Lugar de Residencia:</strong> <%= request.getParameter("rdResidencia") %></p>
            <p><strong>Mes y Año de Nacimiento:</strong> <%= request.getParameter("fecha") %></p>
            <p><strong>Color Favorito:</strong> 
                <span style="color:<%= request.getParameter("colorFavorito") %>;">Este es tu color favorito</span>
            </p>
            <p><strong>Archivo Subido:</strong> <%= request.getParameter("fileFoto") %></p>
        </div>
<div class="registro">
	<a href="index.jsp">Volver al inicio</a>
</div>

</body>
</html>
