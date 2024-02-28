-- SUB QUERRY CORRELATED
USE AdventureWorks2017;

-- NORMAL
SELECT DISTINCT S1.CustomerID,
		(
		SELECT MAX(S2.TotalDue)
		FROM Sales.SalesOrderHeader S2
		WHERE S2.CustomerID = S1.CustomerID
		) MaxTotalDue,
		(
		SELECT MIN(S2.TotalDue)
		FROM Sales.SalesOrderHeader S2
		WHERE S2.CustomerID = S1.CustomerID
		) MinTotalOrder
FROM Sales.SalesOrderHeader S1
ORDER BY 2 DESC;

-- WINDOWING FUNCTION
SELECT DISTINCT S.CustomerID,
	   MAX(S.TotalDue) OVER(PARTITION BY S.CustomerID) MaxTotalDue,
	   MIN(S.TotalDue) OVER(PARTITION BY S.CustomerID) MinTotalDue
FROM Sales.SalesOrderHeader S
ORDER BY 2 DESC;

-- WINDOWING FUNCTION: LEAD | LAG
SELECT S.SalesOrderID, S.OrderDate, S.TotalDue,
	   ISNULL(LEAD(S.TotalDue) OVER(ORDER BY S.OrderDate), 0) [Lead],
	   ISNULL(LAG(S.TotalDue) OVER(ORDER BY S.OrderDate), 0) [Lag],
	   TotalDue - ISNULL(LEAD(S.TotalDue) OVER(ORDER BY S.OrderDate), 0) [Diff]
FROM Sales.SalesOrderHeader S
WHERE S.CustomerID = 29641
ORDER BY S.OrderDate;

-- CONFIG WINDOW OF WINDOWING FUNCTION
SELECT S.CustomerID, S.SalesOrderID, CAST(S.OrderDate AS date) DateOrder, S.TotalDue,
	   SUM(S.TotalDue) OVER(PARTITION BY S.CustomerID 
					   ORDER BY S.OrderDate, S.SalesOrderID) SumOfOrder
FROM Sales.SalesOrderHeader S
WHERE S.CustomerID BETWEEN 29641 AND 29645
ORDER BY S.OrderDate, S.SalesOrderID;
