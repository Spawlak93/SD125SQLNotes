-- CREATE database
CREATE DATABASE GeneralStoreDB

-- CREATE Products Table
CREATE  TABLE Products 
(
    --Identity starts at 1(the first number), increments by 1
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    -- CHECK is a way we can put requirements in our tables
    QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0),
    Price FLOAT NOT NULL
)

-- Putting Products into Database
INSERT INTO Products (Name, QuantityInStock, Price) VALUES
('Box of Pencils', 500, 1.99),
('Box of Crayons', 1000, 3.99),
('Electic Pencil Sharpener', 178, 15.32)

--Retrieving Data
SELECT Name, Price FROM Products WHERE Id = 3

SELECT Name, Price FROM Products Where Name = 'Box of Pencils'

-- Starts with
SELECT Name, Price FROM Products WHERE Name LIKE 'Box%'
-- Ends with
SELECT Name, Price FROM Products WHERE Name LIKE '%r'
-- Contains
SELECT Name, Price FROM Products WHERE Name LIKE '%Pencil%'

--Adding Transaction Join Table
CREATE TABLE Transactions
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)    
)

INSERT INTO Transactions (CustomerId, ProductId, Quantity) VALUES
(1,1,10), (1, 1, 30), (1, 4, 12),
(2, 3, 5), (2, 4, 1),
(3, 1, 4), (3, 4, 12), (3,1, 9)

--Selecting Name from Customer Calling it CustomerName
--Selecting Name From Producting Calling It ProductName
--Selecing Quantity from Transaction
SELECT C.Name AS CustomerName, P.Name AS ProductName, T.Quantity
FROM (
    --To Join Three tables we join two tables and then join two tables again
    --Transactions table as T Joining with Customer Table called C
    (Transactions AS T INNER JOIN Customers AS C ON T.CustomerId = c.Id)
    --Joining "CustomersTransactions" table with Products Table
INNER JOIN Products AS P ON T.ProductId = P.Id)
    --Order base on names
ORDER BY CustomerName ASC

UPDATE Products SET Price = 2.99 WHERE Id = 4

ALTER TABLE Products ADD Weight FLOAT

ALTER TABLE Products ADD Wight FLOAT

ALTER TABLE Products DROP COLUMN Wight

ALTER TABLE Products ADD Test INT CHECK (Test >= 0)

ALTER TABLE Products Drop CONSTRAINT CK__Products__Test__30F848ED

UPDATE Products SET Price = 3.25 WHERE name = 'Box of Pencils' AND Price = 1.99

Insert INTO Products (Name, Price, QuantityInStock, Weight)
VALUES ('Paper', 5, 1000, 10)

DELETE FROM Products WHERE Id = 5

DROP TABLE Transactions

DROP DATABASE TestDB