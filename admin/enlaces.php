<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

$capitulosValidos = ['1','2','3','4','5','6','7','final'];
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $accion = $_POST['accion'] ?? '';

    if ($accion === 'crear') {
        $idc  = (int)($_POST['id_cuestionario'] ?? 0);
        $cap  = (string)($_POST['capitulo'] ?? '');
        $etq  = mb_substr(trim($_POST['etiqueta'] ?? ''), 0, 100);
        $mostrar = isset($_POST['mostrar_respuestas']) ? 1 : 0;
        $expira = null;
        if (trim($_POST['expira'] ?? '') !== '' && ($t = strtotime($_POST['expira']))) {
            $expira = date('Y-m-d H:i:s', $t);
        }

        $stmt = $con->prepare("SELECT COUNT(*) FROM cuestionarios WHERE id=?");
        $stmt->bind_param("i", $idc);
        $stmt->execute();
        $existe = (int)$stmt->get_result()->fetch_row()[0] > 0;

        if (!$existe || !in_array($cap, $capitulosValidos, true)) {
            $error = 'Elige un cuestionario y un capítulo válidos.';
        } else {
            $token = bin2hex(random_bytes(16));
            $stmt = $con->prepare("INSERT INTO enlaces_examen (token, id_cuestionario, capitulo, etiqueta, mostrar_respuestas, expira)
                                   VALUES (?,?,?,?,?,?)");
            $stmt->bind_param("sissis", $token, $idc, $cap, $etq, $mostrar, $expira);
            $stmt->execute();
            header("Location: enlaces.php?ok=1"); exit();
        }
    } elseif ($accion === 'toggle') {
        $id = (int)($_POST['id'] ?? 0);
        $stmt = $con->prepare("UPDATE enlaces_examen SET activo = 1 - activo WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        header("Location: enlaces.php"); exit();
    } elseif ($accion === 'eliminar') {
        $id = (int)($_POST['id'] ?? 0);
        $stmt = $con->prepare("DELETE FROM enlaces_examen WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        header("Location: enlaces.php"); exit();
    }
}

$cuestionarios = $con->query("SELECT id, nombre FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
$enlaces = $con->query("
    SELECT l.*, c.nombre AS cuestionario,
           (SELECT COUNT(*) FROM resultados r WHERE r.id_enlace = l.id) AS participantes
    FROM enlaces_examen l
    LEFT JOIN cuestionarios c ON c.id = l.id_cuestionario
    ORDER BY l.id DESC
")->fetch_all(MYSQLI_ASSOC);

// URL base del enlace público (…/user/acceso.php?t=)
$esquema = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$base = $esquema . '://' . $_SERVER['HTTP_HOST'] . rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/\\') . '/user/acceso.php?t=';
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Enlaces de examen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-link-45deg"></i> Enlaces de examen</span>
    <div>
        <a href="dashboard.php" class="btn btn-secondary btn-sm"><i class="bi bi-arrow-left"></i> Dashboard</a>
        <a href="../auth/logout.php" class="btn btn-danger btn-sm"><i class="bi bi-box-arrow-right"></i> Salir</a>
    </div>
</div>
</nav>

<div class="container mt-4">

<?php if (isset($_GET['ok'])) { ?><div class="alert alert-success">✅ Enlace creado. Cópialo y envíalo al estudiante.</div><?php } ?>
<?php if ($error) { ?><div class="alert alert-danger"><?= e($error) ?></div><?php } ?>

<div class="card shadow mb-4">
<div class="card-header bg-primary text-white"><i class="bi bi-plus-circle"></i> Crear enlace nuevo</div>
<div class="card-body">
<form method="POST" class="row g-3">
    <?= csrf_field() ?>
    <input type="hidden" name="accion" value="crear">

    <div class="col-md-4">
        <label class="form-label">Cuestionario</label>
        <select name="id_cuestionario" class="form-select" required>
            <option value="">Seleccione</option>
            <?php foreach ($cuestionarios as $c) { ?>
                <option value="<?= (int)$c['id'] ?>"><?= e($c['nombre']) ?></option>
            <?php } ?>
        </select>
    </div>
    <div class="col-md-3">
        <label class="form-label">Examen</label>
        <select name="capitulo" class="form-select" required>
            <?php for ($i = 1; $i <= 7; $i++) { ?><option value="<?= $i ?>">Capítulo <?= $i ?></option><?php } ?>
            <option value="final" selected>Examen Final</option>
        </select>
    </div>
    <div class="col-md-5">
        <label class="form-label">Etiqueta (opcional)</label>
        <input name="etiqueta" class="form-control" maxlength="100" placeholder="Ej. Grupo de marzo">
    </div>
    <div class="col-md-4">
        <label class="form-label">Vence el (opcional)</label>
        <input type="datetime-local" name="expira" class="form-control">
    </div>
    <div class="col-md-5 d-flex align-items-end">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="mostrar_respuestas" id="mr" checked>
            <label class="form-check-label" for="mr">Mostrar respuestas correctas al terminar</label>
        </div>
    </div>
    <div class="col-md-3 d-flex align-items-end">
        <button class="btn btn-success w-100"><i class="bi bi-link-45deg"></i> Crear enlace</button>
    </div>
</form>
</div>
</div>

<div class="card shadow">
<div class="card-header bg-dark text-white"><i class="bi bi-list"></i> Enlaces creados</div>
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-bordered align-middle">
    <thead class="table-dark text-center">
        <tr><th>Examen</th><th>Estado</th><th>Participantes</th><th style="min-width:340px">Enlace</th><th>Acciones</th></tr>
    </thead>
    <tbody>
    <?php foreach ($enlaces as $l) {
        $vencido = !empty($l['expira']) && strtotime($l['expira']) < time();
        $url = $base . $l['token'];
    ?>
        <tr>
            <td>
                <b><?= e($l['cuestionario'] ?? '—') ?></b><br>
                <small><?= $l['capitulo'] === 'final' ? '🔥 Examen Final' : '📘 Capítulo ' . e($l['capitulo']) ?></small>
                <?php if ($l['etiqueta']) { ?><br><small class="text-muted"><?= e($l['etiqueta']) ?></small><?php } ?>
                <?php if ($l['expira']) { ?><br><small class="text-muted">Vence: <?= e($l['expira']) ?></small><?php } ?>
            </td>
            <td class="text-center">
                <?php if ($vencido) { ?><span class="badge bg-secondary">Vencido</span>
                <?php } elseif ($l['activo']) { ?><span class="badge bg-success">Activo</span>
                <?php } else { ?><span class="badge bg-danger">Desactivado</span><?php } ?>
            </td>
            <td class="text-center">
                <a href="resultados.php?enlace=<?= (int)$l['id'] ?>"><?= (int)$l['participantes'] ?> ver</a>
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <input class="form-control" value="<?= e($url) ?>" readonly onclick="this.select()">
                    <button type="button" class="btn btn-outline-primary" onclick="copiar(this)"><i class="bi bi-clipboard"></i> Copiar</button>
                </div>
            </td>
            <td class="text-center text-nowrap">
                <form method="POST" class="d-inline">
                    <?= csrf_field() ?>
                    <input type="hidden" name="accion" value="toggle">
                    <input type="hidden" name="id" value="<?= (int)$l['id'] ?>">
                    <button class="btn btn-warning btn-sm" title="Activar / desactivar"><i class="bi bi-power"></i></button>
                </form>
                <form method="POST" class="d-inline" onsubmit="return confirm('¿Eliminar este enlace? Los resultados se conservan.')">
                    <?= csrf_field() ?>
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<?= (int)$l['id'] ?>">
                    <button class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
                </form>
            </td>
        </tr>
    <?php } ?>
    <?php if (!$enlaces) { ?>
        <tr><td colspan="5" class="text-center text-muted">Aún no hay enlaces.</td></tr>
    <?php } ?>
    </tbody>
</table>
</div>
</div>
</div>
</div>

<script>
function copiar(btn){
    const input = btn.parentElement.querySelector("input");
    input.select();
    const ok = () => { const t = btn.innerHTML; btn.innerHTML = '<i class="bi bi-check2"></i> Copiado'; setTimeout(()=>btn.innerHTML = t, 1500); };
    if(navigator.clipboard && window.isSecureContext){
        navigator.clipboard.writeText(input.value).then(ok);
    } else {
        document.execCommand("copy"); ok();
    }
}
</script>
</body>
</html>
