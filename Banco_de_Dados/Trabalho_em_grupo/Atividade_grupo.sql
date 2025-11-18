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
    FOREIGN KEY(clientes_id) REFERENCES clientes(id),
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
("Jose","Josesfsg@gmail.com","149776547436",'2004-07-23'),
("Nina","nina@gmail.com","149999999999",'2006-02-15');

INSERT INTO categorias(nome)
VALUES ("Fantasia"),("Drama"),("Açao"),("Romance"),("Super-heroi");

INSERT INTO filmes(titulo,ano_lancamento,preco,categorias_id)
VALUES ("Carros 2",'2011-06-23',43.99,1),
("Toy Story",'1995-12-22',23.57,2),
("Viagem ao Centro da Terra",'2008-07-11',39.99,3),
("A ponte para terabitia",'2007-03-16',23.99,4),
("Pantera Negra",'2007-09-25',23.99,5),
("Vida", '2017-04-27',30.00, null);

INSERT INTO locacao(clientes_id,data_locacao,data_devolucao)
VALUES (2,'2025-11-01','2025-11-10'),
(1,'2025-09-25', '2025-10-25'),
(2,'2024-11-01','2024-12-10'),
(2, '2023-5-11', '2023-06-15'),
(1,'2025-02-25', '2025-03-25'),
(3,'2025-6-12', '2025-07-14');

INSERT INTO locacao_has_filme(locacao_id, filmes_id)
VALUES (1,3),
(2,4),
(3,2),
(4,4),
(5,5),
(6,5);
-- Dropar coluna Filmes ID de locacao 

-- Parte 2 
-- 1 - listar todos os filmes com suas respectivas categorias - Concluido
	SELECT filmes.titulo, categorias.nome
	FROM filmes 
	INNER JOIN categorias
		ON filmes.categorias_id = categorias.id;
    
-- 2 Liste os nomes dos clientes e as locações que realizaram - Concluido
	SELECT clientes.nome, filmes.titulo, locacao.id AS ID_Locacao
	FROM clientes
	INNER JOIN locacao
		ON clientes.id = locacao.clientes_id
	INNER JOIN locacao_has_filme
		ON locacao.id = locacao_has_filme.locacao_id
	INNER JOIN filmes
		ON filmes.id = locacao_has_filme.filmes_id;

-- 3 Liste o nome dos clientes e os títulos dos filmes que cada um alugou - Concluido
	SELECT clientes.nome,filmes.titulo
	FROM clientes
	INNER JOIN locacao
		ON clientes.id = locacao.clientes_id
	INNER JOIN locacao_has_filme
		ON locacao.id = locacao_has_filme.locacao_id
	INNER JOIN filmes
		ON locacao_has_filme.filmes_id = filmes.id;
    
-- 4 Mostre o total de filmes alugados por cada cliente. - Concluido
	SELECT clientes.nome, count(*) as Contagem
	FROM clientes
	INNER JOIN locacao
		ON clientes.id = locacao.clientes_id
	GROUP BY clientes.nome;

-- 5 Exiba os filmes que foram alugados mais de uma vez. - Concluido
	SELECT filmes.titulo, COUNT(locacao_has_filme.filmes_id) AS Quantidade_Alugadas
    FROM filmes
    INNER JOIN locacao_has_filme
		ON filmes.id = locacao_has_filme.filmes_id
	GROUP BY filmes.titulo
    HAVING COUNT(locacao_has_filme.filmes_id) > 1;
    
-- 6 Mostre os filmes e suas categorias, ordenando pelo ano de lançamento mais recente. - Concluido
	SELECT filmes.titulo, categorias.nome, filmes.ano_lancamento
    FROM filmes
    INNER JOIN categorias
		ON categorias.id = filmes.categorias_id
	ORDER BY filmes.ano_lancamento DESC;
		
-- 7 Liste os clientes que ainda não realizaram nenhuma locação. - Concluido
	SELECT clientes.nome, locacao.id
    FROM clientes
    LEFT JOIN locacao
		ON clientes.id = locacao.clientes_id
	WHERE locacao.id IS NULL;
    
