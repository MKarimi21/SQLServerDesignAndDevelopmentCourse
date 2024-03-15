USE AdventureWorks2017;

-- CONCATINATE == NULL HANDLING
SELECT
    '1' + NULL + '2';

SELECT
    CONCAT('1', NULL, '2');

GO
;

----- JOIN
SELECT
    CONCAT(P.FirstName, ' ', P.LastName) AS FullName,
    CONCAT(
        PSP.[Name],
        ', ',
        PA.City,
        ', ',
        PA.AddressLine1,
        ', ',
        PA.AddressLine2
    ) AS [Address]
FROM
    Person.Person P
    JOIN Person.BusinessEntityAddress PBS ON P.BusinessEntityID = PBS.BusinessEntityID
    JOIN Person.[Address] PA ON PBS.AddressID = PA.AddressID
    JOIN Person.StateProvince PSP ON PA.StateProvinceID = PSP.StateProvinceID;

GO
;

---- SUBSTRING
SELECT
    LEFT(
        N'مصطفی کریمی',
        (CHARINDEX(N' ', N'مصطفی کریمی', 1) - 1)
    );

----