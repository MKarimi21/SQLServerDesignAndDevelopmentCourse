USE AdventureWorks2017;

-- SUBQUERY NORMALL
SELECT
	MIN(ListPrice)
FROM
	Production.Product P
WHERE
	P.ListPrice != 0;

-- RETURN 2.29
SELECT
	*
FROM
	Production.Product P
WHERE
	P.ListPrice = 2.29;

-- RETURN 1 ROW BY PID = 873
-- PROFATIONAL - SELF CONTAINED, NONCORRELATED, INDEPENDENT
SELECT
	*
FROM
	Production.Product P
WHERE
	P.ListPrice = (
		SELECT
			MIN(ListPrice)
		FROM
			Production.Product P
		WHERE
			P.ListPrice != 0
	);

SELECT
	*
FROM
	Production.Product P
WHERE
	P.ListPrice = (
		SELECT
			MAX(ListPrice)
		FROM
			Production.Product P
	);

-- CORRELATED
SELECT
	*
FROM
	Production.Product P
WHERE
	P.ListPrice IN (
		SELECT
			MIN(P1.ListPrice)
		FROM
			Production.Product P1
		WHERE
			P1.ProductSubcategoryID = P.ProductSubcategoryID
	);

-- USE EXISTS 4 CORRELATED
SELECT
	*
FROM
	Sales.Customer C
WHERE
	EXISTS (
		SELECT
			S.*
		FROM
			Sales.SalesOrderHeader S
		WHERE
			CAST(S.OrderDate AS DATE) = DATEFROMPARTS(2011, 06, 27)
			AND C.CustomerID = S.CustomerID
	);