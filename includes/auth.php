<?php
// includes/auth.php  -> funciones comunes de seguridad
if (session_status() === PHP_SESSION_NONE) session_start();

// Escapar texto antes de imprimirlo en HTML (evita XSS)
function e($s){ return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

// Exige sesión iniciada (estudiante registrado o admin)
function require_login(){
    if (empty($_SESSION['id'])) { header("Location: ../index.php"); exit(); }
}

// Exige sesión + rol admin
function require_admin(){
    require_login();
    if (($_SESSION['rol'] ?? '') !== 'admin') { header("Location: ../user/panel.php"); exit(); }
}

// ¿Es un invitado que entró por un enlace de examen?
function es_invitado(){
    return !empty($_SESSION['invitado']) && empty($_SESSION['id']);
}

// Permite usuario registrado O invitado (para examen.php y procesar_respuesta.php)
function require_participante(){
    if (!empty($_SESSION['id']) || es_invitado()) return;
    header("Location: ../index.php"); exit();
}

function nombre_participante(){
    return es_invitado() ? $_SESSION['invitado']['nombre'] : ($_SESSION['usuario'] ?? 'Usuario');
}

// Token CSRF
function csrf_token(){
    if (empty($_SESSION['csrf'])) $_SESSION['csrf'] = bin2hex(random_bytes(32));
    return $_SESSION['csrf'];
}
function csrf_field(){
    return '<input type="hidden" name="csrf" value="' . csrf_token() . '">';
}
function csrf_check(){
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) {
        http_response_code(403); exit('Token inválido. Recarga la página e inténtalo de nuevo.');
    }
}
