<?php

    include("../conexao.php");

    mysqli_query($mysqli, "DELETE FROM CLIENTE WHERE CODIGO='" . $_GET['codigo']  . "' ");

    if (mysqli_affected_rows($mysqli)!= 0) {        
        header("Location: ./clientes.php");
    }
    echo 'erro ao fazer exclusão';
?>