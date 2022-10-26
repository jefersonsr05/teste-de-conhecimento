<?php 

    include("../conexao.php");

    $_POST['codigo'] = filter_input(INPUT_POST, 'codigo', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['nome'] = filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['endereco'] = filter_input(INPUT_POST, 'endereco', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['bairro'] = filter_input(INPUT_POST, 'bairro', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['cidade'] = filter_input(INPUT_POST, 'cidade', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['cep'] = filter_input(INPUT_POST, 'cep', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['uf'] = filter_input(INPUT_POST, 'uf', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['fone'] = filter_input(INPUT_POST, 'fone', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['celular'] = filter_input(INPUT_POST, 'celular', FILTER_SANITIZE_SPECIAL_CHARS);
    $_POST['email'] = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_SPECIAL_CHARS);


    $codigo = $_POST['codigo'];
    $nome = $_POST['nome'];
    $endereco = $_POST['endereco'];
    $bairro = $_POST['bairro'];
    $cidade = $_POST['cidade'];
    $cep = $_POST['cep'];
    $uf = $_POST['uf'];
    $fone = $_POST['fone'];
    $celular = $_POST['celular'];
    $email = $_POST['email'];

    $recebe_cliente = "UPDATE CLIENTE SET 
    nome = '$nome',
    endereco = '$endereco',
    bairro = '$bairro',
    cidade = '$cidade',
    cep = '$cep',
    uf = '$uf',
    fone = '$fone',
    celular = '$celular',
    email = '$email'
    WHERE CODIGO=" . $codigo;

    $executaQuery = mysqli_query($GLOBALS["mysqli"], $recebe_cliente);
        
    header('location: ./clientes.php');

?>