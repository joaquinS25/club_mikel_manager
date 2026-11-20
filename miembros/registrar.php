<?php
session_start();
require_once __DIR__ . '/../vista/config.php';

if (!isset($_SESSION['id_session'])) {
    header('Location: ' . $base . 'index.php');
    exit();
}

require_once __DIR__ . '/../modelo/conexion.php'; // define $con (mysqli)

// ---------- Listas ----------
$funciones = ['DIRECTOR','SUBDIRECTOR','SECRETARIO','TESORERO','CAPELLÁN','CONSEJERO','INSTRUCTOR',
              'CONQUISTADOR','CAMILLERO DE LA UNIDAD','SECRETARIO DE LA UNIDAD','TESORERO DE LA UNIDAD',
              'CAPITÁN DE LA UNIDAD','CONSEJERO DE LA UNIDAD'];
$estados   = ['SOLTERO(A)','CASADO(A)','DIVORCIADO(A)','VIUDO(A)','CONVIVIENTE'];
$tallas    = ['6','8','10','12','14','16','XS','S','M','L','XL','XXL'];
$deptos    = ['Amazonas','Áncash','Apurímac','Arequipa','Ayacucho','Cajamarca','Callao','Cusco','Huancavelica',
              'Huánuco','Ica','Junín','La Libertad','Lambayeque','Lima','Loreto','Madre de Dios','Moquegua',
              'Pasco','Piura','Puno','San Martín','Tacna','Tumbes','Ucayali'];

// ---------- Token CSRF ----------
if (empty($_SESSION['csrf'])) {
    $_SESSION['csrf'] = bin2hex(random_bytes(32));
}

function old($k) { return htmlspecialchars($_POST[$k] ?? '', ENT_QUOTES, 'UTF-8'); }

function campo($label, $name, $ph = '', $req = false, $type = 'text') {
    echo '<div class="form-group row border-bottom py-2 mb-0">
        <label class="col-sm-3 col-form-label text-sm-right">' . ($req ? '*' : '') . $label . ':</label>
        <div class="col-sm-9"><input type="' . $type . '" name="' . $name . '" class="form-control bg-light"
        placeholder="' . $ph . '" value="' . old($name) . '"' . ($req ? ' required' : '') . '></div></div>';
}

function selectorCampo($label, $name, $texto, $opciones, $req = true) {
    echo '<div class="form-group row border-bottom py-2 mb-0">
        <label class="col-sm-3 col-form-label text-sm-right">' . ($req ? '*' : '') . $label . ':</label>
        <div class="col-sm-9"><select name="' . $name . '" class="form-control bg-light"' . ($req ? ' required' : '') . '>
        <option value="">' . $texto . '</option>';
    foreach ($opciones as $o) {
        $sel = (($_POST[$name] ?? '') === $o) ? ' selected' : '';
        echo '<option value="' . htmlspecialchars($o) . '"' . $sel . '>' . htmlspecialchars($o) . '</option>';
    }
    echo '</select></div></div>';
}

