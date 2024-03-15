USE AdventureWorks2017;

/*
 W: {a, b, c}
 Z: {c, d}
 W.Z: {(a, c), (a, d), (b, c), (b, d), (c, c), (c, d)}
 */
SELECT
	P.FirstName,
	P.LastName
FROM
	Person.Person P;

-- 19972
SELECT
	HE.BusinessEntityID,
	HE.HireDate
FROM
	HumanResources.Employee HE;

-- 290
GO
;

-- CROSS JOIN | ,
SELECT
	P.FirstName,
	P.LastName,
	HE.BusinessEntityID,
	HE.HireDate
FROM
	Person.Person P
	CROSS JOIN HumanResources.Employee HE;

-- 5791880 | 60(s)
-- OR
SELECT
	P.FirstName,
	P.LastName,
	HE.BusinessEntityID,
	HE.HireDate
FROM
	Person.Person P,
	HumanResources.Employee HE;

GO
;

-------------
/*
 X: {a, b, c}
 Y: {c1, d1, e1}
 X.Y: {(c, c1)}
 */
-- INNER JOIN | JOIN
SELECT
	P.*,
	HE.*
FROM
	Person.Person P
	INNER JOIN HumanResources.Employee HE ON P.BusinessEntityID = HE.BusinessEntityID
ORDER BY
	1;

-- 290 | 0(s)
GO
;

-- LEFT | RIGHT == AGAR CHIZI PEYDA NAKARD PRESEVERD YA NULL MIZARE
SELECT
	*
FROM
	Person.Person P;

SELECT
	*
FROM
	HumanResources.Employee HRE;

GO
;

-- PERSON 
SELECT
	P.BusinessEntityID,
	P.LastName,
	HRE.BusinessEntityID,
	HRE.HireDate
FROM
	Person.Person P
	LEFT OUTER JOIN HumanResources.Employee HRE ON P.BusinessEntityID = HRE.BusinessEntityID;

-- 19972
GO
;

-- EMPLOEE
SELECT
	P.BusinessEntityID,
	P.LastName,
	HRE.BusinessEntityID,
	HRE.HireDate
FROM
	Person.Person P
	RIGHT OUTER JOIN HumanResources.Employee HRE ON P.BusinessEntityID = HRE.BusinessEntityID;

-- 290
GO
;

-- PERSON HASTAN AMA EMPLOEE NISTAN
SELECT
	P.BusinessEntityID,
	P.LastName,
	HRE.BusinessEntityID,
	HRE.HireDate
FROM
	Person.Person P
	LEFT OUTER JOIN HumanResources.Employee HRE ON P.BusinessEntityID = HRE.BusinessEntityID
WHERE
	HRE.BusinessEntityID IS NULL;

GO
;

-- FULL -> HARDOO TARAF BARAMOON MOHEMME
-- JOIN TYPE, DERIVED TABLES
SELECT
	A.*,
	B.*
FROM
	(
		SELECT
			1 ID,
			'Book' Objects
		UNION
		SELECT
			2,
			'Ball'
		UNION
		SELECT
			3,
			'Bag'
	) A
	CROSS JOIN (
		SELECT
			2 ID,
			'Black' Colors
		UNION
		SELECT
			3,
			'Blue'
		UNION
		SELECT
			4,
			'Red'
	) B;

GO
;

SELECT
	A.*,
	B.*
FROM
	(
		SELECT
			1 ID,
			'Book' Objects
		UNION
		SELECT
			2,
			'Ball'
		UNION
		SELECT
			3,
			'Bag'
	) A
	INNER JOIN (
		SELECT
			2 ID,
			'Black' Colors
		UNION
		SELECT
			3,
			'Blue'
		UNION
		SELECT
			4,
			'Red'
	) B ON A.ID = B.ID;

GO
;

SELECT
	A.*,
	B.*
FROM
	(
		SELECT
			1 ID,
			'Book' Objects
		UNION
		SELECT
			2,
			'Ball'
		UNION
		SELECT
			3,
			'Bag'
	) A
	LEFT JOIN (
		SELECT
			2 ID,
			'Black' Colors
		UNION
		SELECT
			3,
			'Blue'
		UNION
		SELECT
			4,
			'Red'
	) B ON A.ID = B.ID;

GO
;

SELECT
	A.*,
	B.*
FROM
	(
		SELECT
			1 ID,
			'Book' Objects
		UNION
		SELECT
			2,
			'Ball'
		UNION
		SELECT
			3,
			'Bag'
	) A
	RIGHT JOIN (
		SELECT
			2 ID,
			'Black' Colors
		UNION
		SELECT
			3,
			'Blue'
		UNION
		SELECT
			4,
			'Red'
	) B ON A.ID = B.ID;

GO
;

SELECT
	A.*,
	B.*
FROM
	(
		SELECT
			1 ID,
			'Book' Objects
		UNION
		SELECT
			2,
			'Ball'
		UNION
		SELECT
			3,
			'Bag'
	) A FULL
	JOIN (
		SELECT
			2 ID,
			'Black' Colors
		UNION
		SELECT
			3,
			'Blue'
		UNION
		SELECT
			4,
			'Red'
	) B ON A.ID = B.ID;

GO
;