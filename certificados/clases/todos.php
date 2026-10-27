<?php
session_start();

if(!isset($_SESSION['id_session'])){
    header("Location: index.php");
    exit();
}
include '../conexion.php';

$sql = "SELECT * FROM certificados
ORDER BY id DESC";

$resultado = mysqli_query($conn,$sql);
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CERTIFCADOS DE CLASES BIBLICAS</title>
<!-- FUENTE -->

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<!-- LIBRERIAS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

   <?php
         require("../../vista/style.php");
         require("../../vista/estilos.php");
    ?>
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    background:#f0f2f5;

    font-family:'Montserrat',sans-serif;
}

/* BOTON */

.acciones{

    width:100%;

    display:flex;

    justify-content:center;

    margin:30px 0;
}

.acciones button{

    padding:15px 35px;

    background:#0b57d0;

    color:white;

    border:none;

    border-radius:12px;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:.3s;
}

.acciones button:hover{

    background:#0845a8;
}

/* GALERIA */

.galeria{

    width:100%;

    padding:20px;

    display:grid;

    grid-template-columns:repeat(2, 1fr);

    gap:30px;

    justify-items:center;

    align-items:start;
}
.contenedorCertificado{

    position:relative;
}
.checkCertificado{

    position:absolute;

    top:15px;
    left:15px;

    width:25px;
    height:25px;

    z-index:999;

    cursor:pointer;
}
/* RESPONSIVE */

@media(max-width:1500px){

    .galeria{

        grid-template-columns:1fr;
    }
}

/* CERTIFICADO */

.certificado{

    position:relative;

    width:680px;
    height:480px;

    background:
    linear-gradient(
        to bottom,
        #ffffff,
        #faf8f2
    );

    border:2px solid #222;

    overflow:hidden;

    box-shadow:
    0 10px 25px rgba(0,0,0,.15);
}

/* RESPONSIVE MOVIL */

@media(max-width:760px){

    .certificado{

        width:95%;
        height:460px;
    }
}

/* BORDE INTERNO */

.certificado::before{

    content:"";

    position:absolute;

    top:10px;
    left:10px;
    right:10px;
    bottom:10px;

    border:2px solid #555;
}

/* LOGOS */

.logoClub{

    position:absolute;

    top:20px;
    left:25px;

    width:70px;
    height:70px;

    object-fit:contain;
}

.logoConquistadores{

    position:absolute;

    top:20px;
    right:25px;

    width:70px;
    height:70px;

    object-fit:contain;
}

/* TITULOS */

.titulo1{

    position:absolute;

    top:40px;

    width:100%;

    text-align:center;

    font-size:32px;

    font-weight:800;

    letter-spacing:1px;
}

.titulo2{

    position:absolute;

    top:82px;

    width:100%;

    text-align:center;

    font-size:44px;

    font-weight:800;
}

/* TEXTO */

.texto1{

    position:absolute;

    top:155px;

    width:100%;

    text-align:center;

    font-size:20px;

    font-weight:500;
}

/* DECORACION */

.decoracion1{

    position:absolute;

    top:185px;

    width:100%;

    text-align:center;

    font-size:26px;

    color:#c59d2a;
}

/* NOMBRE */

.nombre{

    position:absolute;

    top:205px;

    left:40px;

    width:600px;

    height:70px;

    display:flex;

    align-items:center;

    justify-content:center;

    text-align:center;

    font-size:22px;

    font-weight:800;

    line-height:1.2;

    word-break:break-word;

    overflow:hidden;

    padding:0 10px;
}

/* NOMBRES LARGOS */

.nombreLargo{

    font-size:18px;
}

/* LINEA */

.lineaNombre{

    position:absolute;

    top:255px;

    left:80px;

    width:520px;

    border-bottom:2px solid #c59d2a;
}

/* DESCRIPCION */

.descripcion{

    position:absolute;

    top:260px;

    width:100%;

    text-align:center;

    font-size:20px;
}

/* LINEA CENTRAL */

.descripcion2{

    position:absolute;

    top:290px;

    left:90px;

    width:520px;

    text-align:center;

    font-size:30px;

    font-weight:700;

    color:#000;
}

/* DATOS */

.club{

    position:absolute;

    top:330px;

    left:70px;

    font-size:20px;
}

.fecha{

    position:absolute;

    top:330px;

    right:70px;

    font-size:20px;
}

/* FIRMAS */

.lineaFirma1{

    position:absolute;

    bottom:50px;

    left:80px;

    width:170px;

    border-bottom:2px solid black;
}

.lineaFirma2{

    position:absolute;

    bottom:50px;

    right:80px;

    width:170px;

    border-bottom:2px solid black;
}

/* TEXTOS */

.director{

    position:absolute;

    bottom:18px;

    left:85px;

    width:160px;

    text-align:center;

    font-size:17px;

    font-weight:700;
}

.instructor{

    position:absolute;

    bottom:18px;

    right:85px;

    width:160px;

    text-align:center;

    font-size:17px;

    font-weight:700;
}

/* IMPRESION */

@media print{

    .acciones,
    .navbar{

        display:none;
    }

    body{

        background:white;
    }

    .galeria{

        display:block;
    }

    .certificado{

        margin:auto;

        margin-bottom:20px;
    }
}

</style>


</head>

