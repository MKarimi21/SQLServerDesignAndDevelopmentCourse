USE AdventureWorks2017;

SELECT
	DISTINCT S.OrderDate
FROM
	Sales.SalesOrderHeader S
ORDER BY
	1;

GO
;

SELECT
	SUM(S.TotalDue) SumOfDue,
	AVG(S.TotalDue) AVGofDUE,
	COUNT(*) CNT,
	MIN(S.TotalDue) MinOfDue,
	MAX(S.TotalDue) MaxOfDue
FROM
	Sales.SalesOrderHeader S
WHERE
	S.OrderDate = '2014-06-29';

GO
;

SELECT
	COUNT(*)
FROM
	Person.Person P
WHERE
	P.PersonType = 'EM';

----