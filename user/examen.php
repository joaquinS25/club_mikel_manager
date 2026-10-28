<?php
require __DIR__ . '/../includes/auth.php';      // session_start(), e(), require_login()
require __DIR__ . '/../modelo/conexion.php';
require_participante();
$invitado = es_invitado();

// ⚙️ CONFIGURACIÓN
const DURACION_CAPITULO = 20 * 60;   // 20 min
const DURACION_FINAL    = 60 * 60;   // 60 min (ajústalo a lo que necesites)
const PREGUNTAS_FINAL   = 70;

if ($invitado) {
    // El invitado NO elige: lo define el enlace (guardado en su sesión)
    $inv = $_SESSION['invitado'];
    if (!empty($inv['terminado'])) {
        header("Location: acceso.php?t=" . urlencode($inv['token']) . "&fin=1"); exit();
    }
    $capitulo     = (string)$inv['capitulo'];
    $cuestionario = (int)$inv['cuestionario'];
} else {
    $capitulo     = (string)($_GET['capitulo'] ?? 'final');
    $cuestionario = (int)($_GET['cuestionario'] ?? 0);
}
if ($cuestionario <= 0) { header("Location: panel.php"); exit(); }
$destinoFinal = $invitado ? "acceso.php?t=" . urlencode($_SESSION['invitado']['token']) . "&fin=1" : "panel.php";

$esFinal  = ($capitulo === 'final');
$duracion = $esFinal ? DURACION_FINAL : DURACION_CAPITULO;

// 🔁 ¿Hay un examen en curso del mismo capítulo? Se reanuda (no se reinicia el reloj ni se re-sortean preguntas)
$ex = $_SESSION['examen'] ?? null;
$reanudar = $ex
    && $ex['cuestionario'] === $cuestionario
    && $ex['capitulo'] === $capitulo
    && (time() - $ex['inicio']) < $ex['duracion'];

if ($reanudar) {
    $ids = array_map('intval', $ex['ids']);
    $marks = implode(',', array_fill(0, count($ids), '?'));
    $stmt = $con->prepare("SELECT * FROM preguntas WHERE id IN ($marks)");
    $stmt->bind_param(str_repeat('i', count($ids)), ...$ids);
    $stmt->execute();
    $porId = [];
    foreach ($stmt->get_result() as $row) $porId[$row['id']] = $row;
    $preguntas = [];
    foreach ($ids as $id) if (isset($porId[$id])) $preguntas[] = $porId[$id];   // respeta el orden original
} else {
    if ($esFinal) {
        $stmt = $con->prepare("SELECT * FROM preguntas WHERE id_cuestionario=? ORDER BY RAND() LIMIT " . PREGUNTAS_FINAL);
        $stmt->bind_param("i", $cuestionario);
    } else {
        $stmt = $con->prepare("SELECT * FROM preguntas WHERE capitulo=? AND id_cuestionario=?");
        $stmt->bind_param("si", $capitulo, $cuestionario);   // capitulo ahora es VARCHAR
    }
    $stmt->execute();
    $preguntas = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

    if (!$preguntas) {
        header("Location: " . ($invitado ? "acceso.php?t=" . urlencode($_SESSION['invitado']['token']) : "seleccionar_examen.php?cuestionario=$cuestionario"));
        exit();
    }

    // 💾 El SERVIDOR recuerda qué preguntas, cuándo empezó y cuánto dura
    $_SESSION['examen'] = [
        'ids'          => array_column($preguntas, 'id'),
        'cuestionario' => $cuestionario,
        'capitulo'     => $capitulo,
        'inicio'       => time(),
        'duracion'     => $duracion,
        'token'        => bin2hex(random_bytes(8)),
    ];
    $ex = $_SESSION['examen'];
}

