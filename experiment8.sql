CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT,
    Capacity INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(5),
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(1, 'Rahul', 20, 'Male', 'Bhubaneswar'),
(2, 'Priya', 21, 'Female', 'Cuttack'),
(3, 'Amit', 22, 'Male', 'Balangir'),
(4, 'Neha', 20, 'Female', 'Puri'),
(5, 'Rohan', 23, 'Male', 'Sambalpur');

INSERT INTO Courses VALUES
(101, 'Database Management', 4, 50),
(102, 'Computer Networks', 3, 40),
(103, 'Operating Systems', 4, 45),
(104, 'Data Structures', 5, 60),
(105, 'Mathematics', 3, 35);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2026-01-10', 'B', 'Active'),
(2, 2, 102, '2026-01-12', 'A', 'Active'),
(3, 3, 103, '2026-01-15', 'B', 'Active'),
(4, 4, 101, '2026-01-18', 'C', 'Active'),
(5, 1, 104, '2026-01-20', 'A', 'Active');

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Enrollments;

SELECT
    S.Name,
    C.CourseName,
    E.EnrollmentDate
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

SELECT
    S.StudentID,
    S.Name,
    C.CourseName
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
LEFT JOIN Courses C ON E.CourseID = C.CourseID;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 101;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 101;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 102;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 103;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 104;

UPDATE Enrollments
SET Grade = 'A', Status = 'Completed'
WHERE EnrollmentID = 1;

UPDATE Courses
SET Capacity = Capacity + 5
WHERE CourseID = 101;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Students
WHERE StudentID = 5;

DELETE FROM Courses
WHERE CourseID = 105;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE Students
ADD Email VARCHAR(100);

ALTER TABLE Students
DROP COLUMN Address;

ALTER TABLE Students
MODIFY Name VARCHAR(50) NOT NULL;

ALTER TABLE Students
ADD CONSTRAINT chk_student_age CHECK (Age >= 18);

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT COUNT(*) AS TotalStudents
FROM Students;

SELECT
    MAX(Credits) AS MaximumCredits,
    MIN(Credits) AS MinimumCredits
FROM Courses;

SELECT COUNT(*) AS ActiveEnrollments
FROM Enrollments
WHERE Status = 'Active';

CREATE VIEW ActiveEnrollmentsView AS
SELECT
    C.CourseName,
    S.Name AS StudentName,
    E.EnrollmentDate
FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE E.Status = 'Active';

SELECT * FROM ActiveEnrollmentsView;

DELIMITER //

CREATE PROCEDURE GetActiveEnrollments()
BEGIN
    SELECT
        C.CourseName,
        S.Name AS StudentName,
        E.EnrollmentDate
    FROM Enrollments E
    JOIN Students S ON E.StudentID = S.StudentID
    JOIN Courses C ON E.CourseID = C.CourseID
    WHERE E.Status = 'Active';
END //

DELIMITER ;

CALL GetActiveEnrollments();

RENAME TABLE Enrollments TO Registrations;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Registrations;

SET FOREIGN_KEY_CHECKS = 1;
