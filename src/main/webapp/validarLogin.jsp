<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" session="true" import="com.productos.login.*"%> 
 
<% 
Usuario usuario=new Usuario(); 
String nlogin=request.getParameter("usuario"); 
String nclave=request.getParameter("contrasena"); 
 
HttpSession sesion=request.getSession();  //Se crea la variable de sesi�n 
boolean respuesta=usuario.verificarUsuario(nlogin,nclave); 
if (respuesta) 
{ 
 sesion.setAttribute("usuario", usuario.getCorreo()); //Se a�ade atributo usuario 
 sesion.setAttribute("perfil", usuario.getPerfil());  //Se a�ade atributo perfil 
 sesion.setAttribute("contrasena", usuario.getClave());
 response.sendRedirect("menu.jsp");  //Se redirecciona a una p�gina espec�fica 
} 
else 
{ 
 %> 
 <jsp:forward page="registro.jsp"> 
 <jsp:param name="error" value="Datos incorrectos.<br/>Vuelva a intentarlo."/> 
 </jsp:forward> 
 <% 
} 
%>