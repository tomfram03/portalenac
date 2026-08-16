<?php
include 'conexao.php';

// Busca os últimos 20 registros
$sql = "SELECT * FROM log_tentativas ORDER BY data_hora DESC LIMIT 20";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Painel de Auditoria de TI</title>
    <style>
        table { border-collapse: collapse; width: 100%; font-family: sans-serif; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .falha { color: red; font-weight: bold; }
        .sucesso { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <h2>Monitoramento de Rede - Tentativas de Login</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Usuário Tentado</th>
            <th>IP de Origem</th>
            <th>Data e Hora</th>
            <th>Status</th>
        </tr>
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $status_class = $row['sucesso'] ? 'sucesso' : 'falha';
                $status_texto = $row['sucesso'] ? 'Acesso Permitido' : 'Acesso Negado';
                
                echo "<tr>";
                echo "<td>" . $row['id'] . "</td>";
                echo "<td>" . htmlspecialchars($row['usuario_tentado']) . "</td>";
                echo "<td>" . $row['ip_origem'] . "</td>";
                echo "<td>" . date('d/m/Y H:i:s', strtotime($row['data_hora'])) . "</td>";
                echo "<td class='$status_class'>" . $status_texto . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='5'>Nenhum registro encontrado.</td></tr>";
        }
        ?>
    </table>
</body>
</html>