<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bitacora de productos</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<%
	String usuario;
	HttpSession sesion = request.getSession ();
	if (sesion.getAttribute ("usuario") == null)
	{
	%>
	<jsp:forward page="iniciarSesion.jsp"> 
     <jsp:param name="error" value="Debe registrarse en el sistema."/> 
     </jsp:forward> 
	<%
	}
	else
	{
	usuario=(String)sesion.getAttribute("usuario"); 
	int perfil=(Integer)sesion.getAttribute("perfil"); 
	%> 
<body>
	<main>
		<header>
			<h1><%= usuario%></h1>
		</header>
	</main>
</body>
</html>
<%}%>