-- Pergunta 1: Selecione o nome do contato e o telefone de todos os clientes que moram em Londres.
SELECT ContactName, Phone
FROM Customers
WHERE City = 'London';

-- Pergunta 2: Mostre todos os produtos que estão com o estoque zerado, ordenados pelo nome do produto em ordem alfabética.
SELECT *
FROM Products
WHERE UnitsInStock = 0
ORDER BY ProductName ASC;

-- Pergunta 3: Liste todos os pedidos que foram feitos no mês de maio de 1997, ordenando pela data do pedido do mais recente para o mais antigo.
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1997
  AND MONTH(OrderDate) = 5
ORDER BY OrderDate DESC;

-- Pergunta 4: Identifique os 5 produtos mais caros da loja, retornando o nome do produto e o seu preço.
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

-- Pergunta 5: Encontre todos os funcionários que foram contratados antes de 1993 e que moram nos EUA.
SELECT *
FROM Employees
WHERE HireDate < '1993-01-01'
  AND Country = 'USA';

-- Pergunta 6: Quantos produtos ao todo são fornecidos pelo fornecedor de ID = 1?
SELECT COUNT(*) AS TotalProdutos
FROM Products
WHERE SupplierID = 1;

-- Pergunta 7: Qual é o preço médio de todos os produtos cadastrados na tabela Products?
SELECT AVG(UnitPrice) AS PrecoMedio
FROM Products;

-- Pergunta 8: Mostre a quantidade de clientes existentes em cada país.
SELECT Country, COUNT(*) AS QuantidadeClientes
FROM Customers
GROUP BY Country;

-- Pergunta 9: Calcule o valor total de itens em estoque para cada categoria de produto.
SELECT CategoryID, SUM(UnitsInStock) AS TotalItensEmEstoque
FROM Products
GROUP BY CategoryID;

-- Pergunta 10: Liste todos os países que possuem mais de 7 clientes.
SELECT Country, COUNT(*) AS QuantidadeClientes
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 7;

-- Pergunta 11: Mostre o ProductID e o valor total vendido para cada produto na tabela [Order Details], filtrando totais acima de 50000 e ordenando do maior para o menor.
SELECT ProductID, SUM(UnitPrice * Quantity) AS ValorTotalVendido
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(UnitPrice * Quantity) > 50000
ORDER BY ValorTotalVendido DESC;

-- Pergunta 12: Retorne todas as cidades únicas para as quais já foram enviados pedidos.
SELECT DISTINCT ShipCity
FROM Orders;

-- Pergunta 13: Liste o nome de todos os produtos que são da categoria 'Beverages'.
SELECT ProductName
FROM Products
WHERE CategoryID IN (
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName = 'Beverages'
);

-- Pergunta 14: Mostre todos os produtos cujo preço unitário é maior que o preço médio de todos os produtos.
SELECT *
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products
);

-- Pergunta 15: Insira uma nova transportadora na tabela Shippers_Copia.
INSERT INTO Shippers_Copia (CompanyName, Phone)
VALUES ('Loggi', '(11) 99999-9999');

-- Pergunta 16: Atualize o telefone da transportadora "Loggi".
UPDATE Shippers_Copia
SET Phone = '(11) 88888-8888'
WHERE CompanyName = 'Loggi';

-- Pergunta 17: Exclua a transportadora chamada "Speedy Express" da tabela Shippers_Copia.
DELETE FROM Shippers_Copia
WHERE CompanyName = 'Speedy Express';

-- Pergunta 18: Crie uma nova tabela chamada Auditoria com as colunas LogID, NomeTabela e DataModificacao.
CREATE TABLE Auditoria (
    LogID INT,
    NomeTabela VARCHAR(100),
    DataModificacao DATETIME
);

-- Pergunta 19: Recrie a tabela Auditoria com restrições PRIMARY KEY, NOT NULL e DEFAULT.
DROP TABLE Auditoria;

CREATE TABLE Auditoria (
    LogID INT NOT NULL PRIMARY KEY,
    NomeTabela VARCHAR(100) NOT NULL,
    DataModificacao DATETIME NOT NULL DEFAULT GETDATE()
);

-- Pergunta 20: Adicione uma coluna Usuario na tabela Auditoria e, em seguida, remova essa mesma coluna.
ALTER TABLE Auditoria
ADD Usuario VARCHAR(50);

ALTER TABLE Auditoria
DROP COLUMN Usuario;
