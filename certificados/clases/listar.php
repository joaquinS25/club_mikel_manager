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

    <title>CERTIFCADOS DE ESPECIALIDADES</title>

   <?php
         require("../../vista/style.php");
         require("../../vista/estilos.php");
    ?>
<style>

body{
    font-family:Arial;
    background:#f5f5f5;
    margin:0;
}

/* CONTENEDOR */

.contenedor{

    width:95%;
    margin:30px auto;
}

/* BOTON TODOS */

.botonTodos{

    display:inline-block;

    margin-bottom:20px;

    padding:12px 20px;

    background:#0b57d0;

    color:white;

    text-decoration:none;

    border-radius:8px;

    font-weight:bold;
}

/* TABLA */

table{

    width:100%;

    border-collapse:collapse;

    background:white;

    box-shadow:0px 0px 10px rgba(0,0,0,.1);
}

th,td{

    border:1px solid #ccc;

    padding:12px;

    text-align:center;
}

th{

    background:#0b57d0;

    color:white;
}

img{

    width:60px;
}

/* BOTON VER */

.btnVer{

    display:inline-block;

    padding:8px 14px;

    background:#198754;

    color:white;

    text-decoration:none;

    border-radius:6px;

    font-size:14px;

    font-weight:bold;
}

.btnVer:hover{

    background:#146c43;
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

                    <div class="contenedor">

                        <a class="botonTodos"
                        href="todos.php">
                        VER TODOS LOS CERTIFICADOS
                        </a>

                        <table>

                            <tr>

                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Fecha</th>
                                <th>Clase Bíblica</th>
                                <th>Logo Club</th>
                                <th>Logo Conquistadores</th>
                                <th>Registro</th>
                                <th>Acción</th>

                            </tr>

                            <?php while($fila = mysqli_fetch_assoc($resultado)){ ?>

                            <tr>

                                <td><?php echo $fila['id']; ?></td>

                                <td><?php echo $fila['nombre']; ?></td>

                                <td><?php echo $fila['fecha']; ?></td>
                                <td><?php echo $fila['clase_biblica']; ?></td>
                                <td>
                                    <img src="../logos/<?php echo $fila['logo_club']; ?>">
                                </td>

                                <td>
                                    <img src="../logos/<?php echo $fila['logo_conquistadores']; ?>">
                                </td>

                                <td><?php echo $fila['fecha_registro']; ?></td>

                                <td>

                                    <a class="btnVer"
                                    href="ver.php?id=<?php echo $fila['id']; ?>">
                                    VER CERTIFICADO
                                    </a>

                                </td>

                            </tr>

                            <?php } ?>

                        </table>

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
                    <a class="btn btn-primary" href="/club_mikel_manager/logout.php">Logout</a>
                </div>
            </div>
        </div>
    </div>

   <?php
         require("../../vista/script.php");
    ?>


</body>

</html>