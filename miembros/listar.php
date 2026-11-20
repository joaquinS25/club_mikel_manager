<?php
session_start();
require_once __DIR__ . '/../vista/config.php';

if (!isset($_SESSION['id_session'])) {
    header('Location: ' . $base . 'index.php');
    exit();
}

require_once __DIR__ . '/../modelo/conexion.php'; // <-- ajusta al nombre de tu archivo

$res = $con->query("
    SELECT id, dni, nombre, fecha_nacimiento,
           TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad,
           funcion, seguro, salud
    FROM miembros
    ORDER BY nombre
");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Miembros - Club Mikel</title>
    <?php require __DIR__ . '/../vista/style.php'; ?>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.bootstrap4.min.css">
</head>
<body id="page-top">
<div id="wrapper">

    <?php require __DIR__ . '/../vista/menuv.php'; ?>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">

            <?php require __DIR__ . '/../vista/menuh.php'; ?>

            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Miembros</h1>
                    <?php if (!empty($_SESSION['ok'])): ?>
                        <div class="alert alert-success"><?= htmlspecialchars($_SESSION['ok']) ?></div>
                        <?php unset($_SESSION['ok']); ?>
                    <?php endif; ?>
                    <a href="<?= $base ?>miembros/registrar.php" class="btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-plus fa-sm text-white-50"></i> Registrar miembro
                    </a>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="tablaMiembros" class="table table-hover" width="100%">
                                <thead class="text-white" style="background:#5aaee0">
                                    <tr>
                                        <th>Id</th>
                                        <th>Nombre</th>
                                        <th>Nacimiento</th>
                                        <th>Edad</th>
                                        <th>Función</th>
                                        <th>Seguro</th>
                                        <th>Salud</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php while ($m = $res->fetch_assoc()): ?>
                                    <tr>
                                        <td><?= (int)$m['id'] ?></td>
                                        <td>
                                            <a href="<?= $base ?>miembros/ficha.php?id=<?= (int)$m['id'] ?>">
                                                <?= htmlspecialchars($m['nombre']) ?>
                                            </a>
                                        </td>
                                        <td><?= date('d/m/Y', strtotime($m['fecha_nacimiento'])) ?></td>
                                        <td><?= (int)$m['edad'] ?></td>
                                        <td><?= htmlspecialchars($m['funcion']) ?></td>
                                        <td>
                                            <span class="btn btn-sm btn-block <?= $m['seguro'] === 'ACTIVO' ? 'btn-success' : 'btn-danger' ?>">
                                                <?= $m['seguro'] ?>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="btn btn-sm btn-block <?= $m['salud'] === 'ACTUALIZADO' ? 'btn-success' : 'btn-danger' ?>">
                                                <?= $m['salud'] ?>
                                            </span>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <?php require __DIR__ . '/../vista/footer.php'; ?>
    </div>
</div>

<?php require __DIR__ . '/../vista/script.php'; ?>

<!-- DataTables (después de jQuery, que ya carga script.php) -->
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.colVis.min.js"></script>

<script>
$(function () {
    $('#tablaMiembros').DataTable({
        dom: "<'row'<'col-md-8'B><'col-md-4'f>>t<'row'<'col-md-6'i><'col-md-6'p>>",
        buttons: [
            { extend: 'copy',   text: 'Copiar' },
            { extend: 'print',  text: 'Imprimir' },
            { extend: 'colvis', text: 'Columnas' },
            { extend: 'excel',  text: 'Excel' },
            { extend: 'pdf',    text: 'PDF' }
        ],
        pageLength: 25,
        language: { url: 'https://cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json' }
    });
});
</script>
</body>
</html>