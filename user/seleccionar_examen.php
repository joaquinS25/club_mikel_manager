<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_login();

$cuestionario = (int)($_GET['cuestionario'] ?? 0);
if ($cuestionario <= 0) { header("Location: panel.php"); exit(); }

// Capítulos normales (el 'final' se muestra aparte como Examen Final)
$stmt = $con->prepare("
    SELECT capitulo, COUNT(*) AS n
    FROM preguntas
    WHERE id_cuestionario=? AND capitulo <> 'final'
    GROUP BY capitulo
    ORDER BY CAST(capitulo AS UNSIGNED), capitulo
");
$stmt->bind_param("i", $cuestionario);
$stmt->execute();
$capitulos = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// ¿Hay preguntas en total? (para habilitar el examen final)
$stmt = $con->prepare("SELECT COUNT(*) FROM preguntas WHERE id_cuestionario=?");
$stmt->bind_param("i", $cuestionario);
$stmt->execute();
$totalPreguntas = (int)$stmt->get_result()->fetch_row()[0];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Seleccionar Examen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>
.card{ border-radius:15px; }
.card-hover:hover{ transform:scale(1.05); transition:.3s; }
</style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand">Bienvenido <?= e($_SESSION['usuario'] ?? '') ?></span>
    <a href="<?= CLUB_URL ?>" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left-circle"></i> Club Mikel</a>
</div>
</nav>

<div class="container mt-5">
<a href="panel.php" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Volver</a>
<h3 class="text-center mb-4">Selecciona un Capítulo</h3>

<div class="row g-4">
<?php foreach ($capitulos as $c) { ?>
    <div class="col-md-3 col-sm-6">
        <div class="card text-center p-3 shadow card-hover">
            <h5>📘 Capítulo <?= e($c['capitulo']) ?></h5>
            <small class="text-muted"><?= (int)$c['n'] ?> preguntas</small>
            <a href="examen.php?capitulo=<?= urlencode($c['capitulo']) ?>&cuestionario=<?= $cuestionario ?>"
               class="btn btn-primary mt-2">Iniciar</a>
        </div>
    </div>
<?php } ?>

<?php if ($totalPreguntas > 0) { ?>
    <div class="col-md-3 col-sm-6">
        <div class="card text-center p-3 shadow border-success card-hover">
            <h5>🔥 Examen Final</h5>
            <small class="text-muted">Preguntas al azar de todo el cuestionario</small>
            <a href="examen.php?capitulo=final&cuestionario=<?= $cuestionario ?>"
               class="btn btn-success mt-2">Iniciar</a>
        </div>
    </div>
<?php } else { ?>
    <p class="text-center text-muted">Este cuestionario todavía no tiene preguntas.</p>
<?php } ?>
</div>
</div>
</body>
</html>
