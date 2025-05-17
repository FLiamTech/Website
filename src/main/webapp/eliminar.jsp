<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.negocio.*"
    pageEncoding="UTF-8"%>
<%
	Product eliminarPr = new Product ();
	String id = request.getParameter("id");
	if (id != null) {
	    eliminarPr.eliminarProducto(id);
	    response.sendRedirect("productos.jsp");
	    return;
	}
%>