$restante = max(0, $ex['inicio'] + $ex['duracion'] - time());
$token    = $_SESSION['examen']['token'];
$idsJs    = array_map('intval', array_column($preguntas, 'id'));
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Examen</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.pregunta-nav{ display:flex; flex-wrap:wrap; justify-content:center; gap:6px; }
.pregunta-nav button{
    width:40px; height:40px; border-radius:50%;
    border:1px solid #ced4da; background:#fff; color:#212529; position:relative;
}
.pregunta-nav button.respondido{ background:#198754; border-color:#198754; color:#fff; }
.pregunta-nav button.revisar::after{
    content:""; position:absolute; top:-2px; right:-2px;
    width:12px; height:12px; border-radius:50%; background:#ffc107; border:2px solid #fff;
}
.pregunta-nav button.activa{ outline:3px solid #0d6efd; outline-offset:2px; }

.opcion{
    display:block; padding:.75rem 1rem; border:1px solid #dee2e6;
    border-radius:10px; margin-bottom:.5rem; cursor:pointer;
}
.opcion:hover{ background:#f1f5ff; }
.opcion:has(input:checked){ background:#e7f1ff; border-color:#0d6efd; }
.opcion input{ margin-right:.5rem; }

#timer{ font-variant-numeric:tabular-nums; font-weight:600; min-width:90px; text-align:center; }
#timer.poco{ animation:parpadeo 1s steps(2) infinite; }
@keyframes parpadeo{ 50%{ opacity:.45; } }
@media (prefers-reduced-motion: reduce){ #timer.poco{ animation:none; } }
</style>
</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
    <span class="navbar-brand mb-0 h1">
        <i class="bi bi-clipboard-check"></i> <?= $invitado ? 'Participante:' : 'Bienvenido' ?> <?= e(nombre_participante()) ?>
    </span>
    <?php if (!$invitado) { ?>
    <a href="<?= CLUB_URL ?>" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left-circle"></i> Club Mikel</a>
    <?php } ?>
</div>
</nav>

<div class="container mt-4" style="max-width:900px">

<h3 class="text-center mb-3">
    <?= $esFinal ? "🔥 Examen Final" : "📘 Capítulo " . e($capitulo) ?>
</h3>

<!-- Barra superior: tiempo, progreso y salidas -->
<div class="d-flex flex-wrap align-items-center gap-3 mb-3">
    <div id="timer" class="alert alert-danger py-2 px-3 mb-0">--:--</div>

    <div class="flex-grow-1">
        <div class="progress" style="height:20px">
            <div id="barra" class="progress-bar bg-success" style="width:0%">0%</div>
        </div>
        <small class="text-muted"><span id="contador">0</span> de <?= count($preguntas) ?> respondidas</small>
    </div>

    <?php if (!$invitado) { ?>
    <div class="d-flex gap-2">
        <a href="seleccionar_examen.php?cuestionario=<?= $cuestionario ?>" class="btn btn-primary btn-sm">
            <i class="bi bi-book"></i> Capítulos
        </a>
        <a href="panel.php" class="btn btn-secondary btn-sm">
            <i class="bi bi-house"></i> Panel
        </a>
    </div>
    <?php } ?>
</div>

<!-- Navegador de preguntas -->
<div class="pregunta-nav mb-3" role="navigation" aria-label="Preguntas">
<?php foreach ($preguntas as $i => $row) { ?>
    <button type="button" id="btn<?= (int)$row['id'] ?>" onclick="ir(<?= (int)$row['id'] ?>)"
            aria-label="Pregunta <?= $i + 1 ?>"><?= $i + 1 ?></button>
<?php } ?>
</div>
<p class="text-center text-muted small">
    <span class="badge bg-success">&nbsp;</span> respondida
    <span class="badge bg-warning text-dark ms-2">&nbsp;</span> marcada para revisar
</p>

<form id="formExamen">

<?php foreach ($preguntas as $i => $row) { ?>
<div class="card p-3 mb-3 pregunta" id="p<?= (int)$row['id'] ?>" style="display:none;">
    <p class="text-muted mb-1">Pregunta <?= $i + 1 ?> de <?= count($preguntas) ?></p>
    <p class="fs-5"><b><?= e($row['pregunta']) ?></b></p>

    <?php foreach (["A","B","C","D"] as $op) { ?>
    <label class="opcion">
        <input type="radio" name="r[<?= (int)$row['id'] ?>]" value="<?= $op ?>"
               onchange="marcar(<?= (int)$row['id'] ?>)">
        <?= $op ?>. <?= e($row['opcion_' . strtolower($op)]) ?>
    </label>
    <?php } ?>

    <div class="d-flex justify-content-between align-items-center mt-3">
        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="mover(-1)">
            <i class="bi bi-arrow-left"></i> Anterior
        </button>
        <button type="button" class="btn btn-outline-warning btn-sm" onclick="alternarRevisar(<?= (int)$row['id'] ?>)">
            <i class="bi bi-flag"></i> Marcar para revisar
        </button>
        <button type="button" class="btn btn-outline-primary btn-sm" onclick="mover(1)">
            Siguiente <i class="bi bi-arrow-right"></i>
        </button>
    </div>
</div>
<?php } ?>

<button type="button" onclick="enviar()" class="btn btn-success w-100 mt-2 mb-5">
    <i class="bi bi-check2-circle"></i> Finalizar examen
</button>

</form>
</div>

<script>
const IDS      = <?= json_encode($idsJs) ?>;
const TOKEN    = <?= json_encode($token) ?>;
const DESTINO  = <?= json_encode($destinoFinal) ?>;
const KEY      = "examen_" + TOKEN;                 // autoguardado local
let   restante = <?= (int)$restante ?>;             // segundos que calcula el SERVIDOR
let   actual   = 0;
let   enviado  = false;

const total = IDS.length;
const form  = document.getElementById("formExamen");

// ---------- Estado guardado (si recarga la página no pierde nada) ----------
function leerEstado(){
    try { return JSON.parse(localStorage.getItem(KEY)) || {r:{}, rev:[]}; }
    catch(e){ return {r:{}, rev:[]}; }
}
function guardarEstado(){
    const r = {};
    IDS.forEach(id=>{
        const c = form.querySelector(`input[name="r[${id}]"]:checked`);
        if(c) r[id] = c.value;
    });
    const rev = IDS.filter(id=>document.getElementById("btn"+id).classList.contains("revisar"));
    try { localStorage.setItem(KEY, JSON.stringify({r, rev})); } catch(e){}
}
function restaurarEstado(){
    const est = leerEstado();
    Object.entries(est.r).forEach(([id,v])=>{
        const inp = form.querySelector(`input[name="r[${id}]"][value="${v}"]`);
        if(inp){ inp.checked = true; document.getElementById("btn"+id).classList.add("respondido"); }
    });
    est.rev.forEach(id=>{
        const b = document.getElementById("btn"+id);
        if(b) b.classList.add("revisar");
    });
    actualizarProgreso();
}

// ---------- Navegación ----------
function mostrar(i){
    actual = Math.max(0, Math.min(total-1, i));
    document.querySelectorAll(".pregunta").forEach(p=>p.style.display="none");
    const id = IDS[actual];
    document.getElementById("p"+id).style.display = "block";
    document.querySelectorAll(".pregunta-nav button").forEach(b=>b.classList.remove("activa"));
    document.getElementById("btn"+id).classList.add("activa");
}
function ir(id){ mostrar(IDS.indexOf(id)); }
function mover(d){ mostrar(actual + d); }

document.addEventListener("keydown", e=>{
    if(e.target.tagName === "INPUT" && e.target.type !== "radio") return;
    if(e.key === "ArrowRight") mover(1);
    if(e.key === "ArrowLeft")  mover(-1);
});

// ---------- Respuestas ----------
function marcar(id){
    document.getElementById("btn"+id).classList.add("respondido");
    actualizarProgreso();
    guardarEstado();
    // pasar a la siguiente automáticamente
    const i = IDS.indexOf(id);
    if(i < total-1) setTimeout(()=>{ if(actual === i) mostrar(i+1); }, 300);
}
function alternarRevisar(id){
    document.getElementById("btn"+id).classList.toggle("revisar");
    guardarEstado();
}
function actualizarProgreso(){
    const n = form.querySelectorAll("input[type=radio]:checked").length;
    const p = Math.round(n/total*100);
    const barra = document.getElementById("barra");
    barra.style.width = p + "%";
    barra.textContent = p + "%";
    document.getElementById("contador").textContent = n;
}
function sinResponder(){
    return IDS.filter(id=>!form.querySelector(`input[name="r[${id}]"]:checked`));
}

// ---------- Envío ----------
function mostrarResultado(html){
    Swal.fire({ title:"Resultado", html, width:800, allowOutsideClick:false })
        .then(()=>{ location.href = DESTINO; });
}
function enviarAlServidor(){
    if(enviado) return;
    enviado = true;
    clearInterval(reloj);

    fetch("procesar_respuesta.php", { method:"POST", body:new FormData(form) })
        .then(res=>{
            if(!res.ok) return res.text().then(t=>{ throw new Error(t || "Error"); });
            return res.text();
        })
        .then(html=>{
            localStorage.removeItem(KEY);
            mostrarResultado(html);
        })
        .catch(err=>{
            enviado = false;            // permite reintentar
            Swal.fire({ icon:"error", title:"No se pudo enviar", text:"Revisa tu conexión e inténtalo de nuevo. Tus respuestas siguen guardadas." });
        });
}
function enviar(){
    const faltan = sinResponder();
    const texto  = faltan.length
        ? `Te faltan ${faltan.length} pregunta(s). Las no respondidas cuentan como incorrectas.`
        : "Ya no podrás cambiar tus respuestas.";

    Swal.fire({
        title:"¿Finalizar examen?",
        text:texto,
        icon: faltan.length ? "warning" : "question",
        showCancelButton:true,
        showDenyButton: faltan.length > 0,
        confirmButtonText:"Sí, finalizar",
        denyButtonText:"Ir a la primera pendiente",
        cancelButtonText:"Seguir"
    }).then(r=>{
        if(r.isConfirmed) enviarAlServidor();
        else if(r.isDenied) ir(faltan[0]);
    });
}

// ---------- Temporizador (el servidor es la autoridad) ----------
function pintarReloj(){
    const m = Math.floor(restante/60), s = restante%60;
    const t = document.getElementById("timer");
    t.textContent = String(m).padStart(2,"0") + ":" + String(s).padStart(2,"0");
    if(restante <= 300) t.classList.add("poco");
}
const reloj = setInterval(()=>{
    restante--;
    pintarReloj();

    if(restante === 300){
        Swal.fire({ toast:true, position:"top-end", icon:"warning", title:"Quedan 5 minutos", showConfirmButton:false, timer:3500 });
    }
    if(restante <= 0){
        Swal.fire({ icon:"info", title:"Tiempo terminado", text:"Se enviará automáticamente", showConfirmButton:false, allowOutsideClick:false });
        enviarAlServidor();
    }
}, 1000);

// ---------- Inicio ----------
pintarReloj();
restaurarEstado();
mostrar(0);
if(restante <= 0) enviarAlServidor();

// 🔒 Avisar antes de salir sin enviar
window.addEventListener("beforeunload", e=>{ if(!enviado){ e.preventDefault(); e.returnValue = ""; } });
history.pushState(null, null, location.href);
window.onpopstate = ()=> history.go(1);
</script>

</body>
</html>
