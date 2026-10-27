<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

$error = '';

// 📝 GUARDAR
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $nombre = trim($_POST['nombre'] ?? '');

    $permitidos = ['image/jpeg' => 'jpg', 'image/png' => 'png', 'image/webp' => 'webp'];
    $tmp  = $_FILES['imagen']['tmp_name'] ?? '';
    $mime = ($tmp && is_uploaded_file($tmp)) ? (new finfo(FILEINFO_MIME_TYPE))->file($tmp) : '';

    if ($nombre === '') {
        $error = 'Escribe un nombre.';
    } elseif (!isset($permitidos[$mime])) {
        $error = 'La imagen debe ser JPG, PNG o WEBP.';
    } elseif ($_FILES['imagen']['size'] > 2 * 1024 * 1024) {
        $error = 'La imagen no puede pesar más de 2 MB.';
    } else {
        $archivo = bin2hex(random_bytes(8)) . '.' . $permitidos[$mime];   // nombre aleatorio
        $dir = __DIR__ . '/../img/cuestionarios/';
        if (!is_dir($dir)) mkdir($dir, 0755, true);
        move_uploaded_file($tmp, $dir . $archivo);

        $stmt = $con->prepare("INSERT INTO cuestionarios(nombre, imagen) VALUES (?,?)");
        $stmt->bind_param("ss", $nombre, $archivo);
        $stmt->execute();

        header("Location: cuestionarios.php");
        exit();
    }
}

$lista = $con->query("SELECT * FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cuestionarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>.card-hover:hover{ transform:scale(1.05); transition:.3s; }</style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-book"></i> Gestión de Cuestionarios</span>
    <div>
        <a href="dashboard.php" class="btn btn-secondary btn-sm"><i class="bi bi-arrow-left"></i> Dashboard</a>
        <a href="../auth/logout.php" class="btn btn-danger btn-sm"><i class="bi bi-box-arrow-right"></i> Salir</a>
    </div>
</div>
</nav>

<div class="container mt-4">
<div class="row">

    <div class="col-md-4 mb-4">
        <div class="card shadow p-3">
            <h5><i class="bi bi-plus-circle"></i> Nuevo Cuestionario</h5>

            <?php if ($error) { ?><div class="alert alert-danger py-2"><?= e($error) ?></div><?php } ?>

            <form method="POST" enctype="multipart/form-data">
                <?= csrf_field() ?>
                <input name="nombre" class="form-control mb-2" placeholder="Nombre del cuestionario" required>
                <input type="file" name="imagen" accept="image/jpeg,image/png,image/webp" class="form-control mb-2" required>
                <small class="text-muted d-block mb-2">JPG, PNG o WEBP. Máx. 2 MB.</small>
                <button class="btn btn-success w-100"><i class="bi bi-save"></i> Guardar</button>
            </form>
        </div>
    </div>

    <div class="col-md-8">
        <div class="row g-3">
        <?php foreach ($lista as $c) { ?>
            <div class="col-md-4 col-sm-6">
                <div class="card text-center p-2 shadow card-hover">
                    <h6><?= e($c['nombre']) ?></h6>
                    <img src="../img/cuestionarios/<?= e($c['imagen']) ?>" class="img-fluid mb-2" style="height:120px; object-fit:cover;" alt="">

                    <div class="d-flex justify-content-center gap-2">
                        <a href="../user/seleccionar_examen.php?cuestionario=<?= (int)$c['id'] ?>" class="btn btn-primary btn-sm"><i class="bi bi-play"></i></a>

                        <form action="eliminar_cuestionario.php" method="POST" class="d-inline"
                              onsubmit="return confirm('¿Eliminar el cuestionario y TODAS sus preguntas?')">
                            <?= csrf_field() ?>
                            <input type="hidden" name="id" value="<?= (int)$c['id'] ?>">
                            <button class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        <?php } ?>
        </div>
    </div>

</div>
</div>
</body>
</html>
