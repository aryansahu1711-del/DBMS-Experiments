CREATE DATABASE Experiment5DB;

USE Experiment5DB;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Designation VARCHAR(30),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

INSERT INTO Employee VALUES
(1, 'Rahul', 'Developer', 'IT', 35000, '2022-01-15'),
(2, 'Priya', 'Manager', 'HR', 45000, '2020-06-10'),
(3, 'Amit', 'Analyst', 'Finance', 30000, '2021-03-20'),
(4, 'Neha', 'Developer', 'IT', 40000, '2023-02-12'),
(5, 'Rohan', 'Manager', 'Sales', 50000, '2019-08-25'),
(6, 'Sneha', 'Analyst', 'Finance', 32000, '2022-11-05'),
(7, 'Karan', 'Clerk', 'HR', 25000, '2024-01-10');

SELECT * FROM Employee;

SELECT
    UPPER(EmployeeName) AS UpperName,
    LOWER(EmployeeName) AS LowerName
FROM Employee;

SELECT
    EmployeeName,
    LENGTH(EmployeeName) AS NameLength
FROM Employee;

SELECT
    CONCAT(EmployeeName, ' - ', Designation) AS EmployeeDetails
FROM Employee;

SELECT
    EmployeeName,
    SUBSTRING(EmployeeName, 1, 3) AS FirstThreeCharacters
FROM Employee;

SELECT
    EmployeeName,
    ROUND(Salary, -3) AS RoundedSalary
FROM Employee;

SELECT
    EmployeeName,
    ABS(Salary - 35000) AS SalaryDifference
FROM Employee;

SELECT
    CURDATE() AS CurrentDate,
    NOW() AS CurrentDateTime;

SELECT
    EmployeeName,
    JoiningDate,
    FLOOR(DATEDIFF(CURDATE(), JoiningDate) / 365) AS YearsOfService
FROM Employee;

SELECT COUNT(*) AS TotalEmployees
FROM Employee;

SELECT MAX(Salary) AS MaximumSalary,
       MIN(Salary) AS MinimumSalary,
       AVG(Salary) AS AverageSalary,
       SUM(Salary) AS TotalSalary
FROM Employee;

SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Department;
