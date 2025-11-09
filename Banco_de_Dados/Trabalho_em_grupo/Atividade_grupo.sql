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
("Gustavo","gustavotstgen@gmail.com","14986547436",'2006-04-16'),
("Jose","Josesfsg@gmail.com","149776547436",'2004-07-23');

INSERT INTO categorias(nome)
VALUES ("Fantasia"),("Drama"),("Açao"),("Romance"),("Super-heroi");

INSERT INTO filmes(titulo,ano_lancamento,preco,categorias_id)
VALUES ("Carros 2",'2011-06-23',43.99),
("Toy Story",'1995-12-22',23.57),
("Viagem ao Centro da Terra",'2008-07-11',39.99),
("A ponte para terabitia",'2007-03-16',23.99),
("Pantera Negra",'2007-09-25',23.99);

INSERT INTO locacao(clientes_id,filmes_id,data_locacao,data_devolucao)
VALUES (2,3,'2025-11-01','2025-11-10'),
(1,4,'2025-09-25', '2025-10-25'),
(2,2,'2024-11-01','2024-12-10'),
(1,5,'2025-02-25', '2025-03-25');

-- Parte 2 
-- 1 - listar todos os filmes com suas respectivas categorias - FEITA
SELECT filmes.titulo, categorias.nome
FROM filmes 
INNER JOIN categorias
	ON filmes.categorias_id = categorias.id;
    
-- 2 Liste os nomes dos clientes e as locacoes que realizaram

-- 3 Liste o nome dos clientes e os títulos dos filmes que cada um alugou - FEITA
SELECT clientes.nome,filmes.titulo
FROM clientes
INNER JOIN locacao
	ON clientes.id = locacao.clientes_id
INNER JOIN filmes
	ON locacao.filmes_id = filmes.id;
    
-- 4 Mostre o total de filmes alugados por cada cliente. - Feito
SELECT clientes.nome, count(*) as Contagem
FROM clientes
INNER JOIN locacao
	ON clientes.id = locacao.clientes_id
GROUP BY clientes.nome;

-- 5 Mostre o total de filmes alugados por cada cliente

-- 19 Atualize o nome de um dos clientes com UPDATE
UPDATE clientes
SET clientes.nome = "Ricardo Alves Lopes"
WHERE clientes.id = 1;
