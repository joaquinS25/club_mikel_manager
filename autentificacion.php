<?php 
session_start();

$user =  $_REQUEST['user'];
$pass =  $_REQUEST['pass'];

require("modelo/m_usuario.php");

$usuario = ValidarUsuario($user,$pass);

if($usuario != NULL)
{
    foreach ($usuario as $key => $value) 
    {
        $id_usuario = $value['id_usuario'];
        $nombre_usuario = $value['nombre_usuario'];
        $apellido_usuario = $value['apellido_usuario'];
        $correo_usuario = $value['correo_usuario'];
        $user_usuario = $value['user_usuario'];
        $pass_usuario = $value['pass_usuario'];
    }

    $_SESSION['autentificado'] = TRUE;
    $_SESSION['id_session'] = $id_usuario;
    $_SESSION['nom_session'] = $nombre_usuario . " " . $apellido_usuario;

    header('location: home.php');
    exit();
}
else
{
    header('location: index.php?error=1');
    exit();
}
?>
