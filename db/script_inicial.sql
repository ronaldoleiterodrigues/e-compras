-- CRIANDO TABELA CATEGORIA
CREATE TABLE CATEGORIA (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DESCRICAO VARCHAR(40) DEFAULT NULL,
  ESTATUS ENUM('A','I') DEFAULT NULL
) ;

-- CRIANDO TABELA PERFIL
CREATE TABLE PERFIL (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DESCRICAO VARCHAR(40) DEFAULT NULL
) ;

-- INSERINDO DADOS INICIAIS NA TABELA PERFIL
INSERT INTO PERFIL (ID, DESCRICAO) VALUES
(1, 'ADMINISTRADOR'),
(2, 'USUARIO');

-- CRIANDO TABELA USUARIO
CREATE TABLE USUARIO (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NOME VARCHAR(255) DEFAULT NULL,
  USUARIO VARCHAR(60) DEFAULT NULL,
  SENHA VARCHAR(100) DEFAULT NULL,
  PERFIL INT(11) DEFAULT NULL,
  EMAIL VARCHAR(80) DEFAULT NULL,
  IMAGEM VARCHAR(100) DEFAULT NULL,
  ATIVO ENUM('0','1') DEFAULT NULL
) ;

-- CRIANDO TABELA PRODUTOS
CREATE TABLE PRODUTO (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CODIGO VARCHAR(6) DEFAULT NULL,
  DATACADASTRO DATETIME DEFAULT NULL,
  NOME VARCHAR(40) DEFAULT NULL,
  DESCRICAO VARCHAR(255) DEFAULT NULL,
  QUANTIDADE INT(11) DEFAULT NULL,
  COR VARCHAR(40) DEFAULT NULL,
  PRECO DOUBLE DEFAULT NULL,
  DESCONTO DOUBLE DEFAULT NULL,
  IMAGEM VARCHAR(100) DEFAULT NULL,
  CATEGORIA INT(11) DEFAULT NULL,
  ESTATUS ENUM('A','I') DEFAULT NULL,
  PRECODECUSTO DECIMAL(10,2) DEFAULT NULL
) ;
-- ATERANDO A COLUNA CODIGO DA  TABELA PRODUTO
ALTER TABLE PRODUTO  ADD UNIQUE KEY CODIGO (CODIGO);

-- CRIANDO TABELA VENDA
CREATE TABLE VENDA (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DATAVENDA DATETIME DEFAULT NULL,
  VALOR DOUBLE DEFAULT NULL,
  USUARIO INT(11) DEFAULT NULL
) ;

-- CRIANDO TABELA ITENS VENDA
CREATE TABLE ITENSVENDA (
  ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  VENDA INT(11) DEFAULT NULL,
  PRODUTO INT(11) DEFAULT NULL,
  QUANTIDADE INT(11) DEFAULT NULL,
  PRECOUNITARIO DOUBLE DEFAULT NULL,
  FOREIGN KEY (VENDA) REFERENCES VENDA(ID),
  FOREIGN KEY (PRODUTO) REFERENCES PRODUTO(ID)
) ;
CREATE TABLE CLIENTES(
   ID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
   NOME VARCHAR(250) NOT NULL,
   CPF  VARCHAR(20) NOT NULL,
   DATANASCIMENTO TIMESTAMP,
   EMAIL VARCHAR(250)  NOT NULL,
   SENHA  VARCHAR(120)  NOT NULL,
   CEP VARCHAR(20) NOT NULL,
   LOGRADOURO VARCHAR(250) NOT NULL,
   NUMERO VARCHAR(10),
   BAIRRO VARCHAR(250) NOT NULL,
   UF VARCHAR(10),
   CIDADE VARCHAR(250) NOT NULL,
   IMAGEM VARCHAR(120),
   DATACADASTRO TIMESTAMP,
   ATIVO  ENUM('1','0')      
);