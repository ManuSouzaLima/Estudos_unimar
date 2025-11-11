USE ecommerce;

-- Atividade 1 
UPDATE categorias
SET categorias.nome = 'Componentes de PC'
WHERE categorias.id = 3;
SELECT * FROM categorias

-- Atividade 2 
UPDATE produtos
SET produtos.nome = 'Mouse Redragon RGB'
WHERE produtos.id = 1;
SELECT * FROM categorias

-- Atividade 3 

UPDATE produtos
SET produtos.preco = 6299.00
WHERE produtos.id = 3;

-- Atividade 4 
UPDATE produtos
SET produtos.estoque = 40
WHERE produtos.id =4;

-- Atividade 5
UPDATE produtos
SET produtos.estoque = produtos.estoque-1
WHERE produtos.id = 3;

-- Atividade 6 
UPDATE produtos 
SET produtos.preco = produtos.preco * 1.10
WHERE produtos.preco <1000.00;      
SELECT * FROM produtos;

-- Atividade 7
UPDATE produtos 
SET produtos.estoque = produtos.estoque-2
WHERE produtos.estoque <5000.00;      
SELECT * FROM produtos;

-- Atividade 8

UPDATE produtos
SET produtos.preco = 100.00
WHERE produtos.preco = 0.00;

-- Atividade 9 
UPDATE produtos 
SET produtos.nome = 'Memória RAM DDR4'
WHERE produtos.nome LIKE '%RAM%';

-- Atividade 10
UPDATE produtos 
SET produtos.preco = produtos.preco * 1.05
WHERE produtos.estoque <20;

-- Atividade 11 

UPDATE produtos
SET produtos.nome = 'Mouse Gamer Logitech G Pro X',
	produtos.preco = 799.90
WHERE produtos.id = 1;

-- Atividade 12
UPDATE produtos
SET produtos.nome = 'Mouse Gamer Logitech G Pro X',
	produtos.estoque = 25
WHERE produtos.id = 1;

-- Atividade 13
UPDATE produtos 
SET produtos.preco = produtos.preco * 1.08,
	produtos.estoque = produtos.estoque - 1;
SELECT * FROM produtos;

-- Atividade 14
UPDATE produtos 
SET produtos.preco = produtos.preco * 1.08
WHERE produtos.estoque = 20;

-- Atividade 15
UPDATE produtos 
SET produtos.preco = 0.00
WHERE produtos.preco <0.00;

-- Atividade 16 
UPDATE produtos 
SET produtos.preco = produtos.preco * 1.12
WHERE produtos.nome LIKE '%Logitech%';

-- Ativdade 17
UPDATE produtos
SET produtos.estoque = produtos.estoque-1
WHERE produtos.id = 3;

-- Atividade 18 
UPDATE produtos 
SET produtos.preco = produtos.preco * 0.95
WHERE produtos.nome LIKE '%Memória%';

-- Atividade 19
UPDATE produtos 
SET produtos.categorias_id = 1
WHERE produtos.categorias_id IS NULL;

-- ATIVIDADE 20
UPDATE produtos 
SET produtos.estoque = 100;
SELECT * FROM produtos