// ---------- Guardar ----------
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idManual = trim($_POST['id'] ?? '');

    if (!hash_equals($_SESSION['csrf'], $_POST['csrf'] ?? '')) {
        $error = 'Sesión de formulario inválida. Recarga la página e inténtalo de nuevo.';
    } elseif ($idManual !== '' && (!ctype_digit($idManual) || (int)$idManual < 1)) {
        $error = 'El Id debe ser un número entero mayor que 0.';
    } elseif (empty($_POST['acepto'])) {
        $error = 'Debes aceptar los términos para continuar.';
    } elseif (!in_array($_POST['sexo'] ?? '', ['M', 'F'], true)) {
        $error = 'Selecciona el sexo.';
    } elseif (!empty($_POST['correo']) && !filter_var($_POST['correo'], FILTER_VALIDATE_EMAIL)) {
        $error = 'El correo electrónico no es válido.';
    } else {
        try {
            $sql = "INSERT INTO miembros
                (id, funcion, nombre, sexo, fecha_nacimiento, estado_civil, talla, bautizado, dni, organo_emisor,
                 telefono, celular, correo, departamento, ciudad, codigo_postal, direccion, barrio, idioma,
                 acepto_terminos, fecha_aceptacion)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,NOW())";
            $st = $con->prepare($sql);

            // bind_param solo acepta variables (no expresiones como trim(...) ni $_POST[...])
            $id        = ($idManual === '') ? null : (int)$idManual; // null = autoincremental
            $funcion   = $_POST['funcion'];
            $nombre    = mb_strtoupper(trim($_POST['nombre']), 'UTF-8');
            $sexo      = $_POST['sexo'];
            $fecha     = !empty($_POST['fecha_nacimiento']) ? $_POST['fecha_nacimiento'] : null;
            $estadoCiv = $_POST['estado_civil'];
            $talla     = $_POST['talla'];
            $bautizado = isset($_POST['bautizado']) ? 1 : 0;
            $dni       = trim($_POST['dni']);
            $organo    = trim($_POST['organo_emisor']);
            $telefono  = $_POST['telefono'] ?? '';
            $celular   = $_POST['celular'] ?? '';
            $correo    = $_POST['correo'] ?? '';
            $depto     = $_POST['departamento'];
            $ciudad    = trim($_POST['ciudad']);
            $cp        = $_POST['codigo_postal'] ?? '';
            $direccion = $_POST['direccion'] ?? '';
            $barrio    = $_POST['barrio'] ?? '';
            $idioma    = $_POST['idioma'] ?? 'ES';

            $st->bind_param(
                'i' . 'ssssss' . 'i' . str_repeat('s', 11),
                $id, $funcion, $nombre, $sexo, $fecha, $estadoCiv, $talla,
                $bautizado, $dni, $organo,
                $telefono, $celular, $correo,
                $depto, $ciudad, $cp,
                $direccion, $barrio, $idioma
            );
            $st->execute();

            $_SESSION['ok'] = 'Miembro registrado con el Id ' . ($id ?? $con->insert_id);
            header('Location: ' . $base . 'miembros/listar.php');
            exit();
        } catch (mysqli_sql_exception $e) {
            if ($e->getCode() == 1062) {
                $error = (stripos($e->getMessage(), 'PRIMARY') !== false)
                    ? 'Ya existe un miembro con ese Id.'
                    : 'Ya existe un miembro registrado con ese DNI.';
            } else {
                $error = 'No se pudo guardar el registro. Inténtalo de nuevo.';
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro de miembros - Club Mikel</title>
    <?php require __DIR__ . '/../vista/style.php'; ?>
    <style>
        .seccion h5 { letter-spacing: 1px; text-transform: uppercase; }
        .seccion small { letter-spacing: 1px; text-transform: uppercase; color: #5a5c69; }
        .terminos { height: 220px; overflow-y: scroll; border: 2px solid #ccc; padding: 15px; background: #fff; }
    </style>
</head>
<body id="page-top">
<div id="wrapper">

    <?php require __DIR__ . '/../vista/menuv.php'; ?>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">

            <?php require __DIR__ . '/../vista/menuh.php'; ?>

            <div class="container-fluid">

                <div class="card shadow mb-4 text-center">
                    <div class="card-body">
                        <h4 class="text-uppercase mb-1">Registro de miembros</h4>
                        <small class="text-uppercase">*Asterisco indica datos que son obligatorios</small>
                    </div>
                </div>

                <?php if ($error): ?>
                    <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
                <?php endif; ?>

                <form method="post" autocomplete="off">
                    <input type="hidden" name="csrf" value="<?= $_SESSION['csrf'] ?>">

                    <!-- IDENTIFICACIÓN -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Identificación</h5>
                            <small>Finalización obligatoria</small>
                        </div>
                        <?php
                        campo('Id (opcional)', 'id', 'Déjalo vacío para generar uno automático', false, 'number');
                        selectorCampo('Función', 'funcion', 'SELECCIONE LA FUNCIÓN DE ESTE MIEMBRO...', $funciones);
                        campo('Nombre y apellido', 'nombre', 'Nombre completo sin abreviaturas', true);
                        ?>
                        <div class="form-group row border-bottom py-2 mb-0">
                            <label class="col-sm-3 col-form-label text-sm-right">*Sexo:</label>
                            <div class="col-sm-9 pt-2">
                                <label class="mr-3"><input type="radio" name="sexo" value="M" required
                                    <?= (($_POST['sexo'] ?? '') === 'M') ? 'checked' : '' ?>> Masculino</label>
                                <label><input type="radio" name="sexo" value="F"
                                    <?= (($_POST['sexo'] ?? '') === 'F') ? 'checked' : '' ?>> Femenino</label>
                            </div>
                        </div>
                        <?php
                        campo('Fecha de nacimiento', 'fecha_nacimiento', '', false, 'date');
                        selectorCampo('Estado civil', 'estado_civil', 'SELECCIONE EL ESTADO CIVIL', $estados);
                        selectorCampo('Tamaño camiseta', 'talla', 'SELECCIONE EL TAMAÑO DE LA CAMISETA', $tallas);
                        ?>
                        <div class="form-group row py-2 mb-0">
                            <label class="col-sm-3 col-form-label text-sm-right">Bautizado (IASD)?:</label>
                            <div class="col-sm-9 pt-2">
                                <input type="checkbox" name="bautizado" value="1" <?= isset($_POST['bautizado']) ? 'checked' : '' ?>>
                            </div>
                        </div>
                    </div>

                    <!-- DOCUMENTOS -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Documentos</h5>
                            <small>Finalización obligatoria</small>
                        </div>
                        <?php
                        campo('DNI', 'dni', 'Identificación del documento de identidad', true);
                        campo('Órgano emisor', 'organo_emisor', 'Organismo emisor del documento de identidad', true);
                        ?>
                    </div>

                    <!-- CONTACTO -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Contacto</h5>
                            <small>Relleno opcional</small>
                            <p class="small text-uppercase mt-2 mb-0">Todos los contactos son opcionales, pero completarlo puede resultar útil en casos de emergencia.</p>
                        </div>
                        <?php
                        campo('Teléfono', 'telefono', 'Formato: (99) 999 999 999');
                        campo('Celular', 'celular', 'Formato: (99) 999 999 999');
                        campo('Correo electrónico', 'correo', 'Correo electrónico personal del contacto', false, 'email');
                        ?>
                    </div>

                    <!-- DIRECCIÓN -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Dirección</h5>
                            <p class="small text-uppercase mb-0">Departamento y ciudad son obligatorios, el resto de la dirección es opcional.</p>
                        </div>
                        <?php
                        selectorCampo('Provincia/Departamento', 'departamento', 'SELECCIONE LA PROVINCIA/DEPARTAMENTO...', $deptos);
                        campo('Ciudad', 'ciudad', 'Ciudad de residencia', true);
                        campo('Código Postal', 'codigo_postal', 'Código postal de dirección residencial');
                        campo('Dirección', 'direccion', 'Calle y número de casa');
                        campo('Barrio', 'barrio', 'Barrio o lugar de residencia');
                        ?>
                    </div>

                    <!-- IDIOMA -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Idioma</h5>
                            <small>Idioma de acceso - Sistema de gestión de clubes</small>
                        </div>
                        <div class="form-group row py-2 mb-0">
                            <label class="col-sm-3 col-form-label text-sm-right">Idioma de acceso:</label>
                            <div class="col-sm-9">
                                <select name="idioma" class="form-control bg-light">
                                    <option value="ES">ESPAÑOL</option>
                                    <option value="PT">PORTUGUÊS</option>
                                    <option value="EN">ENGLISH</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- POLÍTICA DE PRIVACIDAD -->
                    <div class="card shadow mb-4 seccion">
                        <div class="card-body">
                            <h5>Política de privacidad y términos de uso</h5>
                            <small>Aceptación es obligatoria</small>
                        </div>
                        <div class="px-4 pb-3">
                            <div class="terminos">
                                <?php include __DIR__ . '/terminos.html'; ?>
                            </div>
                        </div>
                        <div class="form-group row py-2 mb-0 border-top">
                            <label class="col-sm-3 col-form-label text-sm-right">*Acepto los términos:</label>
                            <div class="col-sm-9 pt-2">
                                <input type="checkbox" name="acepto" value="1" required>
                            </div>
                        </div>
                    </div>

                    <!-- BOTONES -->
                    <div class="card shadow mb-4">
                        <div class="card-body d-flex justify-content-between">
                            <a href="<?= $base ?>miembros/listar.php" class="btn btn-secondary px-5">
                                <i class="fas fa-undo"></i> Volver
                            </a>
                            <button type="submit" class="btn btn-success px-5">
                                <i class="fas fa-save"></i> Grabar
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <?php require __DIR__ . '/../vista/footer.php'; ?>
    </div>
</div>

<?php require __DIR__ . '/../vista/script.php'; ?>
</body>
</html>