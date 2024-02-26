USE AdventureWorks2017;
/*
   (QUERY 1)
   <OPERATOR>
   (QUERY 2)
		-- AGAR PARANTEZ NAZARIM OLAVIAT -> INTERSECT (^) > UNION (U) > EXCEPT (-)
--> RESULT SET 

*ROLE*
	1. NUMBER OF COLUMNS
	2. DATA TYPE (CONVERTABLE)
	3. COLUMN NAME -> First Query
	4. /\! ORDER BY /\! NEMIGIRE

*/

-- QUERY 1
SELECT C.CountryRegionCode 
FROM Person.CountryRegion C
-- OPERATOR --> EJTEMA == GHANOON RIYAZIAT VA EJTEMA VA HAZF DUPLICATE
UNION
-- QUERY 2
SELECT CR.CountryRegionCode
FROM Sales.CountryRegionCurrency CR;
GO;

-- QUERY 1
SELECT C.CountryRegionCode 
FROM Person.CountryRegion C
-- OPERATOR --> EJTEMA BEDOON HAZF DUPLICATE ** COST VA HAZINEH KAMTARI DAREH
UNION ALL
-- QUERY 2
SELECT CR.CountryRegionCode
FROM Sales.CountryRegionCurrency CR;
GO;

----------------------

-- QUERY 1
SELECT C.CountryRegionCode 
FROM Person.CountryRegion C
-- OPERATOR --> ESHTERAK -> HARCHI DAR A NABOOD HAZF VA DAR B NABOOD HAZF
INTERSECT
-- QUERY 2
SELECT CR.CountryRegionCode
FROM Sales.CountryRegionCurrency CR;
GO;

-----------------------

-- QUERY 1
SELECT C.CountryRegionCode 
FROM Person.CountryRegion C
-- OPERATOR --> MENHA == A-B -> ONAYI KE AZ B TOO A HAST HAZF MISHE
EXCEPT
-- QUERY 2
SELECT CR.CountryRegionCode
FROM Sales.CountryRegionCurrency CR;
GO;

-----------------------

