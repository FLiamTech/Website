<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
    pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false); 
    if (sesion != null) {
        sesion.invalidate();
    }
    response.sendRedirect("index.jsp");
%>
