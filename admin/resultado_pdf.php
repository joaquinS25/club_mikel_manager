<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

const NOTA_MINIMA = 70;   // debe coincidir con procesar_respuesta.php

$id = (int)($_GET['id'] ?? 0);
$stmt = $con->prepare("
    SELECT r.*, COALESCE(u.usuario, r.nombre_participante, 'Anónimo') AS nombre,
           c.nombre AS cuestionario
    FROM resultados r
    LEFT JOIN usuarios_simulador u ON u.id = r.id_usuario
    LEFT JOIN cuestionarios c ON c.id = r.id_cuestionario
    WHERE r.id = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$r = $stmt->get_result()->fetch_assoc();
if (!$r) { http_response_code(404); exit('Resultado no encontrado.'); }

$detalle  = $r['detalle'] ? json_decode($r['detalle'], true) : [];
$aprobado = (int)$r['porcentaje'] >= NOTA_MINIMA;
$examen   = $r['capitulo'] === 'final' ? 'Examen Final' : 'Capítulo ' . $r['capitulo'];
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Resultado - <?= e($r['nombre']) ?></title>
<style>
*{ box-sizing:border-box; -webkit-print-color-adjust:exact; print-color-adjust:exact; }
body{ font-family: Arial, Helvetica, sans-serif; color:#212529; margin:0; background:#f1f3f5; }
.hoja{ max-width:800px; margin:20px auto; background:#fff; padding:28px 34px; }
.barra{ max-width:800px; margin:20px auto 0; display:flex; gap:8px; justify-content:flex-end; }
.barra button, .barra a{ padding:8px 14px; border:0; border-radius:6px; background:#0d6efd; color:#fff; font-size:14px; cursor:pointer; text-decoration:none; }
.barra a{ background:#6c757d; }

h1{ font-size:20px; margin:0 0 4px; }
.sub{ color:#6c757d; font-size:13px; margin-bottom:16px; }

.resumen{ display:flex; gap:12px; align-items:stretch; margin-bottom:10px; }
.nota{ flex:0 0 190px; text-align:center; padding:12px; border-radius:8px; color:#fff; background:<?= $aprobado ? '#198754' : '#dc3545' ?>; }
.nota .grande{ font-size:34px; font-weight:bold; line-height:1.1; }
.nota .peq{ font-size:13px; }
.datos{ flex:1; border:1px solid #dee2e6; border-radius:8px; padding:10px 14px; font-size:13px; line-height:1.7; }
.datos b{ display:inline-block; min-width:100px; }

.pregunta{ border:1px solid #dee2e6; border-radius:8px; padding:10px 14px; margin-top:10px; page-break-inside:avoid; break-inside:avoid; }
.pregunta .q{ font-weight:bold; font-size:14px; margin-bottom:6px; }
.estado{ font-size:12px; font-weight:bold; margin-left:6px; }
.ok{ color:#198754; } .mal{ color:#dc3545; } .vacia{ color:#6c757d; }
.op{ font-size:13px; padding:3px 8px; border-radius:4px; margin:2px 0; }
.op.correcta{ background:#d1e7dd; color:#0f5132; font-weight:bold; }
.op.error{ background:#f8d7da; color:#842029; font-weight:bold; }
.expl{ font-size:12px; color:#6c757d; margin-top:6px; }
.aviso{ background:#fff3cd; border:1px solid #ffecb5; padding:12px; border-radius:8px; margin-top:12px; }

@media print{
    body{ background:#fff; }
    .barra{ display:none; }
    .hoja{ margin:0; padding:0; max-width:none; }
    @page{ margin:14mm; }
}
</style>
</head>
<body>

<div class="barra">
    <a href="javascript:history.length > 1 ? history.back() : window.close()">Volver</a>
    <button onclick="window.print()">Imprimir / Guardar como PDF</button>
</div>

<div class="hoja">
    <h1><?= e($r['nombre']) ?></h1>
    <div class="sub"><?= e($r['cuestionario'] ?? '—') ?> · <?= e($examen) ?></div>

    <div class="resumen">
        <div class="nota">
            <div class="grande"><?= (int)$r['puntaje'] ?> / <?= (int)$r['total'] ?></div>
            <div class="peq"><?= (int)$r['porcentaje'] ?>% · <?= $aprobado ? 'APROBADO' : 'DESAPROBADO' ?></div>
        </div>
        <div class="datos">
            <div><b>Participante:</b> <?= e($r['nombre']) ?></div>
            <div><b>Examen:</b> <?= e($examen) ?></div>
            <div><b>Fecha:</b> <?= e($r['fecha']) ?></div>
            <div><b>Tiempo usado:</b> <?= $r['tiempo_seg'] !== null ? gmdate('i:s', (int)$r['tiempo_seg']) . ' min' : '—' ?></div>
            <div><b>Nota mínima:</b> <?= NOTA_MINIMA ?>%</div>
        </div>
    </div>

<?php if (!$detalle) { ?>
    <div class="aviso">
        Este resultado se guardó antes de activar el detalle del examen, por eso no hay
        preguntas para mostrar. Los exámenes nuevos sí incluirán el detalle completo.
    </div>
<?php } ?>

<?php foreach ($detalle as $i => $p) {
    $marcada  = $p['m'] ?? '';
    $correcta = $p['c'] ?? '';
    if ($marcada === '')            { $txt = 'Sin responder'; $cls = 'vacia'; }
    elseif ($marcada === $correcta) { $txt = '✔ Correcta';    $cls = 'ok'; }
    else                            { $txt = '✘ Incorrecta';  $cls = 'mal'; }
?>
    <div class="pregunta">
        <div class="q"><?= $i + 1 ?>. <?= e($p['p']) ?> <span class="estado <?= $cls ?>"><?= $txt ?></span></div>

        <?php foreach (['A','B','C','D'] as $op) {
            $clase = '';
            $nota  = '';
            if ($op === $correcta) { $clase = 'correcta'; $nota = $op === $marcada ? ' ← marcó (correcta)' : ' ← correcta'; }
            elseif ($op === $marcada) { $clase = 'error'; $nota = ' ← marcó'; }
        ?>
            <div class="op <?= $clase ?>"><?= $op ?>. <?= e($p[strtolower($op)] ?? '') ?><?= $nota ?></div>
        <?php } ?>

        <?php if (!empty($p['e'])) { ?><div class="expl">📖 <?= e($p['e']) ?></div><?php } ?>
    </div>
<?php } ?>
</div>

<?php if ($detalle && !isset($_GET['noprint'])) { ?>
<script>window.addEventListener("load", () => setTimeout(() => window.print(), 400));</script>
<?php } ?>
</body>
</html>
