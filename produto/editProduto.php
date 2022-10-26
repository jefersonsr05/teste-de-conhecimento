<?php 

include("../conexao.php"); 

$query_produto = mysqli_query($mysqli, "SELECT * FROM PRODUTOS WHERE CODIGO='" . $_GET['codigo']  . "'");

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Produtos - Teste MC</title>

    <link rel="stylesheet" href="../css/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;700;900&display=swap" rel="stylesheet">
</head>

<body>

<?php
    while($recebe_produto = mysqli_fetch_array($query_produto)) {
        $codigo = $recebe_produto['CODIGO'];
        $descricao = $recebe_produto['DESCRICAO'];
        $referencia = $recebe_produto['REFERENCIA'];
        $unidade = $recebe_produto['UNIDADE'];
        $data_venda = $recebe_produto['DATA_VENDA'];
        $preco_venda = $recebe_produto['PRECO_VENDA'];
        $saldo = $recebe_produto['SALDO'];
                    
?>

    <section id="panel_edit" >
        <form action="./editProdPHP.php" method="POST" class="formulario">
            <h1>Adicionar novo produto</h1>
            <input type="text" name="codigo" value=<?php echo $codigo?> hidden>
            <label for="descricao">Descrição</label>
            <input type="text" name="descricao" maxlength="35" required value="<?php echo $descricao?>">
            <label for="referencia">Referência</label>
            <input type="text" name="referencia" maxlength="35" value="<?php echo $referencia?>">
            <label for="unidade">Unidade</label>
            <input type="text" name="unidade" maxlength="20" value="<?php echo $unidade?>">
            <label for="data_venda">Data da venda</label>
            <input type="text" name="data_venda" maxlength="30" value="<?php echo $data_venda?>">
            <label for="preco_venda">Preco da venda</label>
            <input type="text" name="preco_venda" maxlength="10" value="<?php echo $preco_venda?>">
            <label for="saldo">Saldo</label>
            <input type="text" name="saldo" maxlength="2" value="<?php echo $saldo?>">
            <div class="btnForm">
                <button type="button" href="./produtos.php">Cancelar</button>
                <button type="submit" id="enviarProduto" name="enviarProduto">Salvar</button>
            </div>
        </form>
    </section>

    <?php }; ?>
</body>
</html>