<body id="page-top">

    <!-- Page Wrapper -->
     <div id="wrapper">

        <?php require("../../vista/menuv.php"); ?>

        <div id="content-wrapper" class="d-flex flex-column">

            <div id="content">

                    <!-- Topbar -->
                    <?php
                        require("../../vista/menuh.php");
                    ?>
                    <!-- End of Topbar -->

                    <div class="container-fluid">

                        <div class="acciones">

                            <button onclick="descargarPDF()">
                                Descargar PDF
                            </button>
                            <button onclick="descargarSeleccionados()">
                                Descargar Seleccionados
                            </button>
                        </div>

                        <div class="galeria">

                            <?php while($fila = mysqli_fetch_assoc($resultado)){

                            $fecha =
                            date("d/m/Y",
                            strtotime($fila['fecha']));

                            $nombre =
                            strtoupper($fila['nombre']);

                            $claseNombre = "nombre";

                            if(strlen($nombre) > 30){

                                $claseNombre .= " nombreLargo";
                            }

                            ?>

                                <div class="contenedorCertificado">

                                    <input type="checkbox"
                                        class="checkCertificado">

                                    <div class="certificado">

                                    <!-- LOGOS -->

                                    <img class="logoClub"
                                    src="../logos/<?php echo $fila['logo_club']; ?>">

                                    <img class="logoConquistadores"
                                    src="../logos/<?php echo $fila['logo_conquistadores']; ?>">

                                    <!-- TITULOS -->

                                    <div class="titulo1">
                                        CERTIFICADO DE
                                    </div>

                                    <div class="titulo2">
                                        CLASE BÍBLICA
                                    </div>

                                    <!-- TEXTO -->

                                    <div class="texto1">
                                        Se otorga el presente certificado a:
                                    </div>

                                    <!-- DECORACION -->

                                    <div class="decoracion1">
                                        ✦ ✦ ✦
                                    </div>

                                    <!-- NOMBRE -->

                                    <div class="<?php echo $claseNombre; ?>">

                                        <?php echo $nombre; ?>

                                    </div>

                                    <!-- LINEA -->

                                    <div class="lineaNombre"></div>

                                    <!-- DESCRIPCION -->

                                    <div class="descripcion">
                                        Por haber cumplido satisfactoriamente la clase bíblica
                                    </div>

                                    <!-- LINEA CENTRAL -->

                                    <div class="descripcion2">

                                        <?php echo $fila['clase_biblica']; ?>

                                    </div>

                                    <!-- DATOS -->

                                    <div class="club">
                                        <b>Club:</b> Mikel
                                    </div>

                                    <div class="fecha">
                                        <b>Fecha:</b> <?php echo $fecha; ?>
                                    </div>

                                    <!-- FIRMAS -->

                                    <div class="lineaFirma1"></div>

                                    <div class="lineaFirma2"></div>

                                    <!-- TEXTOS -->

                                    <div class="director">
                                        DIRECTOR
                                    </div>

                                    <div class="instructor">
                                        INSTRUCTOR
                                    </div>

                                    </div>

                                </div>

                            <?php } ?>

                        </div>

                    </div>

            </div>

            <?php require("../../vista/footer.php"); ?>

        </div>

    </div>
  
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="/club_mikel_manager/logout.php">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

   <?php
         require("../../vista/script.php");
    ?>


</body>
<script>

    async function descargarPDF(){

        const { jsPDF } = window.jspdf;

        const pdf = new jsPDF({

            orientation:'landscape',

            unit:'mm',

            format:'a4'
        });

        const certificados =
        document.querySelectorAll('.certificado');

        /* POSICIONES PDF */

        const posiciones = [

            {x:5, y:5},
            {x:145, y:5},

            {x:5, y:104},
            {x:145, y:104}
        ];

        let contador = 0;

        for(let i = 0;
            i < certificados.length;
            i++){

            const canvas =
            await html2canvas(

                certificados[i],

                {
                    scale:2,

                    useCORS:true,

                    backgroundColor:"#ffffff"
                }
            );

            const imgData =
            canvas.toDataURL(
            'image/jpeg',
            1.0);

            const pos =
            posiciones[contador];

            pdf.addImage(

                imgData,

                'JPEG',

                pos.x,
                pos.y,

                140,
                99
            );

            contador++;

            /* NUEVA PAGINA */

            if(contador == 4 &&
            i != certificados.length - 1){

                pdf.addPage();

                contador = 0;
            }
        }

        pdf.save(
        'certificados_clases_biblicas_2026.pdf'
        );
    }
    async function descargarSeleccionados(){

        const { jsPDF } = window.jspdf;

        const pdf = new jsPDF({

            orientation:'landscape',

            unit:'mm',

            format:'a4'
        });

        const checks =
        document.querySelectorAll('.checkCertificado');

        let certificadosSeleccionados = [];

        checks.forEach((check)=>{

            if(check.checked){

                certificadosSeleccionados.push(

                    check.nextElementSibling
                );
            }
        });

        if(certificadosSeleccionados.length == 0){

            alert('Seleccione al menos un certificado');

            return;
        }

        const posiciones = [

            {x:5, y:5},
            {x:145, y:5},

            {x:5, y:104},
            {x:145, y:104}
        ];

        let contador = 0;

        for(let i = 0;
            i < certificadosSeleccionados.length;
            i++){

            const canvas =
            await html2canvas(

                certificadosSeleccionados[i],

                {
                    scale:2,

                    useCORS:true,

                    backgroundColor:"#ffffff"
                }
            );

            const imgData =
            canvas.toDataURL(
            'image/jpeg',
            1.0);

            const pos =
            posiciones[contador];

            pdf.addImage(

                imgData,

                'JPEG',

                pos.x,
                pos.y,

                140,
                99
            );

            contador++;

            if(contador == 4 &&
            i != certificadosSeleccionados.length - 1){

                pdf.addPage();

                contador = 0;
            }
        }

        pdf.save(
        'certificados_seleccionados.pdf'
        );
    }
</script>
</html>