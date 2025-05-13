<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" import="com.productos.login.*"%> 

<% 
    Usuario usuario = new Usuario(); 
    String nlogin = request.getParameter("usuario"); 
    String nclave = request.getParameter("contrasena"); 
    String mensaje = "";
    HttpSession sesion = request.getSession(); // Se crea la variable de sesión 
    boolean respuesta = usuario.verificarUsuario(nlogin, nclave); 
    
    if (respuesta) { 
        sesion.setAttribute("usuario", usuario.getCorreo()); // Se añade atributo usuario 
        sesion.setAttribute("perfil", usuario.getPerfil()); // Se añade atributo perfil 
        sesion.setAttribute("contrasena", usuario.getClave());
        response.sendRedirect("menu.jsp"); // Se redirecciona a una página específica
    } else { 
        mensaje = "Clave o Usuario incorrecto. Por favor, intente nuevamente.";
        request.setAttribute("error", mensaje); // Guardamos el mensaje de error en un atributo
        request.getRequestDispatcher("registro.jsp").forward(request, response); // Enviamos el control a la página de login
    }
%>
