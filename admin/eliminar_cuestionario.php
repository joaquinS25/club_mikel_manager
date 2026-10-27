<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); exit(); }
csrf_check();

$id = (int)($_POST['id'] ?? 0);

// Borrar imagen del disco
$stmt = $con->prepare("SELECT imagen FROM cuestionarios WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$c = $stmt->get_result()->fetch_assoc();
if ($c && !empty($c['imagen'])) {
    $ruta = __DIR__ . '/../img/cuestionarios/' . basename($c['imagen']);
    if (is_file($ruta)) unlink($ruta);
}

// Borrar sus preguntas y luego el cuestionario
$stmt = $con->prepare("DELETE FROM preguntas WHERE id_cuestionario=?");
$stmt->bind_param("i", $id);
$stmt->execute();

$stmt = $con->prepare("DELETE FROM cuestionarios WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: cuestionarios.php");
exit();
