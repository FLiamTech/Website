package com.productos.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;

public class Product {

    private int id;
    private int id_categoria;
    private String nombre;
    private int cantidad;
    private double precio;
    private String directorio;

    public Product() {}

    // Getters y setters...
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getId_categoria() { return id_categoria; }
    public void setId_categoria(int id_categoria) { this.id_categoria = id_categoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public String getDirectorio() { return directorio; }
    public void setDirectorio(String directorio) { this.directorio = directorio; }

    public String consultarTodo() {
        String sql = "SELECT * FROM db_producto ORDER BY id_pro";
        Conexion con = new Conexion();
        String tabla = "<table border='2'><tr><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th></tr>";
        ResultSet rs = con.Consulta(sql);

        if (rs == null) {
            return "<p>Error al consultar los productos: ResultSet vacío.</p>";
        }

        try {
            while (rs.next()) {
                tabla += "<tr><td>" + rs.getInt("id_pro") + "</td>"
                      + "<td>" + rs.getString("nombre_pr") + "</td>"
                      + "<td>" + rs.getInt("cantidad_pr") + "</td>"
                      + "<td>" + rs.getDouble("precio_pr") + "</td></tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "<p>Error SQL: " + e.getMessage() + "</p>";
        }

        tabla += "</table>";
        return tabla;
    }

    public String buscarProductoCategoria(int cat) {
        String sentencia = "SELECT nombre_pr, precio_pr FROM db_producto WHERE id_cat = " + cat;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sentencia);
        String resultado = "<table border='3'><tr><th>Nombre</th><th>Precio</th></tr>";

        if (rs == null) {
            return "<p>Error al buscar productos: ResultSet vacío.</p>";
        }

        try {
            while (rs.next()) {
                resultado += "<tr><td>" + rs.getString("nombre_pr") + "</td>"
                          + "<td>" + rs.getDouble("precio_pr") + "</td></tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "<p>Error SQL: " + e.getMessage() + "</p>";
        }

        resultado += "</table>";
        return resultado;
    }
    
    public String reporteProducto() {
        String sql = "SELECT pr.id_pro, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr "
                   + "FROM db_producto pr, tb_categoria cat "
                   + "WHERE pr.id_cat = cat.id_categoria;";
        
        Conexion con = new Conexion();
        String tabla = "<table class=\"select-categoria\">\n"
                     + "   <thead>\n"
                     + "      <tr>\n"
                     + "         <th scope=\"col\">ID</th>\n"
                     + "         <th scope=\"col\">Producto</th>\n"
                     + "         <th scope=\"col\">Categoria</th>\n"
                     + "         <th scope=\"col\">Cantidad</th>\n"
                     + "         <th scope=\"col\">Precio</th>\n"
                     + "         <th scope=\"col\">Modificar</th>\n"
                     + "         <th scope=\"col\">Eliminar</th>\n"
                     + "      </tr>\n"
                     + "   </thead>\n"
                     + "   <tbody>";

        ResultSet rs = con.Consulta(sql);

        try {
            while (rs.next()) {
                tabla += "<tr>"
                       + "   <th scope=\"row\">" + rs.getInt("id_pro") + "</th>"
                       + "   <td>" + rs.getString("nombre_pr") + "</td>\n"
                       + "   <td>" + rs.getString("descripcion_cat") + "</td>\n"
                       + "   <td>" + rs.getInt("cantidad_pr") + "</td>\n"
                       + "   <td>" + rs.getDouble("precio_pr") + "</td>\n"
                       + "   <td><a href=\"actualizar.jsp?id=" + rs.getInt(1) + "\">Actualizar</a></td>\n"
                       + "   <td><a href=\"eliminar.jsp?id=" + rs.getInt(1) + "\" onclick=\"return confirm('¿Seguro que deseas eliminar este producto?')\">Eliminar</a></td>\n"
                       + "</tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "<p>Error SQL: " + e.getMessage() + "</p>";
        }

        tabla += "</tbody>\n</table>";
        return tabla;
    }
    public boolean obtenerProductoPorId(String id) {
        Conexion con = new Conexion();
        String sql = "SELECT * FROM db_producto WHERE id_pro = ?";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id_pro"));
                this.setNombre(rs.getString("nombre_pr"));
                this.setCantidad(rs.getInt("cantidad_pr"));
                this.setPrecio(rs.getDouble("precio_pr"));
                this.setId_categoria(rs.getInt("id_cat"));
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String agregarProducto ()
    {
    	String result = "";
    	Conexion con = new Conexion ();
    	PreparedStatement pr = null;
    	String sql = "INSERT INTO db_producto (id_cat, nombre_pr, cantidad_pr, precio_pr)\n"
    			+ "VALUES (?, ?, ?, ?);";
    	try
    	{
    		pr = con.getConexion().prepareStatement(sql);
    		pr.setInt(1, this.getId_categoria());
    		pr.setString(2, this.getNombre());
    		pr.setInt(3, this.getCantidad());
    		pr.setDouble(4, this.getPrecio());
    		
    		if (pr.executeUpdate() == 1)
    		{
    			result = "Inserción Correcta";
    		}
    		else
    		{
    			result = "Error en la inserción";
    		}
    	} catch (Exception ex) {
	        result = ex.getMessage();
	        System.out.print(result);
	    } finally {
	        try {
	            pr.close();
	            con.getConexion().close();
	        } catch (Exception ex) {
	            System.out.print(ex.getMessage());
	        }
	    }
	    return result;
    }
    public String actualizarStock (String id)
    {
    	String result="";
    	Conexion con= new Conexion();
    	PreparedStatement pr = null;
    	String sql = "UPDATE db_producto SET cantidad_pr=cantidad_pr + ?\n"
    			+ "	WHERE id_pro="+id +";";
    	
    	try
    	{
    		pr = con.getConexion().prepareStatement(sql);
    		pr.setInt(1, this.getCantidad());
    		if (pr.executeUpdate() == 1)
    		{
    			result = "Inserción Correcta";
    		}
    		else
    		{
    			result = "Error en la inserción";
    		}
    	} catch (Exception ex) {
	        result = ex.getMessage();
	        System.out.print(result);
	    } finally {
	        try {
	            pr.close();
	            con.getConexion().close();
	        } catch (Exception ex) {
	            System.out.print(ex.getMessage());
	        }
	    }
    	
    	return result;
    }
    public String eliminarProducto (String id)
    {
    	String result="";
    	Conexion con = new Conexion ();
    	String sql = "DELETE FROM db_producto \n"
    			+ "WHERE id_pro="+id+";";
    	result=con.Ejecutar(sql);
    	return result;
    }
}