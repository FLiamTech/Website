<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.login.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String nombre = request.getParameter("usuario");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("txtEmail");
    String clave = "54321";
    int estado = Integer.parseInt(request.getParameter("cmbECivil"));
    int perfil = Integer.parseInt(request.getParameter("cmbPerfil"));

    Usuario usuario = new Usuario();
    usuario.setNombre(nombre);
    usuario.setCedula(cedula);
    usuario.setCorreo(correo);
    usuario.setClave(clave); // Asegúrate de encriptar la clave antes de almacenarla
    usuario.setEstado(estado);
    usuario.setPerfil(perfil);

    String mensaje = "";
    
    if (perfil == 2) { // Cliente
        mensaje = usuario.ingresarCliente(); // Llama al método para ingresar cliente
    } else if (perfil == 3) { // Vendedor (Empleado)
        mensaje = usuario.ingresarEmpleado(); // Llama al método para ingresar empleado
    }

    out.println("<p>" + mensaje + "</p>");
%>
