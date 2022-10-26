<?php 

include("../conexao.php"); 

$busca_produto = 'SELECT * FROM `PRODUTOS`';
$query_produto = mysqli_query($mysqli, $busca_produto);

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
    <header class="header-bg">
        <div class="header">
            <a class="logo" href="../index.php">MC TESTE</a>
            <nav id="nav">
                <ul class="menu">
                    <li><a href="../cliente/clientes.php">Clientes</a></li>
                    <li><a href="../produto/produtos.php">Produtos</a></li>
                    <li><a href="">Vendas</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section id="panel_add" >
        <form action="./addProduto.php" method="POST" class="formulario">
            <h1>Adicionar novo produto</h1>
            <label for="descricao">Descrição</label>
            <input type="text" name="descricao" maxlength="35" required>
            <label for="referencia">Referência</label>
            <input type="text" name="referencia" maxlength="15">
            <label for="unidade">Unidade</label>
            <input type="text" name="unidade" maxlength="4">
            <label for="data_venda">Data da venda</label>
            <input type="date" name="data_venda">
            <label for="preco_venda">Preço da venda</label>
            <input type="text" name="preco_venda" maxlength="20">
            <label for="saldo">Saldo</label>
            <input type="text" name="saldo" maxlength="20">
            <div class="btnForm">
                <button type="button" onclick="setVisible_false()">Cancelar</button>
                <button type="submit" id="enviarProduto" name="enviarProduto">Salvar</button>
            </div>
        </form>
    </section>

    <main class="tabela">
        <div class="topo">
            <h1>Produtos</h1>
            <button class="btnAdd" onclick="setVisible_true()">Adicionar Produto</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>CÓDIGO</th>
                    <th>DESCRIÇÃO</th>
                    <th>REFERÊNCIA</th>
                    <th>UNIDADE</th>
                    <th>DATA VENDA</th>
                    <th>PREÇO VENDA</th>
                    <th>SALDO</th>
                    <th>AÇÕES</th>
                </tr>
            </thead>
            <tbody>
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

                <tr>
                    <td><?php echo $codigo; ?></td>
                    <td><?php echo $descricao; ?></td>
                    <td><?php echo $referencia; ?></td>
                    <td><?php echo $unidade; ?></td>
                    <td><?php echo $data_venda; ?></td>
                    <td><?php echo $preco_venda; ?></td>
                    <td><?php echo $saldo; ?></td>
                    <td>
                        <div class="buttons">
                            <form id="ctrlProduto" method="post" action="">
                                <a href="./delProduto.php?codigo=<?=$codigo?>">
                                    <div class="btnExcluir" type="submit" id='btnApagar'><img src="../img/excluir.svg" width="40px"></div> 
                                </a>
                                <a href="./editProduto.php?codigo=<?=$codigo?>"> 
                                    <div class="btnEditar" type="submit" id='btnAlterar'><img src="../img/editar.svg" width="40px"></div> 
                                </a>
                            </form>
                        </div>
                    </td>
                </tr>

                <?php }; ?>

            </tbody>
        </table>
    </main>
    <script src="../script.js"></script>
</body>
</html>