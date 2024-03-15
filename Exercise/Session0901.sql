USE AdventureWorks2017;

CREATE SCHEMA MOSI;

GO
;

-- DERIVED TABLE -> USE ()+NAME
SELECT
	COUNT(DISTINCT P.BusinessEntityID) CountOfBusinessEntity
FROM
	Person.Person P
	JOIN (
		SELECT
			BA.BusinessEntityID,
			BA.AddressID
		FROM
			Person.BusinessEntityAddress BA
		WHERE
			BA.AddressTypeID IN (
				SELECT
					ATyp.AddressTypeID
				FROM
					Person.AddressType ATyp
				WHERE
					LOWER(ATyp.[Name]) = 'home'
			)
	) T ON P.BusinessEntityID = T.BusinessEntityID;

--18774
GO
;

---- TEMPORARY TABLE (GLOBAL ##, LOCAL #) !!ddl!!
-- LOCAL #
CREATE TABLE #TodayOrders
(
	OrderId INT,
	CustomerId INT,
	TotalDue DECIMAL(10, 2)
);

GO
;

-- GLOBAL ##
CREATE TABLE ##TodayOrders
(
	OrderId INT,
	CustomerId INT,
	TotalDue DECIMAL(10, 2)
);

INSERT INTO
	##TodayOrders
SELECT
	S.SalesOrderID,
	S.CustomerID,
	S.TotalDue
FROM
	Sales.SalesOrderHeader S;

GO
;

---- TABLE VARIABLE (GLOBAL @@, LOCAL @) !!dml!!
DECLARE @ @TodayOrders TABLE (
	OrderId INT,
	CustomerId INT,
	TotalDue DECIMAL(10, 2)
);

INSERT INTO
	@ @TodayOrders
SELECT
	S.SalesOrderID,
	S.CustomerID,
	S.TotalDue
FROM
	Sales.SalesOrderHeader S;

WAITFOR DELAY '00:00:30';

GO
;