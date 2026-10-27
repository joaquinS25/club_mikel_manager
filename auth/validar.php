<?php
session_start();
include(__DIR__ . "/../modelo/conexion.php");

$user = $_POST['usuario'];
$pass = md5($_POST['password']);

$stmt = $con->prepare("SELECT * FROM usuarios_simulador WHERE usuario=? AND password=?");
$stmt->bind_param("ss",$user,$pass);
$stmt->execute();
$res = $stmt->get_result();

if($data = $res->fetch_assoc()){

    $_SESSION['id'] = $data['id'];
    $_SESSION['usuario'] = $data['usuario']; // 🔥 ESTA ES LA CLAVE
    $_SESSION['rol'] = $data['rol'];

    if($data['rol']=='admin'){
        header("Location: ../admin/dashboard.php");
    }else{
        header("Location: ../user/panel.php");
    }

}else{
    echo "<script>alert('Datos incorrectos');window.location='../simulador.php';</script>";
}
