<?php
    //conxão ao banco de dados
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "mc_teste";

    $mysqli = new mysqli($servername, $username, $password, $dbname);

    if ($mysqli->connect_errno) {
        echo "Falha ao conectar: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }
?>