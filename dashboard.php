<?php
if(!isset($_COOKIE['usuario'])) {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <h1>Bem-vindo, <?php echo $_COOKIE['usuario']; ?>!</h1>
    
    <h3>Seus dados expostos pelo servidor (Pressione F12 e vá na aba Application/Storage -> Cookies):</h3>
    <ul>
        <li><strong>Usuário:</strong> <?php echo $_COOKIE['usuario']; ?></li>
        <li><strong>Senha vazada:</strong> <?php echo $_COOKIE['senha_em_claro']; ?></li>
        <li><strong>Role atual:</strong> <?php echo $_COOKIE['nivel_acesso']; ?></li>
    </ul>

    <hr>

    <?php
    // O sistema confia cegamente no cookie modificado pelo usuário
    if($_COOKIE['nivel_acesso'] === 'administrador') {
        echo "<h2 style='color:red;'>⚠ ACESSO DE ADMINISTRADOR CONCEDIDO ⚠</h2>";
        echo "<p>Você tem permissão para visualizar dados sensíveis e alterar configurações de rede.</p>";
        echo "<button>Excluir Banco de Dados (Simulação)</button>";
    } else {
        echo "<h2 style='color:blue;'>Acesso Restrito</h2>";
        echo "<p>Você é um usuário comum. As funções de administrador estão ocultas.</p>";
    }
    ?>
    <br><br>
    <a href="logout.php">Sair (Limpar Cookies)</a>
</body>
</html>