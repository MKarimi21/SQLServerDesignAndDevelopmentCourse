USE AdventureWorks2017;

-- COMMON TABLE EXPRESSION: CTE

/*
WITH <CTE-NAME>
AS
(
	=> INNER QUERY
)
	=> OUTER QUERY
*/

-- CUSTOMER ID HAII KE HADAGHAL YE BAR KHARID KARDAND

/*
WITH CTE01(CustomerId)
AS
(
	SELECT DISTINCT H.CustomerID FROM Sales.SalesOrderHeader H
)
SELECT P.*, C.* FROM CTE01 
JOIN Sales.Customer C
ON C.CustomerID = CTE01.CustomerId
JOIN Person.Person P
ON C.PersonID = P.BusinessEntityID;
*/

-- CTE
DECLARE @OrganizationChart TABLE
(Id INT PRIMARY KEY, Title VARCHAR(100) NOT NULL, Parent INT NULL);

INSERT @OrganizationChart
SELECT 11, 'Board Manager', NULL
UNION 
SELECT 13, 'CEO', 11
UNION 
SELECT 15, 'Project Manager', 13
UNION 
SELECT 17, 'Scrum Master', 13;

-- RECURSIVE CTE
WITH RCTE(Id, Title, ParentId, Lvl)
AS
(
	-- ANCHOR
	SELECT T1.Id, T1.Title, T1.Parent, 1 FROM @OrganizationChart T1 WHERE T1.Parent IS NULL
	UNION ALL
	-- RECURSIVE
	SELECT T2.Id, T2.Title, T2.Parent, RCTE.Lvl + 1 FROM @OrganizationChart T2 JOIN RCTE
	ON RCTE.Id = T2.Parent
)
SELECT RCTE.*, T3.Title FROM RCTE LEFT JOIN @OrganizationChart T3
ON RCTE.ParentId = T3.Id

