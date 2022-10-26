<?php 

    include("../conexao.php");

    $_POST['codigo'] = filter_input(INPUT_POST, 'codigo', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['descricao'] = filter_input(INPUT_POST, 'descricao', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['referencia'] = filter_input(INPUT_POST, 'referencia', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['unidade'] = filter_input(INPUT_POST, 'unidade', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['data_venda'] = filter_input(INPUT_POST, 'data_venda', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['preco_venda'] = filter_input(INPUT_POST, 'preco_venda', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['saldo'] = filter_input(INPUT_POST, 'saldo', FILTER_SANITIZE_SPECIAL_CHARS);

    $codigo = $_POST['codigo'];
    $descricao = $_POST['descricao'];
    $referencia = $_POST['referencia'];
    $unidade = $_POST['unidade'];
    $data_venda = $_POST['data_venda'];
    $preco_venda = $_POST['preco_venda'];
    $saldo = $_POST['saldo'];

    $recebe_produto = "UPDATE PRODUTOS SET 
    descricao = '$descricao',
    referencia = '$referencia',
    unidade = '$unidade',
    data_venda = '$data_venda',
    preco_venda = '$preco_venda',
    saldo = '$saldo'
    WHERE CODIGO=" . $codigo;

    $executaQuery = mysqli_query($GLOBALS["mysqli"], $recebe_produto);
        
    header('location: ./produtos.php');

?>