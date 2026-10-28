<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_login();

$cuestionarios = $con->query("SELECT * FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Panel de Usuario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>
body{ background:#f4f6f9; }
.card{ border-radius:15px; overflow:hidden; }
.card-hover:hover{ transform:scale(1.05); transition:.3s; }
.card img{ height:180px; object-fit:cover; }
.navbar{ box-shadow:0 2px 10px rgba(0,0,0,.2); }
</style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand">
        <i class="bi bi-clipboard-check"></i> Bienvenido <?= e($_SESSION['usuario'] ?? 'Usuario') ?>
    </span>
    <div>
        <a href="ranking.php" class="btn btn-warning btn-sm"><i class="bi bi-trophy"></i> Ranking</a>
        <?php if (($_SESSION['rol'] ?? '') === 'admin') { ?>
            <a href="../admin/dashboard.php" class="btn btn-secondary btn-sm"><i class="bi bi-gear"></i> Admin</a>
        <?php } ?>
        <a href="<?= CLUB_URL ?>" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left-circle"></i> Club Mikel</a>
    </div>
</div>
</nav>

<div class="container mt-5">
<h3 class="text-center mb-4 fw-bold">Selecciona un Cuestionario</h3>

<div class="row g-4">
<?php foreach ($cuestionarios as $c) { ?>
    <div class="col-lg-3 col-md-4 col-sm-6">
        <div class="card shadow card-hover h-100">
            <?php if (!empty($c['imagen'])) { ?>
                <img src="../img/cuestionarios/<?= e($c['imagen']) ?>" class="card-img-top" alt="">
            <?php } ?>
            <div class="card-body text-center">
                <h5 class="card-title"><?= e($c['nombre']) ?></h5>
                <a href="seleccionar_examen.php?cuestionario=<?= (int)$c['id'] ?>" class="btn btn-primary w-100">
                    <i class="bi bi-play-circle"></i> Iniciar
                </a>
            </div>
        </div>
    </div>
<?php } ?>
<?php if (!$cuestionarios) { ?>
    <p class="text-center text-muted">Todavía no hay cuestionarios disponibles.</p>
<?php } ?>
</div>
</div>
</body>
</html>
