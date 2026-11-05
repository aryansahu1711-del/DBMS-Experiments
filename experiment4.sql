DROP DATABASE IF EXISTS Experiment4DB;
CREATE DATABASE Experiment4DB;

USE Experiment4DB;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Designation VARCHAR(30),
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(1, 'Suresh', 'Manager', 'Sales', 28000),
(2, 'Kumar', 'Developer', 'IT', 35000),
(3, 'Rahul', 'Developer', 'IT', 25000),
(4, 'Pallavi', 'Clerk', 'HR', 15000),
(5, 'Rohan', 'Manager', 'Sales', 40000),
(6, 'Sameer', 'Analyst', 'Finance', 30000),
(7, 'Sunil', 'Developer', 'IT', 22000),
(8, 'Anil', 'Clerk', 'HR', NULL),
(9, 'Meera', 'Analyst', 'Finance', 18000);

SELECT * FROM Employee;

SELECT * FROM Employee
WHERE Salary BETWEEN 10000 AND 30000;

SELECT * FROM Employee
WHERE Salary NOT BETWEEN 10000 AND 30000;

SELECT * FROM Employee
WHERE Designation IN ('Manager', 'Developer');

SELECT * FROM Employee
WHERE Designation NOT IN ('Manager', 'Developer');

SELECT * FROM Employee
WHERE Salary IS NULL;

SELECT * FROM Employee
WHERE Salary IS NOT NULL;

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE 'S%';

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE '%r';

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE '%u%';

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE '%a%';

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE '%ll%';

SELECT EmployeeName FROM Employee
WHERE EmployeeName LIKE '%e%';

SELECT * FROM Employee WHERE Salary = 25000;
SELECT * FROM Employee WHERE Salary != 25000;
SELECT * FROM Employee WHERE Salary > 25000;
SELECT * FROM Employee WHERE Salary < 25000;
SELECT * FROM Employee WHERE Salary >= 25000;
SELECT * FROM Employee WHERE Salary <= 25000;

SELECT * FROM Employee
WHERE Designation = 'Developer' AND Salary > 20000;

SELECT * FROM Employee
WHERE Designation = 'Manager' OR Salary > 30000;

SELECT * FROM Employee
ORDER BY EmployeeName ASC;

SELECT * FROM Employee
ORDER BY EmployeeName DESC;

SELECT DISTINCT Designation FROM Employee;

SELECT Designation, COUNT(*) AS TotalEmployees,
AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Designation;

SELECT Designation, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Designation
HAVING COUNT(*) >= 2;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Employee
WHERE EmployeeName LIKE 'P%';

UPDATE Employee
SET Salary = Salary + 2000
WHERE EmployeeName LIKE 'R%';

SET SQL_SAFE_UPDATES = 1;

SELECT EmployeeName, Salary,
Salary * 0.10 AS Bonus,
Salary * 0.05 AS TaxDeduction,
Salary * 2 AS DoubleSalary
FROM Employee
WHERE Salary IS NOT NULL;

SELECT * FROM Employee;
