<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

const NOTA_MINIMA = 70;   // debe coincidir con procesar_respuesta.php

$cuestionarios = $con->query("SELECT id, nombre FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
$fc = (int)($_GET['cuestionario'] ?? 0);
$fe = (int)($_GET['enlace'] ?? 0);

$stmt = $con->prepare("
    SELECT r.id, r.id_enlace, r.capitulo, r.puntaje, r.total, r.porcentaje, r.tiempo_seg, r.fecha,
           (r.detalle IS NOT NULL) AS tiene_detalle,
           COALESCE(u.usuario, r.nombre_participante, 'Anónimo') AS nombre,
           c.nombre AS cuestionario, l.etiqueta
    FROM resultados r
    LEFT JOIN usuarios_simulador u ON u.id = r.id_usuario
    LEFT JOIN cuestionarios c ON c.id = r.id_cuestionario
    LEFT JOIN enlaces_examen l ON l.id = r.id_enlace
    WHERE (? = 0 OR r.id_cuestionario = ?) AND (? = 0 OR r.id_enlace = ?)
    ORDER BY r.fecha DESC
    LIMIT 1000
");
$stmt->bind_param("iiii", $fc, $fc, $fe, $fe);
$stmt->execute();
$filas = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// 📥 Exportar a CSV (se abre en Excel)
if (isset($_GET['csv'])) {
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename="resultados.csv"');
    echo "\xEF\xBB\xBF";
    $out = fopen('php://output', 'w');
    fputcsv($out, ['Nombre','Cuestionario','Examen','Puntaje','Total','Porcentaje','Estado','Tiempo (min:seg)','Fecha']);
    foreach ($filas as $r) {
        fputcsv($out, [
            $r['nombre'], $r['cuestionario'], $r['capitulo'] === 'final' ? 'Final' : 'Capítulo ' . $r['capitulo'],
            $r['puntaje'], $r['total'], $r['porcentaje'] . '%',
            $r['porcentaje'] >= NOTA_MINIMA ? 'Aprobado' : 'Desaprobado',
            $r['tiempo_seg'] !== null ? gmdate('i:s', (int)$r['tiempo_seg']) : '', $r['fecha'],
        ]);
    }
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Resultados</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-bar-chart"></i> Resultados</span>
    <div>
        <a href="../user/ranking.php" class="btn btn-warning btn-sm"><i class="bi bi-trophy"></i> Ranking</a>
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
                <option value="<?= (int)$c['id'] ?>" <?= $fc === (int)$c['id'] ? 'selected' : '' ?>><?= e($c['nombre']) ?></option>
            <?php } ?>
        </select>
    </div>
    <?php if ($fe) { ?>
        <input type="hidden" name="enlace" value="<?= $fe ?>">
        <div class="col-auto align-self-center"><span class="badge bg-info">Filtrado por enlace #<?= $fe ?></span>
            <a href="resultados.php" class="small">quitar</a></div>
    <?php } ?>
    <div class="col text-end">
        <a class="btn btn-success btn-sm" href="?<?= e(http_build_query(['cuestionario'=>$fc, 'enlace'=>$fe, 'csv'=>1])) ?>">
            <i class="bi bi-file-earmark-excel"></i> Descargar CSV
        </a>
    </div>
</form>

<div class="card shadow">
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-bordered align-middle">
    <thead class="table-dark text-center">
        <tr><th>Nombre</th><th>Cuestionario</th><th>Examen</th><th>Puntaje</th><th>%</th><th>Estado</th><th>Tiempo</th><th>Fecha</th><th>PDF</th></tr>
    </thead>
    <tbody>
    <?php foreach ($filas as $r) { $ok = $r['porcentaje'] >= NOTA_MINIMA; ?>
        <tr>
            <td><?= e($r['nombre']) ?><?php if ($r['id_enlace']) { ?> <i class="bi bi-link-45deg text-muted" title="Entró por enlace"></i><?php } ?></td>
            <td><?= e($r['cuestionario'] ?? '—') ?></td>
            <td class="text-center"><?= $r['capitulo'] === 'final' ? '🔥 Final' : e($r['capitulo'] ?? '—') ?></td>
            <td class="text-center"><?= (int)$r['puntaje'] ?> / <?= (int)$r['total'] ?></td>
            <td class="text-center"><?= (int)$r['porcentaje'] ?>%</td>
            <td class="text-center"><span class="badge bg-<?= $ok ? 'success' : 'danger' ?>"><?= $ok ? 'Aprobado' : 'Desaprobado' ?></span></td>
            <td class="text-center"><?= $r['tiempo_seg'] !== null ? gmdate('i:s', (int)$r['tiempo_seg']) : '—' ?></td>
            <td class="text-center"><?= e($r['fecha']) ?></td>
            <td class="text-center">
                <?php if ($r['tiene_detalle']) { ?>
                    <a href="resultado_pdf.php?id=<?= (int)$r['id'] ?>" target="_blank" class="btn btn-sm btn-outline-danger">
                        <i class="bi bi-file-earmark-pdf"></i> PDF
                    </a>
                <?php } else { ?>
                    <button class="btn btn-sm btn-outline-secondary" disabled title="Este examen se rindió antes de guardar el detalle">
                        <i class="bi bi-file-earmark-pdf"></i> PDF
                    </button>
                <?php } ?>
            </td>
        </tr>
    <?php } ?>
    <?php if (!$filas) { ?>
        <tr><td colspan="9" class="text-center text-muted">Todavía no hay resultados.</td></tr>
    <?php } ?>
    </tbody>
</table>
</div>
</div>
</div>
</div>
</body>
</html>
