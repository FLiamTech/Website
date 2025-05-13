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

    // Depuración de los valores obtenidos
    System.out.println("Nombre: " + nombre);
    System.out.println("Cédula: " + cedula);
    System.out.println("Estado Civil: " + estadoCivil);
    System.out.println("Residencia: " + residencia);
    System.out.println("Correo: " + correo);
    System.out.println("Clave: " + clave);

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

<h2>Resultado del Registro</h2>
<p><strong><%= resultado %></strong></p>

<a href="index.jsp">Volver al inicio</a>
</body>
</html>
