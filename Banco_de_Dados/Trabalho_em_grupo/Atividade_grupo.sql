CREATE DATABASE locadora CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
USE locadora;

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE filmes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	categorias_id INT, 
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(categorias_id) REFERENCES categorias(id)
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

INSERT INTO clientes(nome,email,telefone,data_nascimento)
VALUES ("Emanuel","emanueltstgen@gmail.com","14996545436",'2005-07-18'),
("Gustavo","gustavotstgen@gmail.com","14986547436",'2006-04-16');

INSERT INTO categorias(nome)
VALUES ("Fantasia"),("Drama"),("Açao"),("Romance"),("Super-heroi");

INSERT INTO filmes(titulo,ano_lancamento,preco)
VALUES ("Carros 2",'2011-06-23',43.99),
("Toy Story",'1995-12-22',23.57),
("Viagem ao Centro da Terra",'2008-07-11',39.99),
("A ponte para terabitia",'2007-03-16',23.99),
("Pantera Negra",'2007-09-25',23.99)
