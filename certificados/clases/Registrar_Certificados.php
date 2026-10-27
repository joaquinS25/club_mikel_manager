<?php
session_start();

if(!isset($_SESSION['id_session'])){
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>REGISTRAR CERTIFICADOS</title>

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

    /* BODY */

    body{

        font-family:Arial, Helvetica, sans-serif;

        background:linear-gradient(135deg,#0b57d0,#1e3c72);

        min-height:100vh;
    }

    /* CONTENEDOR PRINCIPAL */

    .contenedor-principal{

        display:flex;

        justify-content:center;
        align-items:center;

        min-height:calc(100vh - 80px);

        padding:40px 20px;
    }

    /* FORMULARIO */

    .contenedor{

        width:500px;

        background:white;

        padding:40px;

        border-radius:20px;

        box-shadow:0px 10px 30px rgba(0,0,0,.3);
    }

    /* TITULO */

    .titulo{

        text-align:center;

        margin-bottom:30px;
    }

    .titulo h1{

        color:#0b57d0;

        margin-bottom:10px;

        font-size:32px;
    }

    .titulo p{

        color:#666;

        font-size:15px;
    }

    /* ICONO */

    .icono{

        font-size:60px;

        text-align:center;

        margin-bottom:15px;
    }

    /* INPUTS */

    .grupo{

        margin-bottom:20px;
    }

    label{

        display:block;

        margin-bottom:8px;

        font-weight:bold;

        color:#333;
    }

    input{

        width:100%;

        padding:14px;

        border:2px solid #dcdcdc;

        border-radius:10px;

        font-size:16px;

        transition:.3s;
    }

    input:focus{

        border-color:#0b57d0;

        outline:none;

        box-shadow:0px 0px 10px rgba(11,87,208,.2);
    }

    /* BOTON */

    button{

        width:100%;

        padding:15px;

        background:#0b57d0;

        color:white;

        border:none;

        border-radius:10px;

        font-size:18px;

        font-weight:bold;

        cursor:pointer;

        transition:.3s;
    }

    button:hover{

        background:#084298;

        transform:scale(1.02);
    }

    /* RESPONSIVE */

    @media(max-width:600px){

        .contenedor{

            width:100%;
        }

    }
    select{

        width:100%;

        padding:14px;

        border:2px solid #dcdcdc;

        border-radius:10px;

        font-size:16px;

        transition:.3s;

        background:white;
    }

    select:focus{

        border-color:#0b57d0;

        outline:none;

        box-shadow:0px 0px 10px rgba(11,87,208,.2);
    }
</style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php
         require("../../vista/menuv.php");
        ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php
                    require("../../vista/menuh.php");
                ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                   
                    <!-- CONTENIDO -->

                    <div class="contenedor-principal">

                        <div class="contenedor">

                            <div class="titulo">

                                <div class="icono">
                                    📜
                                </div>

                                <h1>Generador de Certificados</h1>

                                <p>Complete los datos para generar el certificado</p>

                            </div>

                            <form action="generar.php"
                                method="POST"
                                enctype="multipart/form-data">

                                <!-- NOMBRE -->

                                <div class="grupo">

                                    <label>Nombre Completo</label>

                                    <input type="text"
                                        name="nombre"
                                        placeholder="Ingrese el nombre completo"
                                        required>

                                </div>

                                <!-- FECHA -->

                                <div class="grupo">

                                    <label>Fecha</label>

                                    <input type="date"
                                        name="fecha"
                                        required>

                                </div>

                                <!-- LOGO CLUB -->

                                <div class="grupo">

                                    <label>Logo del Club</label>

                                    <input type="file"
                                        name="logo_club"
                                        accept="image/*"
                                        required>

                                </div>

                                <!-- LOGO CONQUISTADORES -->

                                <div class="grupo">

                                    <label>Logo de Conquistadores</label>

                                    <input type="file"
                                        name="logo_conquistadores"
                                        accept="image/*"
                                        required>

                                </div>
                                <!-- CLASE BIBLICA -->

                                <div class="grupo">

                                    <label>Clase Bíblica</label>

                                    <select name="clase_biblica" required>

                                        <option value="">
                                            Seleccione una clase bíblica
                                        </option>

                                        <option value="Joyas de la Eternidad">
                                            JOYAS DE LA ETERNIDAD
                                        </option>

                                        <option value="Sumergidos en la Palabra">
                                            SUMERGIDOS EN LA PALABRA
                                        </option>

                                    </select>

                                </div>
                                <!-- BOTON -->

                                <button type="submit">
                                    GENERAR CERTIFICADO
                                </button>

                            </form>

                        </div>

                    </div>
                                    
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <?php
                require("../../vista/footer.php");
            ?>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

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
                    <a class="btn btn-primary" href="../logout.php">Logout</a>
                </div>
            </div>
        </div>
    </div>

   <?php
         require("../../vista/script.php");
    ?>


</body>

</html>