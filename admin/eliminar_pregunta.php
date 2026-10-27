<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); exit(); }
csrf_check();

$id = (int)($_POST['id'] ?? 0);
$stmt = $con->prepare("DELETE FROM preguntas WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: preguntas.php");
exit();
