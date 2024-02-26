USE AdventureWorks2017;

SELECT LEN('ABC'), DATALENGTH('ABC');
SELECT LEN(N'ABC'), DATALENGTH(N'ABC');
SELECT LEN(N'ABC   '), DATALENGTH(N'ABC   ');
GO;

SELECT P.FirstName, LEN(P.FirstName) AS LenOfFirstName, DATALENGTH(P.FirstName) AS CapacityOfMemory
FROM Person.Person P;
GO;

---- ALTERATION: REPLACE, REPLICATE, STUFF
SELECT REPLACE('SJDKJWE3425..23.34//', '.', '0');
SELECT CONCAT(REPLICATE('120', 3), 1300);
SELECT STUFF(',JKSDJF,KJSD', 1, 1, '');

---- FORMATING
SELECT LTRIM('   MOSI   ');
SELECT RTRIM('   MOSI   ');
SELECT RTRIM(LTRIM('   MOSI   '));

SELECT UPPER('farif');
SELECT LOWER('KSAJD');

---- STRING_SPLIT
SELECT 'AMS/KLA/SAK';
SELECT * FROM string_split('AMS/KLA/SAK', '/');

---- DECLARE
DECLARE @ORDERS VARCHAR(MAX) = '49500, 49502, 49503';

SELECT * FROM Sales.SalesOrderHeader S
JOIN string_split(@ORDERS, ',') T
ON S.SalesOrderID = T.value;


---- CASE

-- CASE 1
SELECT P.ProductID, P.[Name], 
CASE P.MakeFlag
	WHEN 0 THEN 'NOT MAKE'
	WHEN 1 THEN 'MAKE'
	ELSE 'UNKNOWN'
END IS_MAKE
FROM Production.Product P
ORDER BY 3;

-- CASE 02
SELECT P.ProductID, P.[Name], P.ListPrice,
CASE 
	WHEN P.ListPrice < 20.00 THEN 'LOW'
	WHEN P.ListPrice < 50.00 THEN 'MED'
	WHEN P.ListPrice > 50.00 THEN 'HIG'
	ELSE 'N/A'
END KPI
FROM Production.Product P
ORDER BY 3;

-- @@ROWCOUNT
SELECT * FROM Person.Person P WHERE P.FirstName LIKE '%Z'
SELECT @@ROWCOUNT;

-- IF 
IF(1=1)
BEGIN
	SELECT 1
END;
ELSE
BEGIN
	SELECT 2;
END;

-- PRINT
PRINT 'Message 01';

-- SAMPLE
SELECT * FROM Person.Person P WHERE P.FirstName LIKE '%Z'
DECLARE @V INT = @@ROWCOUNT
IF (@V > 0)
BEGIN
	PRINT 'Have Argument: ' + CAST(@V AS NVARCHAR(MAX)) + ' rows';
END
ELSE
BEGIN
	PRINT 'Not Value'
END;

-- GUID: GLOBAL UNIQUE INDENTIFIER
SELECT NEWID();

DECLARE @U UNIQUEIDENTIFIER = NEWID();
SELECT @U;

SELECT TOP 1 * FROM Person.Person P
ORDER BY NEWID();
