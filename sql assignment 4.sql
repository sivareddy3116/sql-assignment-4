CREATE DATABASE ExerciseD;
USE ExerciseD;
CREATE TABLE Products
(
    PId INT PRIMARY KEY IDENTITY(1000, 1),
    PName NVARCHAR(100) NOT NULL,
    PPrice DECIMAL(18, 2) NOT NULL,
    PTax DECIMAL(18, 2) NOT NULL,
    Company NVARCHAR(100) NOT NULL,
    PQty INT NOT NULL CHECK (PQty >= 1),
    PriceWithTax AS PPrice + (PPrice * PTax) PERSISTED
);
INSERT INTO Products (PName, PPrice, PTax, Company, PQty)
VALUES
('Samsung Galaxy S21', 800.00, 0.10, 'Samsung', 5),
('iPhone 13', 1000.00, 0.10, 'Apple', 3),
('Redmi Note 10', 250.00, 0.10, 'Redmi', 8),
('HTC Desire 21', 500.00, 0.10, 'HTC', 2),
('Realme 8 Pro', 300.00, 0.10, 'RealMe', 6),
('Samsung Galaxy A52', 400.00, 0.10, 'Samsung', 4),
('iPhone 12 Mini', 900.00, 0.10, 'Apple', 7),
('Redmi 9', 150.00, 0.10, 'Redmi', 10),
('HTC U20', 700.00, 0.10, 'HTC', 1),
('Realme Narzo 30A', 180.00, 0.10, 'RealMe', 9);
CREATE PROCEDURE GetProductDetails
AS
BEGIN
    SELECT
        PId,
        PName,
        PPrice AS PPricewithTax,
        Company,
        PQty,
        PQty * PriceWithTax AS TotalPrice
    FROM Products;
END;
select*from Products
EXEC GetProductDetails