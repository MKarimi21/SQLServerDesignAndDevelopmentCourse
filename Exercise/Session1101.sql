USE AdventureWorks2017;

SELECT
	*
FROM
	Sales.SalesOrderHeader S;

-- GROUP BY
SELECT
	S.TerritoryID,
	COUNT(*) TotalOrders,
	SUM(S.TotalDue) SumOfTotalDue,
	MAX(S.TotalDue) MaxOfTotalDue,
	AVG(S.TotalDue) AVGTotalDue
FROM
	Sales.SalesOrderHeader S
GROUP BY
	S.TerritoryID WITH ROLLUP -- SUM OF COLUMNS
ORDER BY
	2;

-- TEDAD FAKTOR HAYI KE NAME FROOSHANDE OON BA NAME KHARIDAR YEKI BOODE
SELECT
	YEAR(S.OrderDate) YR,
	S.TerritoryID,
	COUNT(*) Total
FROM
	Sales.SalesOrderHeader S
	JOIN Sales.Customer C ON S.CustomerID = C.CustomerID
	JOIN Person.Person Cust_Person ON C.PersonID = Cust_Person.BusinessEntityID
	JOIN Person.Person SalesPerson ON S.SalesPersonID = SalesPerson.BusinessEntityID
WHERE
	Cust_Person.FirstName = SalesPerson.FirstName
GROUP BY
	YEAR(S.OrderDate),
	S.TerritoryID WITH ROLLUP
ORDER BY
	YR;

GO
;

---- 
SELECT
	ROW_NUMBER() OVER(
		ORDER BY
			SUM(D.OrderQty) DESC
	) RowNumber,
	ProductID,
	SUM(D.OrderQty) SumOrderQty
FROM
	Sales.SalesOrderHeader H
	JOIN Sales.SalesOrderDetail D ON H.SalesOrderID = D.SalesOrderID
GROUP BY
	ProductID
HAVING
	SUM(D.OrderQty) > 4000;

-- PORKHARID HAROO RANK KONIM
SELECT
	S.CustomerID,
	COUNT(*) CountCustomer,
	RANK() OVER(
		ORDER BY
			COUNT(*) DESC
	) UserRankJustic,
	DENSE_RANK() OVER(
		ORDER BY
			COUNT(*) DESC
	) UserRankNormal
FROM
	Sales.SalesOrderHeader S
GROUP BY
	S.CustomerID
ORDER BY
	CountCustomer DESC;

-- NTILE
-- 10 TA GROOH NIROO MIKHAN
SELECT
	*
FROM
	(
		SELECT
			NTILE(10) OVER(
				ORDER BY
					E.HireDate DESC
			) GRP,
			E.*
		FROM
			HumanResources.Employee E
	) T
WHERE
	T.GRP IN (3, 4);

GO
;