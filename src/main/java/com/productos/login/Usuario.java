package com.productos.login;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import com.productos.datos.Conexion;

public class Usuario {
	
	private String correo;
	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public int getPerfil() {
		return perfil;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	private String clave;
	private int perfil;
	private String nombre;
	private int estado;
	private String cedula;

	
	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public boolean verificarUsuario(String ncorreo, String nclave) 
	{ 
	boolean respuesta=false; 
	String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+ 
	   "' and clave_us='"+nclave+"';"; 
	 //System.out.print(sentencia); 
	 try 
	 { 
	 ResultSet rs; 
	 Conexion clsCon=new Conexion(); 
	 rs=clsCon.Consulta(sentencia); 
	  
	 if(rs.next()) 
	 { 
	  respuesta=true; 
	  this.setCorreo(ncorreo); 
	  this.setClave(nclave); 
	  this.setPerfil(rs.getInt(2));  
	  this.setNombre(rs.getString(3)); 
	 } 
	 else 
	 { 
	  respuesta=false; 
	  rs.close(); 
	 } 
	 } 
	 catch(Exception ex) 
	 { 
	 System.out.println( ex.getMessage()); 
	 } 
	return respuesta; 
	} 
	public String ingresarCliente() {
	    String result = "";

	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    // Consulta de inserción sin el campo id_us (AUTO_INCREMENT)
	    String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
	                 + "VALUES (?, ?, ?, ?, ?, ?)";

	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, 2); // Perfil
	        pr.setInt(2, this.getEstado()); // Estado
	        pr.setString(3, this.getNombre()); // Nombre
	        pr.setString(4, this.getCedula()); // Cédula
	        pr.setString(5, this.getCorreo()); // Correo
	        pr.setString(6, this.getClave());

	        if (pr.executeUpdate() == 1) {
	            result = "Inserción correcta";
	        } else {
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
	public String ingresarEmpleado() {
	    String result = "";

	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    // Consulta de inserción sin el campo id_us (AUTO_INCREMENT)
	    String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
	                 + "VALUES (?, ?, ?, ?, ?, ?)";

	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, 3); // Perfil
	        pr.setInt(2, this.getEstado()); // Estado
	        pr.setString(3, this.getNombre()); // Nombre
	        pr.setString(4, this.getCedula()); // Cédula
	        pr.setString(5, this.getCorreo()); // Correo
	        pr.setString(6, this.getClave());

	        if (pr.executeUpdate() == 1) {
	            result = "Inserción correcta";
	        } else {
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
	public String cambioClave (String pwd, String user)
	{
		String result = "";
		Conexion con = new Conexion ();
		PreparedStatement pr = null;
		String sql = "UPDATE tb_usuario SET clave_us = ? WHERE correo_us = ?";
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setString (1,pwd);
	        pr.setString(2, user);

	        int filasAfectadas = pr.executeUpdate();
	        if (filasAfectadas == 1) {
	            result = "Cambio de clave exitoso.";
	        } else {
	            result = "No se encontró el usuario o no se realizó el cambio.";
	        }
	    } catch (Exception ex) {
	        result = "Error: " + ex.getMessage();
	        System.out.println(result);
	    } finally {
	        try {
	            if (pr != null) pr.close();
	            if (con.getConexion() != null) con.getConexion().close();
	        } catch (Exception ex) {
	            System.out.println("Error al cerrar conexión: " + ex.getMessage());
	        }
	    }
	    return result;
	}
}
