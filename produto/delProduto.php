<?php

    include("../conexao.php");

    mysqli_query($mysqli, "DELETE FROM PRODUTOS WHERE CODIGO='" . $_GET['codigo']  . "' ");

    if (mysqli_affected_rows($mysqli)!= 0) {        
        header("Location: ./produtos.php");
    }
    echo 'erro ao fazer exclusão';
?>