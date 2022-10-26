<?php
    include("../conexao.php");

    $query = mysqli_fetch_array(mysqli_query($mysqli, 'SELECT (MAX(CODIGO) + 1) AS CODIGO FROM PRODUTOS'));
    $codigo = $query['CODIGO'];

    $_POST['descricao'] = filter_input(INPUT_POST, 'descricao', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['referencia'] = filter_input(INPUT_POST, 'referencia', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['unidade'] = filter_input(INPUT_POST, 'unidade', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['data_venda'] = filter_input(INPUT_POST, 'data_venda', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['preco_venda'] = filter_input(INPUT_POST, 'preco_venda', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['saldo'] = filter_input(INPUT_POST, 'saldo', FILTER_SANITIZE_SPECIAL_CHARS);
    
    $descricao = $_POST['descricao'];
    $referencia = $_POST['referencia'];
    $unidade = $_POST['unidade'];
    $data_venda = $_POST['data_venda'];
    $preco_venda = $_POST['preco_venda'];
    $saldo = $_POST['saldo'];

    mysqli_query($GLOBALS["mysqli"], "INSERT INTO `PRODUTOS` (`codigo`, `descricao`, `referencia`, `unidade`, `data_venda`, `preco_venda`, `saldo`) VALUES ('$codigo', '$descricao', '$referencia', '$unidade', '$data_venda', '$preco_venda', '$saldo')");
    header('location: ./produtos.php');

?>