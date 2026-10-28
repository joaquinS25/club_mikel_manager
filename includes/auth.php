<?php
// includes/auth.php  -> funciones comunes de seguridad
if (session_status() === PHP_SESSION_NONE) session_start();

// ⚙️ AJUSTA ESTAS DOS RUTAS SI HACE FALTA (son relativas a admin/ y user/)
if (!defined('LOGIN_URL')) define('LOGIN_URL', '../index.php');   // página de login de Club Mikel
if (!defined('CLUB_URL'))  define('CLUB_URL',  '../home.php');    // dashboard de Club Mikel

// 🔗 PUENTE: la sesión de Club Mikel (solo entra el administrador) es la sesión del simulador.
// Club Mikel guarda: autentificado, id_session, nom_session
if (!empty($_SESSION['autentificado']) && empty($_SESSION['id']) && !empty($_SESSION['id_session'])) {
    $_SESSION['id']       = (int)$_SESSION['id_session'];
    $_SESSION['usuario']  = (string)($_SESSION['nom_session'] ?? 'Administrador');
    $_SESSION['rol']      = 'admin';
    $_SESSION['via_club'] = true;
}

// Escapar texto antes de imprimirlo en HTML (evita XSS)
function e($s){ return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

// Exige sesión iniciada
function require_login(){
    if (empty($_SESSION['id'])) { header("Location: " . LOGIN_URL); exit(); }
}

// Exige sesión + rol admin
function require_admin(){
    require_login();
    if (($_SESSION['rol'] ?? '') !== 'admin') { header("Location: " . LOGIN_URL); exit(); }
}

// ¿Es un invitado que entró por un enlace de examen?
function es_invitado(){
    return !empty($_SESSION['invitado']) && empty($_SESSION['id']);
}

// Permite administrador O invitado (para examen.php y procesar_respuesta.php)
function require_participante(){
    if (!empty($_SESSION['id']) || es_invitado()) return;
    header("Location: " . LOGIN_URL); exit();
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
