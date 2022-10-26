<?php 

include("../conexao.php"); 

$query_cliente = mysqli_query($mysqli, "SELECT * FROM CLIENTE WHERE CODIGO='" . $_GET['codigo']  . "'");

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Teste MC</title>
    <meta name="description" content="Portfolio de Kamily dos Santos, desenvolvedora Front-End Junior.">

    <link rel="stylesheet" href="../css/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;700;900&display=swap" rel="stylesheet">
</head>

<body>

<?php
    while($recebe_cliente = mysqli_fetch_array($query_cliente)) {
        $codigo = $recebe_cliente['CODIGO'];
        $nome = $recebe_cliente['NOME'];
        $endereco = $recebe_cliente['ENDERECO'];
        $bairro = $recebe_cliente['BAIRRO'];
        $cidade = $recebe_cliente['CIDADE'];
        $cep = $recebe_cliente['CEP'];
        $uf = $recebe_cliente['UF'];
        $fone = $recebe_cliente['FONE'];
        $celular = $recebe_cliente['CELULAR'];
        $email = $recebe_cliente['EMAIL'];
                    
?>

    <section id="panel_edit" >
        <form action="./editPHP.php" method="POST" class="formulario">
            <h1>Adicionar novo cliente</h1>
            <input type="text" name="codigo" value=<?php echo $codigo?> hidden>
            <label for="nome">Nome</label>
            <input type="text" name="nome" maxlength="35" required value="<?php echo $nome?>">
            <label for="endereco">Endereço</label>
            <input type="text" name="endereco" maxlength="35" value="<?php echo $endereco?>">
            <label for="bairro">Bairro</label>
            <input type="text" name="bairro" maxlength="20" value="<?php echo $bairro?>">
            <label for="cidade">Cidade</label>
            <input type="text" name="cidade" maxlength="30" value="<?php echo $cidade?>">
            <label for="cep">CEP</label>
            <input type="text" name="cep" maxlength="10" value="<?php echo $cep?>">
            <label for="uf">UF</label>
            <input type="text" name="uf" maxlength="2" value="<?php echo $uf?>">
            <label for="fone">Fone</label>
            <input type="text" name="fone" maxlength="15" value="<?php echo $fone?>">
            <label for="celular">Celular</label>
            <input type="text" name="celular" maxlength="15" value="<?php echo $celular?>">
            <label for="email">E-mail</label>
            <input type="text" name="email" maxlength="50" value="<?php echo $email?>">
            <div>
                <button type="button" href="./clientes.php">Cancelar</button>
                <button type="submit" id="enviarClient" name="enviarClient">Salvar</button>
            </div>
        </form>
    </section>

    <?php }; ?>
</body>
</html>