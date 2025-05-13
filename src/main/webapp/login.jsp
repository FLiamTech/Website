<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Nuevo Cliente</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <main class="registro-contenedor">
        <section class="form-box">
            <h2>Registro Nuevo Cliente</h2>
            <form action="respuesta.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="txtNombre">Nombre:</label>
                    <input type="text" name="txtNombre" id="txtNombre" required>
                </div>

                <div class="form-group">
                    <label for="txtCedula">Cédula:</label>
                    <input type="text" name="txtCedula" id="txtCedula" maxlength="10" required>
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
                    <label>Residencia:</label>
                    <div class="radio-group">
                        <label><input type="radio" name="rdResidencia" value="Sur" required> Sur</label>
                        <label><input type="radio" name="rdResidencia" value="Norte"> Norte</label>
                        <label><input type="radio" name="rdResidencia" value="Centro"> Centro</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="fileFoto">Foto:</label>
                    <input type="file" name="fileFoto" id="fileFoto" accept=".jpg,.jpeg,.png">
                </div>

                <div class="form-group">
                    <label for="mFecha">Mes y Año de Nacimiento:</label>
                    <input type="month" name="mFecha" id="mFecha">
                </div>

                <div class="form-group">
                    <label for="cColor">Color Favorito:</label>
                    <input type="color" name="cColor" id="cColor">
                </div>

                <div class="form-group">
                    <label for="txtEmail">Correo Electrónico:</label>
                    <input type="email" name="txtEmail" id="txtEmail" required>
                </div>

                <div class="form-group">
                    <label for="txtClave">Clave:</label>
                    <input type="password" name="txtClave" id="txtClave" required>
                </div>

                <div class="form-buttons">
                    <button type="submit" id="btnEnviar">Enviar Registro</button>
                    <button type="reset">Limpiar</button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
