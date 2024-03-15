-- Function for table view
CREATE FUNCTION MOSI.GetPersonPhoneNumber (@PersonID INT) RETURNS TABLE AS RETURN (
    SELECT
        CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
        pt.[Name] AS [Number Type],
        ph.PhoneNumber
    FROM
        Person.Person p
        LEFT JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID
        LEFT JOIN Person.PhoneNumberType pt ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID
)
GO
;

SELECT * FROM MOSI.GetPersonPhoneNumber(0)

-- Alter
ALTER FUNCTION MOSI.GetPersonPhoneNumber (@PersonID INT) RETURNS TABLE AS RETURN (
    SELECT
        CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
        pt.[Name] AS [Number Type],
        ph.PhoneNumber
    FROM
        Person.Person p
        LEFT JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID
        LEFT JOIN Person.PhoneNumberType pt ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID
    WHERE p.BusinessEntityID = @PersonID
)
GO
;

SELECT * FROM MOSI.GetPersonPhoneNumber(12)
GO
;

