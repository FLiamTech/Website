<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>¡Estamos en mantenimiento!</title>
    <!-- Enlazamos el archivo CSS -->
    <link href="css/estilos2.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%
    out.print ("Su nombre es " + request.getParameter ("txtNombre") + "</br>");
    
    String cedula = request.getParameter ("txtCedula");
    String estadoCivil = request.getParameter("cmbECivil");
    String residencia = request.getParameter("rdResidencia");
    String foto = request.getParameter("foleFoto");
    String color = request.getParameter("colorFavorito");
    %>
    <%=cedula%>
    </br> Su estado civil es
    <%=estadoCivil %>
    <u><%=foto %></u>
    <strong><% out.print(request.getParameter("mFecha")); %></strong>
    <font color=<%=color%>> Este es tu color favorito</font>  
    <tr><td>Nombre </td><td> <input type="text" name="txtNombre" required />*</td></tr>
    <tr><td>Correo </td><td> <input type="email" name="txtCorreo" placeholder="usuario@nombreProveedor.dominio" /> 
</body>
</html>
