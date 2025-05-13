<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.productos.login.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrador</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<% 
    String usuario; 
    HttpSession sesion = request.getSession(); 
    if (sesion.getAttribute("usuario") == null)   //Se verifica si existe la variable      
    { 
     %> 
     <jsp:forward page="iniciarSesion.jsp"> 
     <jsp:param name="error" value="Debe registrarse en el sistema."/> 
     </jsp:forward> 
     <% 
    } 
    else 
    { 
    usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos 
    int perfil=(Integer)sesion.getAttribute("perfil"); 
    %> 
<body>
	<main>
        <header>
            <h1>Mate y sus repuestos</h1>
            <h2 class="destacado">Repuestos de todo tipo</h2>
            <h4 id="favorito">Dar un mantenimiento regular a sus vehículos</h4>
        </header>

        <nav>
            <% 
 				pagina pag=new pagina(); 
 				String menu=pag.mostrarMenu(perfil); 
 				out.print(menu); 
 				%>
        </nav>

        <div class="agrupar">
            <section class="form-box">
                <h2>Registrar Empleado</h2>
                <form action="agregarEmpleado.jsp" method="post">
                    <div class="form-group">
                        <label for="usuario">Nombres Y Apellidos:</label>
                        <input type="text" id="usuario_e" name="usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="cedula">Cedula:</label>
                        <input type="text" id="cedula_e" name="cedula" required>
                    </div>
                    <div class="form-group">
                    	<label for="cmbPerfil">Tipo de perfil</label>
                    	<select name="cmbPerfil" id="cmbPerfil">
                    		<option value="1">Administrador</option>
                    		<option value="3">Vendedor</option>
                    	</select>
                    </div>
                    <div class="form-group">
                    <label for="cmbECivil">Estado Civil:</label>
                    <select name="cmbECivil" id="cmbECivil">
                        <option value="2">Soltero</option>
                        <option value="1">Casado</option>
                        <option value="3">Divorciado</option>
                        <option value="4">Viudo</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Correo Electrónico:</label>
                    <input type="email" name="txtEmail" id="txtEmail" required>
                </div>
                <div class="form-buttons">
                    <button type="submit" id="btnEnviar">Registrar</button>
                    <button type="reset">Limpiar</button>
                </div>
                </form>
            </section>

            <aside>
                <a href="https://www.linkedin.com/in/fabian-liam-a3b5b235b/" target="_blank" rel="noopener noreferrer">
                    Ver más información sobre los desarrolladores
                </a>
                <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1Shi2EO4QsKKZSgoJ7D8D9EbAb2I474g&ehbc=2E312F"
                        title="Ubicación de la empresa">
                </iframe>
            </aside>
        </div>

        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/facebook_icono.png" width="40" height="40" alt="Facebook"/>
                </a></li>
                <li><a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/instagram_icono.png" width="40" height="40" alt="Instagram"/>
                </a></li>
                <li><a href="https://www.tiktok.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/tiktok_icono.png" width="40" height="40" alt="TikTok"/>
                </a></li>
                <li><a href="https://www.x.com" target="_blank" rel="noopener noreferrer">
                    <img src="iconos/x_icono.png" width="40" height="40" alt="X (Twitter)"/>
                </a></li>
            </ul>
        </footer>
    </main>
</body>
<%}%>
</html>