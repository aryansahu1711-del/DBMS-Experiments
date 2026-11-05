
SET @num1 = 20;
SET @num2 = 10;
SET @student_name = 'Aryan';
SET @joining_date = '2026-11-05';

SELECT @num1 AS Number1, @num2 AS Number2;
SELECT @student_name AS StudentName;
SELECT @joining_date AS JoiningDate;

SELECT
    CAST(25 AS SIGNED) AS IntegerValue,
    CAST(25.75 AS DECIMAL(5,2)) AS DecimalValue,
    CAST('Hello MySQL' AS CHAR(20)) AS StringValue,
    CAST('2026-11-05' AS DATE) AS DateValue;

SELECT
    20 + 10 AS Addition,
    20 - 10 AS Subtraction,
    20 * 10 AS Multiplication,
    20 / 10 AS Division,
    20 % 10 AS Modulus;

SELECT
    10 = 10 AS EqualTo,
    10 < 20 AS LessThan,
    20 > 10 AS GreaterThan,
    10 <= 10 AS LessThanEqual,
    20 >= 10 AS GreaterThanEqual,
    10 <> 20 AS NotEqual;

SELECT
    10 = 10 AND 20 > 10 AS AndOperator,
    10 = 20 OR 20 > 10 AS OrOperator,
    10 IN (5, 10, 15) AS InOperator,
    15 BETWEEN 10 AND 20 AS BetweenOperator,
    'Sohan' LIKE 'S%' AS LikeOperator,
    NOT (10 = 20) AS NotOperator;
