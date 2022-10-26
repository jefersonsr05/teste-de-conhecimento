<?php 

include("./conexao.php"); 

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home Page - Teste MC</title>

    <link rel="stylesheet" href="./css/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;700;900&display=swap" rel="stylesheet">
</head>

<body>
    <main class="homepage">
        <h1>MC Teste</h1>
        <div class="cards_home">
            <a class="card" href="./cliente/clientes.php">
                <img src="./img/cliente.svg" alt="">
                <h1>Clientes</h1>
            </a>
            <a class="card" href="./produto/produtos.php">
                <img src="./img/produto.svg" alt="">
                <h1>Produtos</h1>
            </a>
            <a class="card">
                <img src="./img/venda.svg" alt="">
                <h1>Vendas</h1>
            </a>
        </div>
    </main>
    <script src="../script.js"></script>
</body>
</html>