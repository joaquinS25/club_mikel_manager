<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';

$token = (string)($_GET['t'] ?? $_POST['t'] ?? '');
$enlace = null;
$mensaje = '';
$error = '';

if (preg_match('/^[a-f0-9]{32}$/', $token)) {
    $stmt = $con->prepare("SELECT l.*, c.nombre AS cuestionario
                           FROM enlaces_examen l
                           JOIN cuestionarios c ON c.id = l.id_cuestionario
                           WHERE l.token=?");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $enlace = $stmt->get_result()->fetch_assoc();
}

if (!$enlace) {
    $mensaje = 'Este enlace no es válido. Pide uno nuevo a quien te lo envió.';
} elseif (!(int)$enlace['activo']) {
    $mensaje = 'Este enlace fue desactivado.';
} elseif (!empty($enlace['expira']) && strtotime($enlace['expira']) < time()) {
    $mensaje = 'Este enlace ya venció.';
}

$fin = isset($_GET['fin']);
$logueado = !empty($_SESSION['id']);

// Si ya tiene un examen en curso con este enlace, lo retoma (no reinicia el reloj)
if (!$mensaje && !$fin && !$logueado
    && !empty($_SESSION['invitado']) && ($_SESSION['invitado']['token'] ?? '') === $token
    && empty($_SESSION['invitado']['terminado'])) {
    header("Location: examen.php");
    exit();
}

// COMENZAR
if (!$mensaje && !$logueado && $_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $nombre = trim(preg_replace('/\s+/', ' ', $_POST['nombre'] ?? ''));
    $largo  = mb_strlen($nombre);

    if ($largo < 3 || $largo > 80) {
        $error = 'Escribe tu nombre completo (entre 3 y 80 caracteres).';
    } else {
        session_regenerate_id(true);
        unset($_SESSION['examen']);
        $_SESSION['invitado'] = [
            'nombre'       => $nombre,
            'id_enlace'    => (int)$enlace['id'],
            'token'        => $token,
            'cuestionario' => (int)$enlace['id_cuestionario'],
            'capitulo'     => (string)$enlace['capitulo'],
            'mostrar'      => (int)$enlace['mostrar_respuestas'],
            'terminado'    => false,
        ];
        header("Location: examen.php");
        exit();
    }
}

$titulo = $enlace ? ($enlace['capitulo'] === 'final' ? 'Examen Final' : 'Capítulo ' . $enlace['capitulo']) : '';
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acceso al examen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark d-flex align-items-center justify-content-center" style="min-height:100vh">

<div class="card shadow p-4" style="width:100%; max-width:420px; border-radius:12px">

<?php if ($mensaje) { ?>
    <h4 class="text-center mb-3">Enlace no disponible</h4>
    <div class="alert alert-warning mb-0"><?= e($mensaje) ?></div>

<?php } elseif ($fin) { ?>
    <h4 class="text-center mb-3">Examen finalizado</h4>
    <div class="alert alert-success mb-0">
        Gracias<?= !empty($_SESSION['invitado']['nombre']) ? ', ' . e($_SESSION['invitado']['nombre']) : '' ?>.
        Tus respuestas fueron enviadas. Ya puedes cerrar esta ventana.
    </div>

<?php } elseif ($logueado) { ?>
    <h4 class="text-center mb-3">Ya tienes una sesión abierta</h4>
    <div class="alert alert-info mb-0">
        Estás con una cuenta iniciada en este navegador. Para probar el enlace,
        ábrelo en una ventana de incógnito o cierra sesión primero.
    </div>

<?php } else { ?>
    <h3 class="text-center mb-1"><?= e($enlace['cuestionario']) ?></h3>
    <p class="text-center text-muted mb-3"><?= e($titulo) ?></p>

    <?php if ($error) { ?><div class="alert alert-danger py-2"><?= e($error) ?></div><?php } ?>

    <form method="POST">
        <?= csrf_field() ?>
        <input type="hidden" name="t" value="<?= e($token) ?>">
        <label class="form-label">Tu nombre completo</label>
        <input name="nombre" class="form-control mb-3" maxlength="80" required autofocus
               value="<?= e($_POST['nombre'] ?? '') ?>" placeholder="Ej. Juan Pérez">
        <button class="btn btn-primary w-100">Comenzar examen</button>
        <small class="text-muted d-block mt-2">
            El examen tiene tiempo límite. El reloj empieza al presionar “Comenzar examen”.
        </small>
    </form>
<?php } ?>

</div>
</body>
</html>
