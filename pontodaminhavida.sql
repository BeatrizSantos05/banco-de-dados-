CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE restaurante (
    id_restaurante INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_restaurante INT NOT NULL,
    data_pedido DATE NOT NULL,
    taxa_entrega NUMERIC(6,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(6,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

INSERT INTO cliente (id_cliente, nome, cidade) VALUES 
(1, 'Carlos Silva', 'Aquidauana'),
(2, 'Ana Souza', 'Aquidauana'),
(3, 'Marcos Lima', 'Anastácio'),
(4, 'Julia Costa', 'Campo Grande'),
(5, 'Roberto Dias', 'Aquidauana'),
(6, 'Fernanda Oliveira', 'Anastácio');

INSERT INTO restaurante (id_restaurante, nome, categoria, cidade) VALUES 
(1, 'Pizzaria Bella Italia', 'Pizzaria', 'Aquidauana'),
(2, 'Burger House', 'Lanchonete', 'Aquidauana'),
(3, 'Sushi Box', 'Japonesa', 'Anastácio'),
(4, 'Cantina da Nonna', 'Italiana', 'Campo Grande');

INSERT INTO pedido (id_pedido, id_cliente, id_restaurante, data_pedido, taxa_entrega) VALUES 
(101, 1, 1, '2026-06-01', 5.00),
(102, 2, 1, '2026-06-01', 5.00),
(103, 3, 2, '2026-06-02', 7.50),
(104, 1, 3, '2026-06-02', 10.00),
(105, 4, 4, '2026-06-03', 0.00),
(106, 2, 2, '2026-06-03', 6.00),
(107, 5, 1, '2026-06-04', 5.00),
(108, 1, 2, '2026-06-04', 6.50);

INSERT INTO item_pedido (id_item, id_pedido, produto, quantidade, preco_unitario) VALUES 
(1, 101, 'Pizza Calabresa', 1, 45.00),
(2, 101, 'Refrigerante 2L', 1, 8.00),
(3, 102, 'Pizza Muçarela', 1, 40.00),
(4, 103, 'Monster Burger', 2, 32.00),
(5, 103, 'Batata Frita', 1, 15.00),
(6, 104, 'Combo Sushi 20pçs', 1, 60.00),
(7, 105, 'Lasanha Bolonhesa', 1, 55.00),
(8, 105, 'Vinho da Casa', 1, 40.00),
(9, 106, 'Cheeseburger', 1, 22.00),
(10, 107, 'Pizza Frango c/ Catupiry', 1, 48.00),
(11, 108, 'Smash Burger', 1, 25.00),
(12, 108, 'Suco Natural', 2, 7.00);

SELECT c.nome, p.id_pedido, p.data_pedido
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente;

SELECT p.id_pedido, r.nome AS restaurante, r.categoria
FROM pedido p
INNER JOIN restaurante r ON p.id_restaurante = r.id_restaurante
WHERE r.categoria = 'Pizzaria';

SELECT c.nome, p.id_pedido
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente;

SELECT c.nome, p.data_pedido FROM cliente c INNER JOIN pedido p ON c.id_cliente = p.id_cliente;

SELECT c.nome, r.nome, p.data_pedido FROM pedido p INNER JOIN cliente c ON p.id_cliente = c.id_cliente INNER JOIN restaurante r ON p.id_restaurante = r.id_restaurante;

SELECT id_cliente, COUNT(*) AS qtde FROM pedido GROUP BY id_cliente;

SELECT id_restaurante, COUNT(*) AS qtde FROM pedido GROUP BY id_restaurante HAVING COUNT(*) >= 3;
