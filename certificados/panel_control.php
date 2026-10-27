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

    <title>PANEL DE CONTROL</title>

   <?php
         require("../vista/style.php");
         require("../vista/estilos.php");
    ?>
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}



/* CONTENEDOR */

.panel{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:40px;
    flex-wrap:wrap;
    padding:30px;
}

.tarjeta-certificado{
    width:350px;
    background:#fff;
    padding:40px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,.15);
    transition:.3s;
}

.tarjeta-certificado:hover{
    transform:translateY(-8px);
}

.icono{
    font-size:80px;
    margin-bottom:20px;
}

.tarjeta-certificado h2{
    color:#0b57d0;
    margin-bottom:15px;
}

.tarjeta-certificado p{
    color:#666;
    margin-bottom:25px;
}

.btn-ingresar{
    display:inline-block;
    width:100%;
    padding:15px;
    background:#0b57d0;
    color:white !important;
    text-decoration:none;
    border-radius:10px;
    font-weight:bold;
}

.btn-ingresar:hover{
    background:#0846ab;
    color:white !important;
}
/* TARJETAS */

.card{

    width:350px;

    background:white;

    padding:40px;

    border-radius:20px;

    text-align:center;

    box-shadow:0px 10px 30px rgba(0,0,0,.3);

    transition:.3s;
}

.card:hover{

    transform:translateY(-10px);
}

/* ICONO */

.icono{

    font-size:80px;

    margin-bottom:20px;
}

h2{

    margin-bottom:15px;

    color:#0b57d0;
}

p{

    color:#666;

    margin-bottom:25px;
}

/* BOTON */



</style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php
         require("../vista/menuv.php");
        ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php
                    require("../vista/menuh.php");
                ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                   
                    <div class="panel">

                        <!-- BIBLICAS -->

                        <div class="card">

                            <div class="icono">
                                📖
                            </div>

                            <h2>
                                Certificados Bíblicos
                            </h2>

                            <p>
                                Generar certificados de clases bíblicas
                            </p>

                            <a href="clases/Registrar_Certificados.php" class="btn-ingresar">
                                INGRESAR
                            </a>

                        </div>

                        <!-- ESPECIALIDADES -->

                        <div class="card">

                            <div class="icono">
                                🏕
                            </div>

                            <h2>
                                Certificados de Especialidades
                            </h2>

                            <p>
                                Generar certificados de especialidades
                            </p>

                            <a href="especialidades/Registrar_certificados.php" class="btn-ingresar">
                                INGRESAR
                            </a>

                        </div>

                    </div>
                                    
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <?php
                require("../vista/footer.php");
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
         require("../vista/script.php");
    ?>


</body>

</html>