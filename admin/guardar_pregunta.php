<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); exit(); }
csrf_check();

$pregunta = trim($_POST['pregunta'] ?? '');
$a = trim($_POST['a'] ?? '');
$b = trim($_POST['b'] ?? '');
$c = trim($_POST['c'] ?? '');
$d = trim($_POST['d'] ?? '');
$correcta = strtoupper($_POST['correcta'] ?? '');
$capitulo = (string)($_POST['capitulo'] ?? '');
$id_cuestionario = (int)($_POST['id_cuestionario'] ?? 0);

$capitulosValidos = ['1','2','3','4','5','6','7','final'];

if ($pregunta === '' || $a === '' || $b === '' || $c === '' || $d === ''
    || !in_array($correcta, ['A','B','C','D'], true)
    || !in_array($capitulo, $capitulosValidos, true)
    || $id_cuestionario <= 0) {
    http_response_code(400);
    exit('Datos inválidos. Vuelve atrás y revisa el formulario.');
}

$stmt = $con->prepare("INSERT INTO preguntas
    (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, capitulo, id_cuestionario)
    VALUES (?,?,?,?,?,?,?,?)");
// 7 strings + 1 entero
$stmt->bind_param("sssssssi", $pregunta, $a, $b, $c, $d, $correcta, $capitulo, $id_cuestionario);
$stmt->execute();

header("Location: registrarPreguntas.php?ok=1");
exit();
