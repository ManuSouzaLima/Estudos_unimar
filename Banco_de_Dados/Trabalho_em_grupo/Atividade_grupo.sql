CREATE DATABASE locadora CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
USE locadora;

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE filmes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	categorias_id INT, 
    FOREIGN KEY(categorias_id) REFERENCES categorias(id),
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE locacao(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    clientes_id INT,
    filmes_id INT,
    FOREIGN KEY(clientes_id) REFERENCES clientes(id),
	FOREIGN KEY(filmes_id) REFERENCES filmes(id),
    data_locacao DATE NOT NULL,
    data_devolucao DATE NOT NULL
);

CREATE TABLE locacao_has_filme(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    locacao_id INT,
	filmes_id INT,
    FOREIGN KEY(locacao_id) REFERENCES locacao(id),
    FOREIGN KEY(filmes_id) REFERENCES filmes(id)
);