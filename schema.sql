-- Ferramenta utilizada: MySQL Workbench
-- Justificativa: Utilizada por permitir criar bancos de dados MySQL,

CREATE DATABASE IF NOT EXISTS cantina_escolar;
USE cantina_escolar;

-- Tabelas
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  data_venda DATE NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venda_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (venda_id) REFERENCES vendas(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- INSERTS
INSERT INTO clientes (nome) VALUES
('Ana Paula'),
('Carlos Silva'),
('Mariana Costa');

INSERT INTO produtos (nome, preco) VALUES
('Coxinha', 6.50),
('Pastel', 8.00),
('Suco', 5.00),
('Refrigerante', 7.00),
('Chocolate', 4.50);

INSERT INTO vendas (cliente_id, data_venda) VALUES
(1, '2025-12-01'),
(2, '2025-12-02');

INSERT INTO itens_venda (venda_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 4, 2);

-- UPDATE
UPDATE produtos
SET preco = 9.00
WHERE nome = 'Pastel';

UPDATE clientes
SET nome = 'Carlos Henrique Silva'
WHERE id = 2;

-- DELETE
DELETE FROM itens_venda
WHERE id = 4;

-- SELECTS
SELECT * FROM produtos;

SELECT * FROM produtos
WHERE preco > 10;

SELECT * FROM clientes
WHERE nome LIKE '%Silva%';

SELECT v.id, c.nome, v.data_venda
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id;

SELECT c.nome AS cliente, p.nome AS produto, i.quantidade
FROM itens_venda i
JOIN vendas v ON i.venda_id = v.id
JOIN clientes c ON v.cliente_id = c.id
JOIN produtos p ON i.produto_id = p.id;

-- CONEXÃO
SELECT VERSION();
SELECT DATABASE();

-- ===============================
-- TESTES REALIZADOS
-- ===============================
-- Teste 1: Inserção de cliente → cliente aparece no SELECT
-- Teste 2: Atualização de produto → preço alterado corretamente
-- Teste 3: Exclusão de item → item removido com sucesso
-- Teste 4: Consulta com JOIN → dados exibidos corretamenteSELECT * FROM demo;
