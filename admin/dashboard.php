<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

$cuestionarios = $con->query("SELECT * FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Panel Administrador</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>
.card{ border-radius:15px; }
.card-hover:hover{ transform:scale(1.05); transition:.3s; }
.navbar{ box-shadow:0 2px 10px rgba(0,0,0,.2); }
</style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-speedometer2"></i> Panel Administrador</span>
    <a href="<?= CLUB_URL ?>" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left-circle"></i> Club Mikel</a>
</div>
</nav>

<div class="container mt-5">
<h3 class="mb-4 text-center">Gestión del Sistema</h3>

<div class="row g-4">
    <div class="col-lg col-md-4 col-sm-6">
        <div class="card text-center p-4 shadow card-hover">
            <i class="bi bi-list-task fs-1 text-primary"></i>
            <h5 class="mt-2">Listado de Preguntas</h5>
            <a href="preguntas.php" class="btn btn-primary mt-2">Ver</a>
        </div>
    </div>
    <div class="col-lg col-md-4 col-sm-6">
        <div class="card text-center p-4 shadow card-hover">
            <i class="bi bi-plus-circle fs-1 text-success"></i>
            <h5 class="mt-2">Registrar Pregunta</h5>
            <a href="registrarPreguntas.php" class="btn btn-success mt-2">Ir</a>
        </div>
    </div>
    <div class="col-lg col-md-4 col-sm-6">
        <div class="card text-center p-4 shadow card-hover">
            <i class="bi bi-book fs-1 text-warning"></i>
            <h5 class="mt-2">Cuestionarios</h5>
            <a href="cuestionarios.php" class="btn btn-warning mt-2">Gestionar</a>
        </div>
    </div>
    <div class="col-lg col-md-4 col-sm-6">
        <div class="card text-center p-4 shadow card-hover">
            <i class="bi bi-bar-chart fs-1 text-info"></i>
            <h5 class="mt-2">Resultados</h5>
            <a href="resultados.php" class="btn btn-info mt-2">Ver</a>
        </div>
    </div>
    <div class="col-lg col-md-4 col-sm-6">
        <div class="card text-center p-4 shadow card-hover border-primary">
            <i class="bi bi-link-45deg fs-1 text-primary"></i>
            <h5 class="mt-2">Enlaces de examen</h5>
            <a href="enlaces.php" class="btn btn-outline-primary mt-2">Crear / copiar</a>
        </div>
    </div>
</div>

<hr class="my-5">

<h4 class="mb-3">Cuestionarios Registrados</h4>
<div class="row g-4">
<?php foreach ($cuestionarios as $c) { ?>
    <div class="col-md-3 col-sm-6">
        <div class="card text-center p-3 shadow">
            <h6><?= e($c['nombre']) ?></h6>
            <?php if (!empty($c['imagen'])) { ?>
                <img src="../img/cuestionarios/<?= e($c['imagen']) ?>" class="img-fluid mb-2" style="height:120px; object-fit:cover;" alt="">
            <?php } ?>
            <a href="../user/seleccionar_examen.php?cuestionario=<?= (int)$c['id'] ?>" class="btn btn-sm btn-primary">Ver Examen</a>
        </div>
    </div>
<?php } ?>
<?php if (!$cuestionarios) { ?>
    <p class="text-muted">Aún no hay cuestionarios. <a href="cuestionarios.php">Crea el primero</a>.</p>
<?php } ?>
</div>

</div>
</body>
</html>
