<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

$cuestionarios = $con->query("SELECT id, nombre FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
$filtro = (int)($_GET['cuestionario'] ?? 0);

$sql = "SELECT p.*, c.nombre AS cuestionario
        FROM preguntas p
        LEFT JOIN cuestionarios c ON c.id = p.id_cuestionario";
if ($filtro > 0) {
    $stmt = $con->prepare($sql . " WHERE p.id_cuestionario=? ORDER BY p.capitulo, p.id");
    $stmt->bind_param("i", $filtro);
    $stmt->execute();
    $preguntas = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
} else {
    $preguntas = $con->query($sql . " ORDER BY p.id_cuestionario, p.capitulo, p.id")->fetch_all(MYSQLI_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Listado de Preguntas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-list-task"></i> Listado de Preguntas</span>
    <div>
        <a href="registrarPreguntas.php" class="btn btn-success btn-sm"><i class="bi bi-plus-circle"></i> Nueva</a>
        <a href="dashboard.php" class="btn btn-secondary btn-sm"><i class="bi bi-arrow-left"></i> Dashboard</a>
        <a href="<?= CLUB_URL ?>" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left-circle"></i> Club Mikel</a>
    </div>
</div>
</nav>

<div class="container mt-4">

<form method="GET" class="row g-2 mb-3">
    <div class="col-md-4">
        <select name="cuestionario" class="form-select" onchange="this.form.submit()">
            <option value="0">Todos los cuestionarios</option>
            <?php foreach ($cuestionarios as $c) { ?>
                <option value="<?= (int)$c['id'] ?>" <?= $filtro === (int)$c['id'] ? 'selected' : '' ?>><?= e($c['nombre']) ?></option>
            <?php } ?>
        </select>
    </div>
    <div class="col-auto align-self-center text-muted"><?= count($preguntas) ?> pregunta(s)</div>
</form>

<div class="card shadow">
<div class="card-header bg-dark text-white"><i class="bi bi-list"></i> Lista de Preguntas</div>
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-bordered align-middle">
    <thead class="table-dark text-center">
        <tr>
            <th>ID</th><th>Pregunta</th><th>Cuestionario</th><th>Capítulo</th><th>Correcta</th><th>Acción</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($preguntas as $row) { ?>
        <tr>
            <td class="text-center"><?= (int)$row['id'] ?></td>
            <td><?= e($row['pregunta']) ?></td>
            <td><?= e($row['cuestionario'] ?? '—') ?></td>
            <td class="text-center"><?= $row['capitulo'] === 'final' ? '🔥 Final' : e($row['capitulo']) ?></td>
            <td class="text-center"><span class="badge bg-success"><?= e($row['respuesta_correcta']) ?></span></td>
            <td class="text-center">
                <form action="eliminar_pregunta.php" method="POST" class="d-inline"
                      onsubmit="return confirm('¿Eliminar esta pregunta?')">
                    <?= csrf_field() ?>
                    <input type="hidden" name="id" value="<?= (int)$row['id'] ?>">
                    <button class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
                </form>
            </td>
        </tr>
    <?php } ?>
    <?php if (!$preguntas) { ?>
        <tr><td colspan="6" class="text-center text-muted">No hay preguntas registradas.</td></tr>
    <?php } ?>
    </tbody>
</table>
</div>
</div>
</div>
</div>
</body>
</html>
