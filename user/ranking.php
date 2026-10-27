<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_login();

$cuestionarios = $con->query("SELECT id, nombre FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
$filtro = (int)($_GET['cuestionario'] ?? 0);

$sql = "SELECT COALESCE(u.usuario, r.nombre_participante, 'Anónimo') AS nombre,
               MAX(r.porcentaje) AS mejor, COUNT(*) AS intentos
        FROM resultados r
        LEFT JOIN usuarios_simulador u ON u.id = r.id_usuario";
if ($filtro > 0) {
    $stmt = $con->prepare($sql . " WHERE r.id_cuestionario=? GROUP BY nombre ORDER BY mejor DESC LIMIT 10");
    $stmt->bind_param("i", $filtro);
    $stmt->execute();
    $ranking = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
} else {
    $ranking = $con->query($sql . " GROUP BY nombre ORDER BY mejor DESC LIMIT 10")->fetch_all(MYSQLI_ASSOC);
}

$volver = (($_SESSION['rol'] ?? '') === 'admin') ? '../admin/dashboard.php' : 'panel.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ranking</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4" style="max-width:700px">

<a href="<?= $volver ?>" class="btn btn-secondary btn-sm mb-3">← Volver</a>
<h3>🏆 Ranking</h3>

<form method="GET" class="mb-3">
    <select name="cuestionario" class="form-select" onchange="this.form.submit()">
        <option value="0">Todos los cuestionarios</option>
        <?php foreach ($cuestionarios as $c) { ?>
            <option value="<?= (int)$c['id'] ?>" <?= $filtro === (int)$c['id'] ? 'selected' : '' ?>><?= e($c['nombre']) ?></option>
        <?php } ?>
    </select>
</form>

<table class="table table-bordered bg-white">
    <thead class="table-dark"><tr><th>#</th><th>Nombre</th><th>Mejor puntaje</th><th>Intentos</th></tr></thead>
    <tbody>
    <?php $i = 1; foreach ($ranking as $row) { ?>
        <tr>
            <td><?= $i++ ?></td>
            <td><?= e($row['nombre']) ?></td>
            <td><?= (int)$row['mejor'] ?>%</td>
            <td><?= (int)$row['intentos'] ?></td>
        </tr>
    <?php } ?>
    <?php if (!$ranking) { ?>
        <tr><td colspan="4" class="text-center text-muted">Todavía no hay resultados.</td></tr>
    <?php } ?>
    </tbody>
</table>
</div>
</body>
</html>
