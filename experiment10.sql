CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    PublicationYear INT,
    AvailableCopies INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(150)
);

CREATE TABLE IssueReturn (
    IssueID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Books VALUES
(101,'The Alchemist','Paulo Coelho',1988,100,350.00),
(102,'Wings of Fire','A.P.J. Abdul Kalam',1999,100,280.00),
(103,'Atomic Habits','James Clear',2018,100,450.00),
(104,'Rich Dad Poor Dad','Robert Kiyosaki',1997,100,400.00),
(105,'Ikigai','Hector Garcia',2016,100,320.00);

INSERT INTO Members VALUES
(1,'Rahul','9876543210','Bhubaneswar'),
(2,'Priya','9876543211','Cuttack'),
(3,'Amit','9876543212','Balangir'),
(4,'Sneha','9876543213','Puri'),
(5,'Rohan','9876543214','Sambalpur');

INSERT INTO IssueReturn VALUES
(1,101,1,'2026-01-10',NULL,'Issued'),
(2,102,2,'2026-01-12',NULL,'Issued'),
(3,103,3,'2026-01-15',NULL,'Issued'),
(4,104,4,'2026-01-18',NULL,'Issued'),
(5,101,2,'2026-01-20',NULL,'Issued');

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM IssueReturn;

SELECT Books.Title, Members.MemberName, IssueReturn.IssueDate
FROM IssueReturn
INNER JOIN Books ON IssueReturn.BookID = Books.BookID
INNER JOIN Members ON IssueReturn.MemberID = Members.MemberID;

SELECT Members.MemberName, Books.Title, IssueReturn.IssueDate
FROM Members
LEFT JOIN IssueReturn ON Members.MemberID = IssueReturn.MemberID
LEFT JOIN Books ON IssueReturn.BookID = Books.BookID;

SET SQL_SAFE_UPDATES = 0;

UPDATE Books SET AvailableCopies = AvailableCopies - 2
WHERE BookID = 101;

UPDATE Books SET AvailableCopies = AvailableCopies - 1
WHERE BookID IN (102,103,104);

UPDATE IssueReturn
SET Status = 'Returned', ReturnDate = '2026-02-01'
WHERE IssueID = 1;

UPDATE Books SET AvailableCopies = AvailableCopies + 1
WHERE BookID = 101;

UPDATE Books SET AvailableCopies = AvailableCopies + 5
WHERE BookID = 105;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Books;
SELECT * FROM IssueReturn;

ALTER TABLE Books ADD ISBN VARCHAR(20);

ALTER TABLE Members DROP COLUMN Address;

ALTER TABLE Books
MODIFY Title VARCHAR(100) NOT NULL;

ALTER TABLE Members
ADD CONSTRAINT chk_phone
CHECK (Phone REGEXP '^[0-9]{10}$');

SELECT * FROM Books;
SELECT * FROM Members;

SELECT COUNT(*) AS TotalBooks FROM Books;

SELECT MAX(PublicationYear) AS LatestPublication,
       MIN(PublicationYear) AS OldestPublication
FROM Books;

SELECT COUNT(*) AS CurrentlyIssuedBooks
FROM IssueReturn
WHERE Status = 'Issued';

SELECT Books.Title, Members.MemberName, IssueReturn.IssueDate
FROM IssueReturn
INNER JOIN Books ON IssueReturn.BookID = Books.BookID
INNER JOIN Members ON IssueReturn.MemberID = Members.MemberID
WHERE IssueReturn.Status = 'Issued';

CREATE VIEW IssuedBooksView AS
SELECT Books.Title, Members.MemberName, IssueReturn.IssueDate
FROM IssueReturn
INNER JOIN Books ON IssueReturn.BookID = Books.BookID
INNER JOIN Members ON IssueReturn.MemberID = Members.MemberID
WHERE IssueReturn.Status = 'Issued';

SELECT * FROM IssuedBooksView;

DELIMITER //

CREATE PROCEDURE GetIssuedBooks()
BEGIN
    SELECT Books.Title, Members.MemberName, IssueReturn.IssueDate
    FROM IssueReturn
    INNER JOIN Books ON IssueReturn.BookID = Books.BookID
    INNER JOIN Members ON IssueReturn.MemberID = Members.MemberID
    WHERE IssueReturn.Status = 'Issued';
END //

DELIMITER ;

CALL GetIssuedBooks();

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Members WHERE MemberID = 5;
DELETE FROM Books WHERE BookID = 105;

SET SQL_SAFE_UPDATES = 1;

RENAME TABLE IssueReturn TO Transactions;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Transactions;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Transactions;
