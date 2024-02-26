USE AdventureWorks2017;
-- * == ASTERICS
SELECT * FROM Person.Person;  -- 19972 == 2(s)
GO;

-- LIMIT KARDAN QUERI BARAYE IN KE SORATE KHOONDAN AZ SERVER PAIIN NAYAD
-- ESTEFADE AZ WHERE

SELECT * FROM Person.Person WHERE EmailPromotion = 2;  -- 3770 == 0.5(s)
SELECT * FROM Person.Person WHERE EmailPromotion != 2; -- 16202 == 1.5(s)
GO;

-- DISTINCT == ADDAD YA CATEGORI GHEYRE TEKRARI RO NESHOON MIDEH
SELECT * FROM Person.Person;
SELECT EmailPromotion FROM Person.Person;
SELECT DISTINCT EmailPromotion FROM Person.Person;
GO;

-- TABLE ALIASES
SELECT P.FirstName, P.MiddleName, P.LastName 
FROM [Person].[Person] AS P;
GO;

-- COMBINED COLUMNS
SELECT P.BusinessEntityID, P.FirstName + ' ' + P.MiddleName + ' ' + P.LastName [Full Name]
FROM [Person].[Person] AS P;
GO;

-- REMOVE NULL -> COMBINED == FIRSTNAME +COM+ NULL +COM+ LASTNAME = NULL
SELECT P.BusinessEntityID, P.FirstName + ' ' + ISNULL(P.MiddleName, '') + ' ' + P.LastName [Full Name]
FROM [Person].[Person] AS P;
GO;

-- CONDITIONAL FILTERING -> AND OR > < >= <= = != - + % / 
SELECT * FROM [Sales].[SalesOrderHeader]
WHERE TotalDue > 23000 AND SalesOrderID % 2 = 0;
GO;

-- IS NULL  |  IS NOT NULL
SELECT * FROM Person.Person P WHERE P.MiddleName IS NOT NULL;

-- LIKE (PATTERN)
-- 'D%'     -> Dkjdflgkjhdkfjg
-- '%D'     -> slkllkD
-- '_D%'    -> aDksdjfkj
-- '[AC]'   -> ACkjdskfj | kasjACkjkldf
-- '[0-9]'  -> jaskd334
-- '[^0-5]' -> jsdhf6789

SELECT * FROM Person.Person P WHERE P.FirstName LIKE 'K%';
SELECT * FROM Person.Person P WHERE P.FirstName LIKE '_K%';

-- CONCURENCY OR LOCK
-- SORTED BY ORDER
-- ASC = SO'OODI  | DESC = NOZOOLI
SELECT *, YEAR(E.HireDate) YR
FROM HumanResources.Employee E
WHERE E.Gender = 'F' AND E.MaritalStatus = 'M'
AND YEAR(E.HireDate) > 2008
ORDER BY E.OrganizationLevel DESC, YR, E.BusinessEntityID DESC;

-- TOP
SELECT TOP(10) *
FROM HumanResources.Employee E
ORDER BY E.BirthDate DESC;
GO;

SELECT YEAR(GETDATE());
GO;

SELECT TOP(10) YEAR(GETDATE()) - YEAR(E.BirthDate) AGE, *
FROM HumanResources.Employee E
ORDER BY E.BirthDate DESC;
GO;

-- WITH TIES -> BOROO TA AKHARIN NAFAR KE SHAYAD TO TOP RAD SHOODAN | YANI AGAR 10 OOMI 28 SAL BOOD VA 
--				28 DAR 11 TA 14 HAM BOOD BARMIGARDOONE \ BARGASHT ADELANE
SELECT TOP(10) WITH TIES
YEAR(GETDATE()) - YEAR(E.BirthDate) AGE, *
FROM HumanResources.Employee E
ORDER BY YEAR(E.BirthDate) DESC;
GO;

-- OFFSET -> SARFE NAZAR KARDAN CHAND RECORD KE TAIIN KARDIM
-- FETCH NEXT  -> IJAD JADVAL HA KOMAK MIKONEH
SELECT *
FROM Sales.SalesOrderHeader H
ORDER BY H.SalesOrderID
OFFSET 5 ROWS; -- 31460

SELECT *
FROM Sales.SalesOrderHeader H
ORDER BY H.SalesOrderID
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY; -- 5 