-- 8 Exiba o nome das categorias e o preço médio dos filmes de cada uma. - Concluido
	SELECT categorias.nome, AVG(filmes.preco)
	FROM categorias
	INNER JOIN filmes
		ON categorias.id = filmes.categorias_id
	GROUP BY categorias.nome;
    
-- 9 Mostre qual cliente realizou o maior número de locações. - Concluido 
	SELECT clientes.nome, COUNT(locacao.id) AS Total_Locacoes
	FROM clientes
	INNER JOIN locacao
		ON clientes.id = locacao.clientes_id
	GROUP BY clientes.nome
	ORDER BY Total_Locacoes DESC
	LIMIT 1;

-- 10 Liste todas as categorias que ainda não têm filmes cadastrados -  Concluido
	SELECT filmes.titulo, categorias.nome AS categoria
    FROM categorias
    RIGHT JOIN filmes
		ON categorias.id = filmes.categorias_id
	WHERE filmes.categorias_id IS NULL;
        
-- 11 Exiba os filmes que nunca foram alugados. - Concluido
	SELECT filmes.titulo AS Filmes
	FROM filmes
	LEFT JOIN locacao_has_filme
		ON filmes.id = locacao_has_filme.filmes_id
	WHERE locacao_has_filme.id IS NULL;

-- 12 Liste o nome dos clientes e o total gasto em todas as suas locações. - Concluido
	SELECT clientes.nome, SUM(filmes.preco) AS Total_gasto
    FROM clientes
    INNER JOIN locacao
		ON clientes.id = locacao.clientes_id
	INNER JOIN locacao_has_filme
		ON locacao.id = locacao_has_filme.locacao_id
	INNER JOIN filmes
		ON filmes.id = locacao_has_filme.filmes_id
	GROUP BY clientes.nome;	
    
-- 13 Mostre a categoria mais lucrativa, considerando a soma dos preços de todos os filmes alugados. -  Concluido

	SELECT categorias.nome AS Categoria,
		SUM(filmes.preco) AS Total_Lucrado
	FROM categorias
	INNER JOIN filmes
		ON categorias.id = filmes.categorias_id
	INNER JOIN locacao_has_filme
		ON filmes.id = locacao_has_filme.filmes_id
	GROUP BY categorias.nome
	ORDER BY Total_Lucrado DESC
    LIMIT 1;

	
-- 14 Liste os clientes que alugaram filmes de mais de uma categoria. Não precisa 

-- 15 Mostre o filme mais alugado e quantas vezes ele foi alugado. - Concluido
	SELECT filmes.titulo AS Filme, COUNT(locacao_has_filme.id) AS Quantidade_Alugado
	FROM filmes
	INNER JOIN locacao_has_filme
		ON filmes.id = locacao_has_filme.filmes_id
	GROUP BY filmes.titulo
	ORDER BY Quantidade_Alugado DESC
	LIMIT 1;


        
-- 16 Liste os clientes que alugaram filmes da categoria “Terror”, mas nunca alugaram da categoria “Comédia” (Pode substituir por outros nomes de categoria) - Não é para fazer 
-- 17 Mostre o cliente que mais gastou por categoria de filme. - Não é para fazer 

-- 18 Mostre a média de preço dos filmes alugados por cliente, mas apenas dos que alugaram 3 ou mais filmes.
	SELECT clientes.nome AS Nome_Cliente, AVG(filmes.preco) AS Media_Preco
	FROM clientes
	INNER JOIN locacao 
		ON clientes.id = locacao.clientes_id
	INNER JOIN locacao_has_filme
		ON locacao.id = locacao_has_filme.locacao_id
	INNER JOIN filmes
		ON filmes.id = locacao_has_filme.filmes_id
	GROUP BY clientes.nome
	HAVING COUNT(filmes.id) >= 3;
    
-- 19 Atualize o nome de um dos clientes com UPDATE - Concluido
UPDATE clientes
SET clientes.nome = "Ricardo Alves Lopes"
WHERE clientes.id = 1;

-- 20 Exclua um dos filmes com DELETE - Concluido - Nao vai estar funcionando por que ele nao deixa excluir por conta da FK
DELETE FROM filmes
WHERE id = 3;
