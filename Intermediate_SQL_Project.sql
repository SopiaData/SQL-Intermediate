----- Intermediate Tasks -------
 ---- George Sepiadis  -----

---- 1. CREATE THE DATABSE -------------------------
---- 2. USE THE DATABSE ----------------------------
---- 3. CREATE TABLES ------------------------------
---- 4. INSERT DATA --------------------------------
---- 5. TASKS --------------------------------------


---- 1. CREATE THE DATABSE -------------------------
/*

CREATE DATABASE MovieRentalDB;
GO

*/
--- END --------------------------------------------

---- 2. USE THE DATABSE ----------------------------
/*

USE MovieRentalDB;
GO

*/
--- END --------------------------------------------

---- 3. CREATE TABLES ------------------------------
/*

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Suburb VARCHAR(50),
    Mobile CHAR(10)
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    MovieID INT,
    RentalDate DATE,
	ReturnDate DATE
);

*/
--- END --------------------------------------------

---- 4. INSERT DATA --------------------------------
/*

INSERT INTO Customers (FirstName, LastName, Email, Suburb, Mobile)
VALUES 
('Maria', 'Papadopoulos', 'maria.p@gmail.com', 'Brunswick', '0412345678'),
('Alex', 'Skylotzis', 'alex@gmail.com', 'Richmond', '0425874136'),
('Steven', 'Stefanidis', NULL, 'Northcote', '0452463587'),
('George', 'Papadopoulos', 'Gpaps@example.com', 'Oakleigh', NULL),
('George', 'Papadopoulos', NULL, 'Oakleigh', '0485236971');

INSERT INTO Movies (Title, Genre, ReleaseYear)
VALUES 
('Inception', 'Sci-Fi', 2010),
('The Matrix', 'Sci-Fi', 1999),
('Titanic', 'Romance', 1997),
('The Godfather', 'Crime', 1972),
('Parasite', 'Thriller', 2019),
('The Notebook', 'Romance', 2004),
('Gladiator', 'Action', 2000);

INSERT INTO Rentals (CustomerID, MovieID, RentalDate, ReturnDate)
VALUES 
(1, 1, '2024-11-01', '2024-11-08'),
(1, 4, '2024-11-03', '2024-11-30'),
(2, 2, '2024-11-02', '2024-11-09'),
(3, 3, '2024-11-01', '2024-11-12'),
(4, 5, '2024-11-05', '2024-11-30'),
(1, 6, '2024-11-07', '2024-11-08'),
(5, 7, '2024-11-10', '2024-11-19'),
(3, 1, '2024-11-11', '2024-11-25');

*/
--- END --------------------------------------------

---- 5. TASKS --------------------------------------
/*
--- Task 1 GROUP BY, COUNT
SELECT CustomerID, COUNT(*) AS [Rental Count]
FROM Rentals
GROUP BY CustomerID;

--- Task 2 ISNULL
SELECT 
  CustomerID,
  ISNULL(Email, ISNULL(Mobile, 'Not Available')) AS [Preferred Contact]
FROM Customers;

--- Task 3 HAVING
SELECT CustomerID, COUNT(*) AS [Rental Count]
FROM Rentals
GROUP BY CustomerID
HAVING COUNT(*) > 1;

--- Task 4 SUBSTRING, CHARINDEX
SELECT 
  CustomerID,
  SUBSTRING(Email, 1, CHARINDEX('@', Email) - 1) AS [Email Username]
FROM Customers
WHERE Email IS NOT NULL;

--- Task 5 ORDER BY CASE
SELECT CustomerID, Suburb
FROM Customers
ORDER BY
  CASE Suburb
    WHEN 'Oakleigh' THEN 1
    WHEN 'Brunswick' THEN 2
    ELSE 3
  END;

--- Task 6 COALESCE
SELECT 
  CustomerID,
  COALESCE(Email, Mobile, 'Not Available') AS [Best Contact]
FROM Customers;

--- Task 7 DATEDIFF
SELECT *
FROM Rentals
WHERE DATEDIFF(DAY, RentalDate, ReturnDate) > 10;

--- Task 8 String Filtering
SELECT Title
FROM Movies
WHERE LEFT(Title, 1) = 'T';

--- Task 9 IS NULL
SELECT *
FROM Customers
WHERE Email IS NULL OR Mobile IS NULL;

*/
--- END --------------------------------------------