----- Criação do banco de dados -----

CREATE DATABASE bdMerge
USE bdMerge

-- Exercício 1 --

----- Criação das tabelas -----

CREATE TABLE tbl_source (
	ItemID INT PRIMARY KEY NOT NULL,
	ItemName VARCHAR(10) NOT NULL,
	Qty INT NOT NULL
);

CREATE TABLE tbl_target (
	ItemID INT PRIMARY KEY NOT NULL,
	ItemName VARCHAR(10) NOT NULL,
	Qty INT NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_source
VALUES (101, 'Orange', 35),
       (103, 'Banana', 14),
	   (104, 'Grapes', 16)

INSERT INTO tbl_target
VALUES (100, 'Mango', 10),
       (101, 'Orange', 15),
	   (102, 'Apple', 25)


-- Exercício 2 --

----- Realização do merge -----

MERGE tbl_target AS Destino
USING tbl_source AS Origem
ON Destino.ItemID = Origem.ItemID

	WHEN MATCHED THEN
		UPDATE SET Destino.Qty = Origem.Qty
	WHEN NOT MATCHED THEN
		INSERT (ItemID, ItemName, Qty) VALUES (Origem.ItemID, Origem.ItemName, Origem.Qty);
SELECT * FROM tbl_target


-- Exercício 3 --

----- Criação das tabelas -----

CREATE TABLE tbl_vendas (
	Id_Venda INT PRIMARY KEY IDENTITY(1,1),
	Dt_Venda DATE NOT NULL,
	Id_Produto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor FLOAT NOT NULL
);

CREATE TABLE tbl_vendas2 (
	Id_Venda INT PRIMARY KEY IDENTITY(4,1),
	Dt_Venda DATE NOT NULL,
	Id_Produto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor FLOAT NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_vendas
VALUES ('20180921', 1, 2, 25.99),
       ('20180921', 2, 3, 29.99),
	   ('20180921', 1, 1, 15.99)

INSERT INTO tbl_vendas2
VALUES ('20180922', 1, 2, 25.99),
       ('20180922', 2, 1, 10.00),
	   ('20180922', 9, 1, 35.99),
	   ('20180922', 5, 3, 20.00),
	   ('20180922', 3, 2, 25.87),
	   ('20180922', 2, 1, 11.25),
	   ('20180922', 1, 1, 21.90),
	   ('20180922', 4, 3, 29.99)


-- Exercício 4 --

----- Realização do merge -----

MERGE tbl_vendas AS Destino
USING tbl_vendas2 AS Origem
ON Destino.Id_Venda = Origem.Id_Venda

	WHEN MATCHED THEN
		UPDATE SET Destino.Dt_Venda = Origem.Dt_Venda
	WHEN NOT MATCHED THEN
		INSERT (Dt_Venda, Id_Produto, Quantidade, Valor) VALUES (Origem.Dt_Venda, Origem.Id_Produto, Origem.Quantidade, Origem.Valor);
SELECT * FROM tbl_vendas


-- Exercício 5 --

----- Criação das tabelas -----

CREATE TABLE tbl_produtos (
	ID INT PRIMARY KEY NOT NULL,
	Product_Name VARCHAR(10) NOT NULL,
	Price DECIMAL(5,2) NOT NULL
);

CREATE TABLE tbl_produtos2 (
	ID INT PRIMARY KEY NOT NULL,
	Product_Name VARCHAR(10) NOT NULL,
	Price DECIMAL(5,2) NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_produtos
VALUES (1, 'Table', 150),
       (2, 'Desk', 100),
	   (3, 'Chair', 75),
	   (4, 'Computer', 225)

INSERT INTO tbl_produtos2
VALUES (1, 'Table', 150),
       (2, 'Desk', 150),
	   (3, 'Bed', 100),
	   (4, 'Cupboard', 350)


-- Exercício 6 --

----- Realização do merge -----

MERGE tbl_produtos AS Destino
USING tbl_produtos2 AS Origem
ON Destino.ID = Origem.ID

	WHEN MATCHED THEN
		UPDATE SET Destino.Price = Origem.Price
	WHEN NOT MATCHED THEN
		INSERT (ID, Product_Name, Price) VALUES (Origem.ID, Origem.Product_Name, Origem.Price);
SELECT * FROM tbl_produtos