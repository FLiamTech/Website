<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" session="true" import="com.productos.login.*"%> 
 <head>
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
 <main>
        <header>
            <a href="index.jsp">
                <img src="images/logo2.png" alt="Inicio - Mate y sus repuestos" width="80" height="80" class="logo-header"/>
            </a>
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
            <section>
                <h3>Nuestra misión</h3>
                <p>
                    Esta empresa tiene 12 años de experiencia en la comercialización de repuestos para vehículos.<br><br>
                    Nuestra misión es brindar productos de alta calidad que prolonguen la vida útil de los automóviles y motocicletas de nuestros clientes,<br>
                    ofreciendo soluciones confiables y accesibles para mantenerlos siempre en movimiento.<br><br>
                    Fomentamos una cultura de mantenimiento responsable y consciente,<br>
                    ayudando a reducir el impacto ambiental mediante la reutilización y el reemplazo oportuno de piezas.<br><br>
                    Queremos que cada cliente encuentre el repuesto perfecto para su vehículo,<br>
                    garantizando seguridad, rendimiento y satisfacción en cada viaje.
                </p>
                <img src="images/logo2.png" width="400" height="300" alt="Logo de la empresa Mate y sus Repuestos"/>
            </section>

            <aside>
                <a href="https://www.linkedin.com/in/fabian-liam-a3b5b235b/" target="_blank" rel="noopener noreferrer">
                    Ver más información sobre los desarrolladores
                </a>
                <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1Shi2EO4QsKKZSgoJ7D8D9EbAb2I474g&ehbc=2E312F"
                        width="200" height="200" title="Ubicación de la empresa">
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