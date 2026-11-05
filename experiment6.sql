CREATE DATABASE Experiment6DB;

USE Experiment6DB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2) DEFAULT 25000,
    JoiningDate DATE DEFAULT (CURRENT_DATE),
    DepartmentID INT,
    MobileNumber VARCHAR(10)
);

ALTER TABLE Employee
ADD CONSTRAINT fk_department
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID);

ALTER TABLE Employee
ADD CONSTRAINT chk_salary
CHECK (Salary >= 10000);

ALTER TABLE Employee
ADD CONSTRAINT uq_mobile
UNIQUE (MobileNumber);

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Employee
(EmployeeID, EmployeeName, Email, Salary, JoiningDate, DepartmentID, MobileNumber)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 35000, '2022-01-15', 1, '9876543210'),
(102, 'Priya', 'priya@gmail.com', 45000, '2021-05-20', 2, '9876543211'),
(103, 'Amit', 'amit@gmail.com', 30000, '2023-03-10', 3, '9876543212');

INSERT INTO Employee
(EmployeeID, EmployeeName, Email, DepartmentID, MobileNumber)
VALUES
(104, 'Neha', 'neha@gmail.com', 1, '9876543213');

ALTER TABLE Employee
ALTER COLUMN Salary SET DEFAULT 30000;

SELECT * FROM Department;

SELECT * FROM Employee;

DESC Employee;
