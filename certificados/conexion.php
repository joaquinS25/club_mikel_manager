<?php

$host = "localhost";
$usuario = "root";
$password = "";
$bd = "manager_club";

$conn = mysqli_connect($host,$usuario,$password,$bd);

if(!$conn){
    die("Error de conexión");
}

?>