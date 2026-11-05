CREATE DATABASE SupermarketDB;

USE SupermarketDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000, 100),
(102, 'Mobile', 'Electronics', 20000, 100),
(103, 'Keyboard', 'Accessories', 1500, 100),
(104, 'Mouse', 'Accessories', 800, 100),
(105, 'Printer', 'Electronics', 12000, 50);

INSERT INTO Customers VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210', 'Bhubaneswar'),
(2, 'Priya', 'priya@gmail.com', '9876543211', 'Cuttack'),
(3, 'Amit', 'amit@gmail.com', '9876543212', 'Puri'),
(4, 'Neha', 'neha@gmail.com', '9876543213', 'Balangir'),
(5, 'Rohan', 'rohan@gmail.com', '9876543214', 'Sambalpur');

INSERT INTO Sales VALUES
(1, 101, 1, '2026-01-10', 2, 100000, 'Completed'),
(2, 102, 2, '2026-01-12', 1, 20000, 'Pending'),
(3, 103, 3, '2026-01-15', 3, 4500, 'Completed'),
(4, 104, 4, '2026-01-18', 2, 1600, 'Pending'),
(5, 101, 2, '2026-01-20', 1, 50000, 'Completed');

SELECT * FROM Products;

SELECT * FROM Customers;

SELECT * FROM Sales;

SELECT
    S.SaleID,
    P.ProductName,
    C.CustomerName,
    S.SaleDate,
    S.Quantity,
    S.TotalAmount,
    S.Status
FROM Sales S
INNER JOIN Products P ON S.ProductID = P.ProductID
INNER JOIN Customers C ON S.CustomerID = C.CustomerID;

SELECT
    P.ProductName,
    C.CustomerName,
    S.SaleDate
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID;

SET SQL_SAFE_UPDATES = 0;

UPDATE Products
SET StockQuantity = StockQuantity - 2
WHERE ProductID = 101;

UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 102;

UPDATE Products
SET StockQuantity = StockQuantity - 3
WHERE ProductID = 103;

UPDATE Products
SET StockQuantity = StockQuantity - 2
WHERE ProductID = 104;

UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 101;

UPDATE Sales
SET Status = 'Completed'
WHERE SaleID = 2;

UPDATE Products
SET Price = Price * 1.10
WHERE ProductID = 101;

DELETE FROM Customers
WHERE CustomerID = 5;

DELETE FROM Products
WHERE ProductID = 105;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE Products
ADD ExpiryDate DATE;

ALTER TABLE Customers
DROP COLUMN Address;

ALTER TABLE Products
MODIFY ProductName VARCHAR(100) NOT NULL;

ALTER TABLE Products
ADD CONSTRAINT chk_product_price CHECK (Price > 0);

SELECT * FROM Products;

SELECT * FROM Customers;

SELECT
    C.CustomerID,
    C.CustomerName,
    P.ProductName,
    S.SaleDate,
    S.Quantity,
    S.TotalAmount
FROM Customers C
INNER JOIN Sales S ON C.CustomerID = S.CustomerID
INNER JOIN Products P ON S.ProductID = P.ProductID;

SELECT
    C.CustomerID,
    C.CustomerName,
    P.ProductName,
    S.SaleDate
FROM Customers C
LEFT JOIN Sales S ON C.CustomerID = S.CustomerID
LEFT JOIN Products P ON S.ProductID = P.ProductID;

SELECT COUNT(*) AS TotalProducts
FROM Products;

SELECT
    MAX(Price) AS MaximumPrice,
    MIN(Price) AS MinimumPrice
FROM Products;

SELECT COUNT(*) AS CompletedSales
FROM Sales
WHERE Status = 'Completed';

CREATE VIEW CompletedSalesView AS
SELECT
    P.ProductName,
    C.CustomerName,
    S.SaleDate
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID
WHERE S.Status = 'Completed';

SELECT * FROM CompletedSalesView;

DELIMITER //

CREATE PROCEDURE GetCompletedSales()
BEGIN
    SELECT
        P.ProductName,
        C.CustomerName,
        S.SaleDate
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    JOIN Customers C ON S.CustomerID = C.CustomerID
    WHERE S.Status = 'Completed';
END //

DELIMITER ;

CALL GetCompletedSales();

RENAME TABLE Sales TO Transactions;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Transactions;

SET FOREIGN_KEY_CHECKS = 1;
