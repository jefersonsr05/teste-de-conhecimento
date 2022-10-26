<?php
    include("../conexao.php");

    $query = mysqli_fetch_array(mysqli_query($mysqli, 'SELECT (MAX(CODIGO) + 1) AS CODIGO FROM CLIENTE'));
    $codigo = $query['CODIGO'];

    $_POST['nome'] = filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['endereco'] = filter_input(INPUT_POST, 'endereco', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['bairro'] = filter_input(INPUT_POST, 'bairro', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['cidade'] = filter_input(INPUT_POST, 'cidade', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['cep'] = filter_input(INPUT_POST, 'cep', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['uf'] = filter_input(INPUT_POST, 'uf', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['fone'] = filter_input(INPUT_POST, 'fone', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['celular'] = filter_input(INPUT_POST, 'celular', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['email'] = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_SPECIAL_CHARS);
    $nome = $_POST['nome'];
    $endereco = $_POST['endereco'];
    $bairro = $_POST['bairro'];
    $cidade = $_POST['cidade'];
    $cep = $_POST['cep'];
    $uf = $_POST['uf'];
    $fone = $_POST['fone'];
    $celular = $_POST['celular'];
    $email = $_POST['email'];

    mysqli_query($GLOBALS["mysqli"], "INSERT INTO `CLIENTE` (`codigo`, `nome`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `fone`, `celular`, `email`) VALUES ('$codigo', '$nome', '$endereco', '$bairro', '$cidade', '$cep', '$uf', '$fone', '$celular', '$email')");
    header('location: ./clientes.php');

?>