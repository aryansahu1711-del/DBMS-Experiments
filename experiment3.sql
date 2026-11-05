CREATE DATABASE Experiment3DB;
USE Experiment3DB;

CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Age INT,
    City VARCHAR(30)
);

DESC Persons;

INSERT INTO Persons VALUES
(1, 'Rahul', 'Sharma', 21, 'Delhi'),
(2, 'Amit', 'Kumar', 22, 'Bhubaneswar'),
(3, 'Priya', 'Das', 20, 'Cuttack'),
(4, 'Neha', 'Singh', 23, 'Kolkata'),
(5, 'Rohan', 'Patel', 21, 'Mumbai');

SELECT * FROM Persons;

SELECT FirstName, Age FROM Persons;

ALTER TABLE Persons ADD Email VARCHAR(50);

ALTER TABLE Persons MODIFY Age SMALLINT;

ALTER TABLE Persons DROP COLUMN City;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(101, 'Arjun', 'HR', 25000),
(102, 'Riya', 'IT', 35000),
(103, 'Karan', 'Sales', 30000);

RENAME TABLE Employees TO Staff;

UPDATE Staff
SET Department = 'Finance'
WHERE EmployeeID = 101;

SELECT * FROM Staff;

DELETE FROM Staff
WHERE EmployeeID = 103;

SELECT * FROM Staff;

TRUNCATE TABLE Persons;

DROP TABLE Persons;
