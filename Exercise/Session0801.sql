USE AdventureWorks2017;

CREATE SCHEMA MOSI;
GO;

-- SELECT INTO
SELECT P.BusinessEntityID PersonID, CONCAT(P.Title, P.FirstName, ' ', P.LastName) FullName 
INTO MOSI.EmploeesTable
FROM Person.Person P
WHERE P.PersonType = 'EM'
ORDER BY P.BusinessEntityID;
GO;

SELECT * FROM MOSI.EmploeesTable;
GO;

DROP TABLE MOSI.EmploeesTable;
GO;

---- INSERT DATA INTO NEW TABLE AND SHOW DATA IMMEDIATLI
CREATE TABLE MOSI.OrdersOf2014
(OrderId INT, OrderDate DATE, CustomerId INT);
GO;

INSERT INTO MOSI.OrdersOf2014
OUTPUT inserted.OrderId, inserted.OrderDate, inserted.CustomerId
SELECT S.SalesOrderID, S.OrderDate, S.CustomerID FROM Sales.SalesOrderHeader S
WHERE YEAR(S.OrderDate) = '2014';
GO;

SELECT * FROM MOSI.OrdersOf2014;
GO;

CREATE TABLE MOSI.DeletedRecords (DeletedCustId INT);
GO;

-- ARCHIVE DELETE DATA
DELETE MOSI.OrdersOf2014
OUTPUT deleted.CustomerId INTO MOSI.DeletedRecords
WHERE DAY(OrderDate) = 1 AND MONTH(OrderDate) = 1;
GO;

SELECT * FROM MOSI.DeletedRecords;

---- UPDATE
-- NORMALL
UPDATE MOSI.OrdersOf2014
SET OrderDate = DATEADD(DAY, 1, OrderDate)
WHERE CustomerId = 11782;



