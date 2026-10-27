<?php
require __DIR__ . '/../includes/auth.php';
require __DIR__ . '/../modelo/conexion.php';
require_admin();

$cuestionarios = $con->query("SELECT id, nombre FROM cuestionarios")->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registrar Pregunta</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand"><i class="bi bi-plus-circle"></i> Registrar Pregunta</span>
    <div>
        <a href="dashboard.php" class="btn btn-secondary btn-sm"><i class="bi bi-arrow-left"></i> Dashboard</a>
        <a href="../auth/logout.php" class="btn btn-danger btn-sm"><i class="bi bi-box-arrow-right"></i> Salir</a>
    </div>
</div>
</nav>

<div class="container mt-4" style="max-width:800px">

<?php if (isset($_GET['ok'])) { ?>
    <div class="alert alert-success">✅ Pregunta guardada. Puedes registrar otra.</div>
<?php } ?>

<div class="card shadow">
<div class="card-header bg-primary text-white"><i class="bi bi-plus-circle"></i> Agregar Nueva Pregunta</div>
<div class="card-body">

<form action="guardar_pregunta.php" method="POST">
    <?= csrf_field() ?>

    <div class="mb-3">
        <label class="form-label">Pregunta</label>
        <textarea name="pregunta" class="form-control" rows="3" required></textarea>
    </div>

    <div class="row">
        <div class="col-md-6 mb-2"><input name="a" class="form-control" placeholder="Opción A" required></div>
        <div class="col-md-6 mb-2"><input name="b" class="form-control" placeholder="Opción B" required></div>
        <div class="col-md-6 mb-2"><input name="c" class="form-control" placeholder="Opción C" required></div>
        <div class="col-md-6 mb-2"><input name="d" class="form-control" placeholder="Opción D" required></div>
    </div>

    <div class="row mt-2">
        <div class="col-md-4 mb-3">
            <label class="form-label">Respuesta correcta</label>
            <select name="correcta" class="form-select" required>
                <option value="">Seleccione</option>
                <option>A</option><option>B</option><option>C</option><option>D</option>
            </select>
        </div>

        <div class="col-md-4 mb-3">
            <label class="form-label">Capítulo</label>
            <select name="capitulo" class="form-select" required>
                <option value="">Seleccione</option>
                <?php for ($i = 1; $i <= 7; $i++) { ?>
                    <option value="<?= $i ?>">Capítulo <?= $i ?></option>
                <?php } ?>
                <option value="final">EXAMEN FINAL</option>
            </select>
        </div>

        <div class="col-md-4 mb-3">
            <label class="form-label">Cuestionario</label>
            <select name="id_cuestionario" class="form-select" required>
                <option value="">Seleccione</option>
                <?php foreach ($cuestionarios as $c) { ?>
                    <option value="<?= (int)$c['id'] ?>">📘 <?= e($c['nombre']) ?></option>
                <?php } ?>
            </select>
        </div>
    </div>

    <button class="btn btn-success w-100"><i class="bi bi-save"></i> Guardar</button>
</form>

</div>
</div>
</div>
</body>
</html>
