CREATE DATABASE FOOD;
USE FOOD;
CREATE TABLE Categories(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50)
);
CREATE TABLE Meals(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50),
	CategoriesId INT FOREIGN KEY REFERENCES Categories(ID)
);
INSERT INTO Categories
VALUES 
('Soup'),
('Salad'),
('Main Course'),
('Dessert');
INSERT INTO Categories VALUES('Cate');
INSERT INTO Meals
VALUES
('Chicken Soup', 1),
('Lentil Soup', 1),
('Greek Salad', 2),
('Caesar Salad', 2),
('Grilled Chicken', 3),
('Pasta Carbonara', 3),
('Chocolate Cake', 4),
('Ice Cream', 4);
INSERT INTO  Meals (Name) VALUES('Pizza')
SELECT Meals.Name, Categories.Name FROM Meals JOIN Categories ON Meals.CategoriesId = Categories.Id;
SELECT Meals.Name, Categories.Name FROM Meals LEFT JOIN Categories ON Meals.CategoriesId = Categories.Id;
SELECT * FROM Categories;
SELECT * FROM Meals WHERE CategoriesId IS NULL;
SELECT Categories.Name FROM Categories LEFT JOIN Meals ON Meals.CategoriesId = Categories.Id WHERE Meals.ID IS NULL;
SELECT Meals.Name, Categories.Name FROM Meals FULL OUTER JOIN Categories ON Meals.CategoriesId = Categories.Id;