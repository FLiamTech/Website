<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" session="true" import="com.productos.login.*"%> 
 <head>
 <link href="css/estilos.css" rel="stylesheet" type="text/css">
 </head>
<% 
    String usuario; 
	String pwd;
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
                <h2>Cambio de clave</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label for="clave_a">Clave anterior:</label>
                        <input type="password" id="clave_a" name="clave_a" required>
                    </div>
                    <div class="form-group">
                        <label for="clave_n">Clave nueva:</label>
                        <input type="password" id="clave_n" name="clave_n" required>
                    </div>
                    <div class="form-group">
                    	<label for="clave_nn">Repetir clave</label>
                    	<input type="password" id="clave_nn" name="clave_nn" required>
                    </div>
                <div class="form-buttons">
                    <button type="submit" id="btnEnviar">Registrar</button>
                    <button type="reset">Limpiar</button>
                </div>
                    <%
                    	// Extraer los datos
                    	usuario=(String)sesion.getAttribute("usuario");
                    	pwd=(String)sesion.getAttribute("contrasena");
                    	String old_password = request.getParameter ("clave_a");
                    	String new_password = request.getParameter ("clave_n");
                    	String nn_password = request.getParameter ("clave_nn");
                        String mensaje = "";

                        if (old_password != null && new_password != null && nn_password != null) {
                            Usuario user = new Usuario();
                            if (old_password.equals(pwd)) {
                                if (new_password.equals(nn_password)) {
                                    mensaje = user.cambioClave(new_password, usuario);
                                    // Opcional: actualizar la contraseña en sesión
                                    session.setAttribute("contrasena", new_password);
                                } else {
                                    mensaje = "Las claves nuevas no coinciden.";
                                }
                            } else {
                                mensaje = "La clave anterior no es correcta.";
                            }
                        }
                    %>
					<% if (!mensaje.equals("")) { %>
				    	<div class="mensaje">
				        <p><%= mensaje %></p>
				    	</div>
					<% } %>
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
    <%}%>