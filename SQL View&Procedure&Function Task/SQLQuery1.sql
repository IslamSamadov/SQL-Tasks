CREATE DATABASE Library;
USE Library;
CREATE TABLE Books(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100),
	AuhtorId INT FOREIGN KEY REFERENCES Authors(ID),
	CategoryId INT FOREIGN KEY REFERENCES Categories(ID),
	Price INT
)
CREATE TABLE Authors(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
)
CREATE TABLE Categories(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
)
INSERT INTO Authors VALUES
('J.K. Rowling'),
('George Orwell'),
('Agatha Christie'),
('Leo Tolstoy'),
('Dan Brown');
INSERT INTO Categories VALUES
('Fantasy'),
('Dystopian'),
('Detective'),
('Classic'),
('Thriller');
INSERT INTO Books VALUES
('Harry Potter and the Philosopher''s Stone', 1, 1, 19.99),
('1984', 2, 2, 14.50),
('Murder on the Orient Express', 3, 3, 12.75),
('War and Peace', 4, 4, 25.00),
('The Da Vinci Code', 5, 5, 17.80);

--1ci Task
CREATE VIEW VBookDetails AS
SELECT
B.Name AS BookName,
A.Name AS AuthorName,
C.Name AS CategoryName,
B.Price
FROM Books B JOIN
Authors A ON B.AuhtorId = A.ID
JOIN Categories C ON B.CategoryId = C.ID;

--2ci Task
CREATE FUNCTION Capitalize(@name NVARCHAR(100))
RETURNS NVARCHAR(100) AS
BEGIN RETURN UPPER(LEFT(@name,1)) + LOWER(SUBSTRING(@name,2,LEN(@name)));
END;

CREATE PROCEDURE AddBook 
@Name NVARCHAR(100),
@AuthorID INT,
@CategoryID INT,
@Price INT 
AS 
BEGIN
	INSERT INTO Books VALUES(dbo.Capitalize(@Name),@AuthorID,@CategoryID,@Price);
END;
EXEC AddBook  'bOOk',1,1,10
--3cu Task
CREATE FUNCTION NameAuthor(@Id INT)
RETURNS NVARCHAR(200)
AS 
BEGIN 
	DECLARE @result NVARCHAR(200);
	SELECT @result = B.Name + ' ' + A.Name
	FROM Books B JOIN
	Authors A ON B.AuhtorId = A.ID
	WHERE B.ID = @Id;
	RETURN @result;
END;
--4cu Task
CREATE PROCEDURE UpdatePrice 
@ID INT,@Price INT 
AS
BEGIN
	UPDATE Books
	SET Price = Price + @Price
	WHERE ID = @ID;
END;
--5ci Task
CREATE FUNCTION NameCategory(@Id INT)
RETURNS NVARCHAR(200)
AS 
BEGIN 
	DECLARE @result NVARCHAR(200);
	SELECT @result = B.Name + ' - ' + C.Name
	FROM Books B JOIN
	Categories C ON B.CategoryId = C.ID
	WHERE B.ID = @Id;
	RETURN @result;
END;
SELECT dbo.NameCategory(1);
SELECT dbo.NameAuthor(1);