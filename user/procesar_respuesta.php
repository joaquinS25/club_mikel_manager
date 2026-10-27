<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_participante();

const NOTA_MINIMA = 70;
$invitado = es_invitado();

// El examen lo definió el SERVIDOR en examen.php
$ex = $_SESSION['examen'] ?? null;
if (!$ex || empty($ex['ids'])) {
    http_response_code(400);
    exit('No hay un examen activo (quizá ya fue enviado).');
}
unset($_SESSION['examen']);   // un examen = un solo envío

// ⏱️ Tolerancia de 30 s por latencia de red
if (time() > $ex['inicio'] + $ex['duracion'] + 30) {
    if ($invitado) $_SESSION['invitado']['terminado'] = true;
    http_response_code(403);
    exit('El tiempo del examen terminó antes de recibir tus respuestas.');
}

$ids        = array_map('intval', $ex['ids']);
$respuestas = $_POST['r'] ?? [];
if (!is_array($respuestas)) $respuestas = [];

$stmt = $con->prepare("SELECT * FROM preguntas WHERE id IN (" . implode(',', array_fill(0, count($ids), '?')) . ")");
$stmt->bind_param(str_repeat('i', count($ids)), ...$ids);
$stmt->execute();
$preguntas = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
usort($preguntas, fn($a, $b) => array_search((int)$a['id'], $ids) <=> array_search((int)$b['id'], $ids));

// Invitado: el enlace decide si ve las respuestas correctas
$mostrarDetalle = $invitado ? ((int)$_SESSION['invitado']['mostrar'] === 1) : true;

$puntaje = 0;
$total   = count($preguntas);   // total REAL, no lo que envía el usuario
$html    = "";
$detalle = [];   // copia del examen para el PDF

foreach ($preguntas as $p) {
    $resp     = strtoupper((string)($respuestas[$p['id']] ?? ''));
    $correcta = $p['respuesta_correcta'];
    if ($resp === $correcta) $puntaje++;

    $detalle[] = [
        'p' => $p['pregunta'],
        'a' => $p['opcion_a'], 'b' => $p['opcion_b'], 'c' => $p['opcion_c'], 'd' => $p['opcion_d'],
        'c' => $correcta, 'm' => $resp, 'e' => $p['explicacion'] ?? '',
    ];

    if ($mostrarDetalle) {
        $html .= "<div class='mb-3 p-2 border-bottom'><b>" . e($p['pregunta']) . "</b><br>";
        foreach (['A','B','C','D'] as $op) {
            $texto = e($p['opcion_' . strtolower($op)]);
            if ($op === $correcta)  $html .= "<span class='text-success fw-bold'>✔ $op. $texto</span><br>";
            elseif ($op === $resp)  $html .= "<span class='text-danger fw-bold'>✘ $op. $texto</span><br>";
            else                    $html .= "$op. $texto<br>";
        }
        if ($resp === '') $html .= "<small class='text-muted'>Sin responder</small>";
        if (!empty($p['explicacion'])) {
            $html .= "<div class='small text-muted mt-1'>📖 " . e($p['explicacion']) . "</div>";
        }
        $html .= "</div>";
    }
}

$porcentaje = $total > 0 ? (int)round($puntaje / $total * 100) : 0;
$aprobado   = $porcentaje >= NOTA_MINIMA;
$estado     = $aprobado ? "APROBADO ✅" : "DESAPROBADO ❌";
$color      = $aprobado ? "success" : "danger";
$tiempo     = min(time() - (int)$ex['inicio'], (int)$ex['duracion']);

// 💾 Guardar resultado (registrado o invitado)
$idUsuario = $invitado ? null : (int)$_SESSION['id'];
$nombre    = $invitado ? $_SESSION['invitado']['nombre'] : null;
$idEnlace  = $invitado ? (int)$_SESSION['invitado']['id_enlace'] : null;
$idCuest   = (int)$ex['cuestionario'];
$capitulo  = (string)$ex['capitulo'];

$stmt = $con->prepare("INSERT INTO resultados
    (id_usuario, id_cuestionario, capitulo, puntaje, total, porcentaje, tiempo_seg, nombre_participante, id_enlace, detalle)
    VALUES (?,?,?,?,?,?,?,?,?,?)");
$detalleJson = json_encode($detalle, JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE);
$stmt->bind_param("iisiiiisis", $idUsuario, $idCuest, $capitulo, $puntaje, $total, $porcentaje, $tiempo, $nombre, $idEnlace, $detalleJson);
$stmt->execute();

if ($invitado) $_SESSION['invitado']['terminado'] = true;

echo "
<div class='text-center'>
  <h2 class='text-$color'>$estado</h2>
  <div class='progress mb-3'><div class='progress-bar bg-$color' style='width:{$porcentaje}%'>{$porcentaje}%</div></div>
  <p><b>Puntaje:</b> $puntaje / $total &nbsp;|&nbsp; <b>Tiempo:</b> " . gmdate('i:s', $tiempo) . "</p>
</div>";
if ($mostrarDetalle) {
    echo "<hr><div style='max-height:400px; overflow:auto; text-align:left'>$html</div>";
}
