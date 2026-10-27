<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MIKEL CLUB MANAGER</title>

<?php
         require("vista/estilos.php");
?>

<?php
         require("vista/estilo_login.php");
?>
</head>
<body>

<div class="login-card">

    <div class="text-center">

        <img src="img/logo.png" class="logo">

        <h2 class="titulo">
            MIKEL CLUB MANAGER
        </h2>

        <p class="subtitulo">
            Sistema de Gestión para Conquistadores y Aventureros
        </p>

        <p class="frase">
            "Formando líderes para Cristo"
        </p>

    </div>

    <form action="autentificacion.php" method="post">

        <div class="mb-3">
            <label class="form-label">
                Usuario
            </label>

            <input
                type="text"
                name="user"
                class="form-control"
                required>
        </div>

        <div class="mb-3">

            <label class="form-label">
                Contraseña
            </label>

            <div class="password-container">

                <input
                    type="password"
                    name="pass"
                    id="password"
                    class="form-control"
                    required>

                <i class="fa-solid fa-eye toggle-password"
                   onclick="mostrarPassword()">
                </i>

            </div>

        </div>

        <div class="mb-3">

            <label class="form-label">
                Tipo de Club
            </label>

            <select class="form-select" name="tipo_club" required>

                <option value="">
                    Seleccione...
                </option>

                <option value="conquistadores">
                    Conquistadores
                </option>

                <option value="aventureros">
                    Aventureros
                </option>

            </select>

        </div>

        <div class="form-check mb-3">

            <input
                class="form-check-input"
                type="checkbox"
                id="recordarme">

            <label class="form-check-label" for="recordarme">
                Recordarme
            </label>

        </div>

        <button type="submit"
                class="btn btn-login w-100">

            <i class="fa-solid fa-right-to-bracket"></i>
            Ingresar

        </button>

    </form>

    <div class="text-center mt-4">

        <a href="#" class="text-decoration-none">
            ¿Olvidaste tu contraseña?
        </a>

        <hr>

        <div class="footer-text">
            Club Mikel © 2026
        </div>

    </div>

</div>

<?php
         require("vista/script_login.php");
?>

</body>
</html>