-- Solve Diagram Error
USE AdventureWorks2017;
EXECUTE sp_changedbowner 'sa';

SELECT P.ProductID, P.[Name], L.*
FROM Production.Product P JOIN Production.ProductInventory I
ON P.ProductID = I.ProductID
INNER JOIN Production.[Location] L
ON L.LocationID = I.LocationID;


--- FUNCTION ---

-- CAST -> RETURN INT
SELECT CAST('100' AS INT) + 200;
SELECT CAST(100 AS VARCHAR(3)) + '200';

SELECT CAST('MOSI' AS INT) + 10;
SELECT TRY_CAST('MOSI' AS INT) + 10; -- KHIALEMOON RAHATE KE KHATA BARNEMIGARDOONEH | NULL MIDEH

-- CONVERT
SELECT CONVERT(DATE, '01/02/2017', 101); -- 101 = AMERICAN STYLE | 103 = BRITISH
SELECT CONVERT(DATE, '01/02/2017', 103);

SELECT DATENAME(MONTH, GETDATE());
SELECT DATENAME(MONTH, CONVERT(DATE, '01/02/2017', 101));
SELECT DATENAME(DAY, CONVERT(DATE, '01/02/2017', 101));

SELECT GETUTCDATE();
SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME();

SELECT CAST(GETDATE() AS DATE);

SELECT DATEPART(MONTH, GETDATE());
SELECT DATEPART(WEEKDAY, GETDATE());