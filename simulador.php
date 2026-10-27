<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark d-flex justify-content-center align-items-center vh-100">

<form action="auth/validar.php" method="POST" class="bg-white p-4 rounded shadow">
    <h3 class="text-center">Simulador</h3>

    <input name="usuario" class="form-control mb-2" placeholder="Usuario" required>
    <input name="password" type="password" class="form-control mb-2" placeholder="Contraseña" required>

    <button class="btn btn-primary w-100">Ingresar</button>
</form>

</body>
</html>
