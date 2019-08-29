-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Ago-2019 às 07:10
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `desafio_devell`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `associacao`
--

CREATE TABLE `associacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` text DEFAULT NULL,
  `idCidade` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `associacao`
--

INSERT INTO `associacao` (`id`, `nome`, `descricao`, `idCidade`, `endereco`, `complemento`, `bairro`, `telefone`, `email`, `cnpj`) VALUES
(1, 'SEI LA', 'chic10', 1, 'Rua sei la', 'Nao se', 'fasdfa', '1236524407', 'thainan.cpv76@gmail.com', '48.906.409/000'),
(2, 'Seila', 'afdasfads', 2, 'Rua sei la', 'Nao se', 'fasdfa', '1236524407', 'thainan.cpv76@gmail.com', '48.906.409/000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banco`
--

CREATE TABLE `banco` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `agencia` varchar(20) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `banco`
--

INSERT INTO `banco` (`id`, `nome`, `agencia`, `conta`, `idCliente`) VALUES
(1, 'NuBank', '0001', '1015015', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriaresultado`
--

CREATE TABLE `categoriaresultado` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `prazoRecebimento` int(11) NOT NULL DEFAULT 0 COMMENT 'Em meses'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Os resultados mensais são agrupados em a vista, a prazo, etc...';

--
-- Extraindo dados da tabela `categoriaresultado`
--

INSERT INTO `categoriaresultado` (`id`, `nome`, `prazoRecebimento`) VALUES
(1, 'Boleto', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `idEstado`) VALUES
(1, 'Taubaté', 1),
(2, 'Caçapava', 1),
(3, 'Tremembé', 1),
(4, 'São José dos Campos', 1),
(5, 'Campinas', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `idCidade` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `idAssociacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cnpj`, `idCidade`, `endereco`, `complemento`, `bairro`, `telefone`, `email`, `idAssociacao`) VALUES
(1, 'Thainan de Andrade Prado', '48.906.409/000', 2, 'Rua Luso de Souza, 76', 'afdsfads', 'fasdfsa', '1236524407', 'thainan.cpv76@gmail.com', NULL),
(2, 'Thainan de Prado', '48.906.409/000', 2, 'Rua Jose Abreu, 76, 76', 'afdsfads', 'fasdfsa', '1236524407', 'thainan.cpv76@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `credordevedor`
--

CREATE TABLE `credordevedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `idCidade` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `credordevedor`
--

INSERT INTO `credordevedor` (`id`, `nome`, `cnpj`, `idCidade`, `endereco`, `complemento`, `bairro`, `telefone`, `email`, `idCliente`) VALUES
(1, 'Thainan de Andrade Prado', '40454045', 5, 'fasdf', 'asfads', 'fasd', 'fdaf', 'thainan.cpv76@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`, `sigla`) VALUES
(1, 'São Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formapagamento`
--

CREATE TABLE `formapagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `formapagamento`
--

INSERT INTO `formapagamento` (`id`, `nome`) VALUES
(1, 'Cartão de Crédito'),
(2, 'Boleto'),
(3, 'Cartão de Débito'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento`
--

CREATE TABLE `lancamento` (
  `id` int(11) NOT NULL,
  `tipo` tinyint(4) NOT NULL,
  `idCredorDevedor` int(11) NOT NULL,
  `numDocumento` varchar(40) DEFAULT NULL,
  `dtVencimento` date DEFAULT NULL,
  `dtEmissao` date DEFAULT NULL,
  `dtRealizacao` date DEFAULT NULL,
  `valorPrevisto` double DEFAULT NULL,
  `valorRealizado` double DEFAULT NULL,
  `idBanco` int(11) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `idFormaPagamento` int(11) NOT NULL,
  `idTipoConta` int(11) NOT NULL,
  `idPlanoConta` int(11) NOT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lancamento`
--

INSERT INTO `lancamento` (`id`, `tipo`, `idCredorDevedor`, `numDocumento`, `dtVencimento`, `dtEmissao`, `dtRealizacao`, `valorPrevisto`, `valorRealizado`, `idBanco`, `idTipoDocumento`, `idFormaPagamento`, `idTipoConta`, `idPlanoConta`, `descricao`, `idCliente`) VALUES
(1, 1, 1, '1', '0000-00-00', '0000-00-00', '0000-00-00', 1, 1, 1, 2, 4, 4, 2, 'afdasfda', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1567027774),
('m130524_201442_init', 1567027777),
('m190124_110200_add_verification_token_column_to_user_table', 1567027777);

-- --------------------------------------------------------

--
-- Estrutura da tabela `planoconta`
--

CREATE TABLE `planoconta` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `idPai` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `planoconta`
--

INSERT INTO `planoconta` (`id`, `nome`, `idPai`, `idCliente`) VALUES
(1, 'seil', 1, 1),
(2, 'fasd', 1, 1),
(3, 'aaaaaaaaaaaa', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resultadomensal`
--

CREATE TABLE `resultadomensal` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor` double NOT NULL,
  `idCategoriaResultado` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `resultadomensal`
--

INSERT INTO `resultadomensal` (`id`, `ano`, `mes`, `valor`, `idCategoriaResultado`, `idCliente`) VALUES
(1, 2019, 2, 20, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `retencao`
--

CREATE TABLE `retencao` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor` double NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `retencao`
--

INSERT INTO `retencao` (`id`, `ano`, `mes`, `valor`, `idCliente`) VALUES
(1, 2019, 10, 500, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoconta`
--

CREATE TABLE `tipoconta` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoconta`
--

INSERT INTO `tipoconta` (`id`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Usuário'),
(4, 'Avulso');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipodocumento`
--

INSERT INTO `tipodocumento` (`id`, `nome`) VALUES
(1, 'RG'),
(2, 'CNH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(102, 'thainan76', 'JCzxzylZMhusuUrYr_gDrlWPZk3TqsF3', '$2y$13$sp09WELamnbv5DKGi1w/BOJJjta0FhYEYHAdYHFsE6DSkZ8.MIU22', NULL, 'thainancpv76@gmail.com', 9, 1567029968, 1567029968, 'YJV3oV5nIphvpJu_gL3dCuwKwUSJbGHh_1567029968');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `idFirebase` varchar(255) DEFAULT NULL,
  `authKey` varchar(32) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `passwordResetToken` varchar(255) NOT NULL,
  `createdAt` bigint(20) NOT NULL,
  `updatedAt` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `idCliente` int(11) DEFAULT NULL,
  `username` varchar(60) NOT NULL,
  `imagem` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `idPerfil`, `nome`, `email`, `idFirebase`, `authKey`, `passwordHash`, `passwordResetToken`, `createdAt`, `updatedAt`, `status`, `idCliente`, `username`, `imagem`) VALUES
(1, 1, 'Thainan de Andrade Prado', 'thainan.cpv76@gmail.com', '', '3decd49a6c6dce88c16a85b9a8e42b51', '3decd49a6c6dce88c16a85b9a8e42b51aa36f1e2', '3decd49a6c6dce88c16a85b9a8e42b51aa36f1e2', 100, 100, 1, NULL, 'thainan76', ''),
(2, 4, 'Thiago', 'thiago@hotmail.com', '', '3decd49a6c6dce88c16a85b9a8e42b51', '3decd49a6c6dce88c16a85b9a8e42b51aa36f1e2', '3decd49a6c6dce88c16a85b9a8e42b51aa36f1e2', 12, 12, 2, NULL, 'thiago', ''),
(9, 1, 'Thainan de Prado', 'afasdfdasf@afsdfasd', '', '3decd49a6c6dce88c16a85b9a8e42b51', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 2, 1, 1, 'admin', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `associacao`
--
ALTER TABLE `associacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Associacao_Cidade` (`idCidade`);

--
-- Índices para tabela `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Banco_Cliente` (`idCliente`);

--
-- Índices para tabela `categoriaresultado`
--
ALTER TABLE `categoriaresultado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Cidade_Estado` (`idEstado`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Cliente_Associacao` (`idAssociacao`),
  ADD KEY `FK_Cliente_Cidade` (`idCidade`);

--
-- Índices para tabela `credordevedor`
--
ALTER TABLE `credordevedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CredorDevedor_Cidade` (`idCidade`),
  ADD KEY `FK_CredorDevedor_Cliente` (`idCliente`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `formapagamento`
--
ALTER TABLE `formapagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Lancamento_CredorDevedor` (`idCredorDevedor`),
  ADD KEY `FK_Lancamento_PlanoConta` (`idPlanoConta`),
  ADD KEY `FK_Lancamento_FormaPagamento` (`idFormaPagamento`),
  ADD KEY `FK_Lancamento_TipoDocumento` (`idTipoDocumento`),
  ADD KEY `FK_Lancamento_TipoConta` (`idTipoConta`),
  ADD KEY `FK_Lancamento_Cliente` (`idCliente`);

--
-- Índices para tabela `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Índices para tabela `planoconta`
--
ALTER TABLE `planoconta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PlanoConta_Pai` (`idPai`),
  ADD KEY `FK_PlanoConta_Cliente` (`idCliente`);

--
-- Índices para tabela `resultadomensal`
--
ALTER TABLE `resultadomensal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ResultadoMensal_CategoriaResultado` (`idCategoriaResultado`),
  ADD KEY `FK_ResultadoMensal_Cliente` (`idCliente`);

--
-- Índices para tabela `retencao`
--
ALTER TABLE `retencao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Retencao_id` (`idCliente`);

--
-- Índices para tabela `tipoconta`
--
ALTER TABLE `tipoconta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Usuario_Cliente` (`idCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `associacao`
--
ALTER TABLE `associacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categoriaresultado`
--
ALTER TABLE `categoriaresultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `credordevedor`
--
ALTER TABLE `credordevedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `formapagamento`
--
ALTER TABLE `formapagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `planoconta`
--
ALTER TABLE `planoconta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `resultadomensal`
--
ALTER TABLE `resultadomensal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `retencao`
--
ALTER TABLE `retencao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipoconta`
--
ALTER TABLE `tipoconta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `associacao`
--
ALTER TABLE `associacao`
  ADD CONSTRAINT `FK_Associacao_Cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Associacao_Usuario` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `banco`
--
ALTER TABLE `banco`
  ADD CONSTRAINT `FK_Banco_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Banco_Lancamento` FOREIGN KEY (`id`) REFERENCES `lancamento` (`id`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `FK_Cidade_Estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_Cliente_Associacao` FOREIGN KEY (`idAssociacao`) REFERENCES `associacao` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Cliente_Cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `credordevedor`
--
ALTER TABLE `credordevedor`
  ADD CONSTRAINT `FK_CredorDevedor_Cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CredorDevedor_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `FK_Lancamento_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Lancamento_CredorDevedor` FOREIGN KEY (`idCredorDevedor`) REFERENCES `credordevedor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Lancamento_FormaPagamento` FOREIGN KEY (`idFormaPagamento`) REFERENCES `formapagamento` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Lancamento_PlanoConta` FOREIGN KEY (`idPlanoConta`) REFERENCES `planoconta` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Lancamento_TipoConta` FOREIGN KEY (`idTipoConta`) REFERENCES `tipoconta` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Lancamento_TipoDocumento` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `planoconta`
--
ALTER TABLE `planoconta`
  ADD CONSTRAINT `FK_PlanoConta_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_PlanoConta_Pai` FOREIGN KEY (`idPai`) REFERENCES `planoconta` (`id`);

--
-- Limitadores para a tabela `resultadomensal`
--
ALTER TABLE `resultadomensal`
  ADD CONSTRAINT `FK_ResultadoMensal_CategoriaResultado` FOREIGN KEY (`idCategoriaResultado`) REFERENCES `categoriaresultado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ResultadoMensal_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `retencao`
--
ALTER TABLE `retencao`
  ADD CONSTRAINT `FK_Retencao_id` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
