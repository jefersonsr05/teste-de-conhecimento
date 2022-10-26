<?php 

include("../conexao.php"); 

$busca_cliente = 'SELECT * FROM `CLIENTE`';
$query_cliente = mysqli_query($mysqli, $busca_cliente);

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Clientes - Teste MC</title>

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
        <form action="./addClient.php" method="POST" class="formulario">
            <h1>Adicionar novo cliente</h1>
            <label for="nome">Nome</label>
            <input type="text" name="nome" maxlength="35" required>
            <label for="endereco">Endereço</label>
            <input type="text" name="endereco" maxlength="35">
            <label for="bairro">Bairro</label>
            <input type="text" name="bairro" maxlength="20">
            <label for="cidade">Cidade</label>
            <input type="text" name="cidade" maxlength="30">
            <label for="cep">CEP</label>
            <input type="text" name="cep" maxlength="10">
            <label for="uf">UF</label>
            <input type="text" name="uf" maxlength="2">
            <label for="fone">Fone</label>
            <input type="text" name="fone" maxlength="15">
            <label for="celular">Celular</label>
            <input type="text" name="celular" maxlength="15">
            <label for="email">E-mail</label>
            <input type="text" name="email" maxlength="50">
            <div class="btnForm">
                <button type="button" onclick="setVisible_false()">Cancelar</button>
                <button type="submit" id="enviarClient" name="enviarClient">Salvar</button>
            </div>
        </form>
    </section>

    <main class="tabela">
        <div class="topo">
            <h1>Clientes</h1>
            <button class="btnAdd" onclick="setVisible_true()">Adicionar Cliente</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th>CÓDIGO</th>
                    <th>NOME</th>
                    <th>ENDEREÇO</th>
                    <th>BAIRRO</th>
                    <th>CIDADE</th>
                    <th>CEP</th>
                    <th>UF</th>
                    <th>FONE</th>
                    <th>CELULAR</th>
                    <th>E-MAIL</th>
                    <th>AÇÕES</th>
                </tr>
            </thead>
            <tbody>
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

                <tr>
                    <td><?php echo $codigo; ?></td>
                    <td><?php echo $nome; ?></td>
                    <td><?php echo $endereco; ?></td>
                    <td><?php echo $bairro; ?></td>
                    <td><?php echo $cidade; ?></td>
                    <td><?php echo $cep; ?></td>
                    <td><?php echo $uf; ?></td>
                    <td><?php echo $fone; ?></td>
                    <td><?php echo $celular; ?></td>
                    <td><?php echo $email; ?></td>
                    <td>
                        <div class="buttons">
                            <form id="ctrlClients" method="post" action="">
                                <a href="./delClient.php?codigo=<?=$codigo?>">
                                    <div class="btnExcluir" type="submit" id='btnApagar'><img src="../img/excluir.svg" width="40px"></div> 
                                </a>
                                <a href="./editClient.php?codigo=<?=$codigo?>"> 
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