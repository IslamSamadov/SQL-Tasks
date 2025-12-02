CREATE DATABASE BookStore;
CREATE TABLE book(
	ID INT Primary KEY IDENTITY(1,1),
	Title NVARCHAR(100) NOT NULL,
	Author NVARCHAR(50) NOT NULL,
	Price INT NOT NULL CONSTRAINT CK_Book_Price CHECK (Price >=0 AND Price <= 200) DEFAULT 0,
	PageCount INT NOT NULL CONSTRAINT CK_Book_PageCount CHECK (PageCount >= 0) DEFAULT 0,
	Genre NVARCHAR(20) NOT NULL DEFAULT 'Dram',
	ReleaseYear INT NOT NULL
)

ALTER TABLE Book ADD BookLanguage NVARCHAR(30) NOT NULL;
ALTER TABLE Book DROP COLUMN BookLanguage;
INSERT INTO Book VALUES
('The Lost World', 'Arthur Conan Doyle', 15, 350, 'Fantasy', 1912),
('Love in Winter', 'Sarah Collins', 12, 220, 'Romance', 2015),
('Dark Forest', 'Mark Green', 25, 410, 'Horror', 2010),
('Magic River', 'Lina Parks', 8, 150, 'Fantasy', 2005),
('Brave Hearts', 'Tom Hardy', 30, 500, 'Drama', 2020),
('Silent Night', 'Anna Grey', 5, 90, 'Mystery', 1998);
UPDATE Book SET Price = 15 WHERE ID = 3;
DELETE FROM Book Where Title = 'Love in Winter';
SELECT * FROM Book;
SELECT Title,Author FROM Book;
SELECT * FROM Book WHERE Price > 20;
SELECT * FROM Book WHERE Genre = 'Fantasy';
SELECT * FROM Book WHERE ReleaseYear < 2010;
SELECT * FROM Book WHERE Price >= 10 AND Price <= 30;
SELECT * FROM Book WHERE Price > 15 AND PageCount < 100;
SELECT * FROM Book WHERE Author LIKE 'A%';
SELECT * FROM Book WHERE Title LIKE '%love%';
SELECT * FROM Book WHERE Genre = 'Fantasy' OR Genre = 'Horror';
SELECT * FROM Book WHERE ReleaseYear > 2000 AND PageCount > 300;
SELECT * FROM Book WHERE Price IN(10,20,30);
SELECT * FROM Book ORDER BY Price;
SELECT * FROM Book ORDER BY PageCount DESC;
SELECT MAX(Price) AS MaxPrice FROM Book;
SELECT MIN(PageCount) AS MinPage FROM Book;
SELECT COUNT(*) AS TotalBooks FROM Book;
SELECT AVG(Price) AS AveragePrice FROM Book;