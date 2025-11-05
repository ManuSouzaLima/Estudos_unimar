USE ecommerce;

-- exercicio 1 
SELECT produtos.nome, categorias.nome 
FROM produtos
INNER JOIN categorias
    ON produtos.categorias_id = categorias.id;

-- exercicio 2 
SELECT produtos.nome, categorias.nome
FROM produtos
RIGHT JOIN categorias
    ON categorias_id = categorias.id;

-- exercicio 3 
SELECT produtos.nome, categorias.nome
FROM produtos
LEFT JOIN categorias
    ON categorias_id = categorias.id;

-- exercicio 4
SELECT clientes.nome, pedidos.id
FROM pedidos
INNER JOIN clientes
    ON pedidos.clientes_id = clientes.id;

-- exercicio 5 
SELECT clientes.nome, produtos.nome 
FROM clientes
INNER JOIN pedidos
    ON clientes.id = produtos.clientes_id
INNER JOIN pedido_has_produto
    ON pedidos.id = pedido_has_produto.pedidos_id
INNER JOIN produtos
    ON pedido_has_produto.produtos_id = produtos.id;

-- exercicio 6 
SELECT clientes.nome, SUM(pedido_has_produto.quantidade)
FROM clientes
INNER JOIN pedidos
    ON clientes.id = pedidos.clientes_id
INNER JOIN pedido_has_produto
    ON pedidos.id = pedido_has_produto.pedidos_id
GROUP BY clientes.id; 

-- exercicio 7 
SELECT * FROM categorias
LEFT JOIN produtos
    ON produtos,categorias_id = categorias.id
WHERE produtos.id IS NULL;

--exercicio 8 
SELECT COUNT(*) AS total_combinacoes -- isso exibe no fim o nome da coluna que será feito a contagem do Count
FROM produtos 
CROSS JOIN categorias;
