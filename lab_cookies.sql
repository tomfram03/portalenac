-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/08/2026 às 16:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lab_cookies`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_tentativas`
--

CREATE TABLE `log_tentativas` (
  `id` int(11) NOT NULL,
  `usuario_tentado` varchar(50) DEFAULT NULL,
  `senha_tentada` varchar(50) DEFAULT NULL,
  `ip_origem` varchar(45) DEFAULT NULL,
  `data_hora` datetime DEFAULT current_timestamp(),
  `sucesso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_tentativas`
--

INSERT INTO `log_tentativas` (`id`, `usuario_tentado`, `senha_tentada`, `ip_origem`, `data_hora`, `sucesso`) VALUES
(1, 'teste', NULL, '::1', '2026-08-14 13:30:44', 0),
(2, 'teste', NULL, '::1', '2026-08-14 13:32:21', 0),
(3, 'teste2', NULL, '::1', '2026-08-14 13:33:07', 0),
(4, 'teste5', NULL, '::1', '2026-08-14 13:34:29', 0),
(5, 'teste4', '12345', '::1', '2026-08-14 13:35:42', 0),
(6, 'fran', '12344', '192.168.137.143', '2026-08-14 13:40:31', 0),
(7, 'teste6', '123456', '::1', '2026-08-14 13:59:58', 0),
(8, 'teste7', '112234', '192.168.137.143', '2026-08-14 14:01:42', 0),
(9, 'babi', '122344', '192.168.137.143', '2026-08-14 14:02:19', 0),
(10, 'pampam', 'pam1234', '::1', '2026-08-14 14:13:29', 0),
(11, 'senac', '12345', '::1', '2026-08-14 14:16:35', 0),
(12, 'senac1', '123455', '::1', '2026-08-14 14:22:04', 0),
(13, 'senac2', '542334', '::1', '2026-08-14 14:26:52', 1),
(14, 'senacsorocaba', '0987665', '192.168.137.143', '2026-08-14 14:27:45', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`) VALUES
(1, 'aluno', 'senha123', 'comum'),
(2, 'admin', 'admin789', 'administrador');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `log_tentativas`
--
ALTER TABLE `log_tentativas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `log_tentativas`
--
ALTER TABLE `log_tentativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
