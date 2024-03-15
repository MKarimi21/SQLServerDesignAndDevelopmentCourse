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

SELECT
    *
FROM
    MOSI.GetPersonPhoneNumber(0) -- Alter
    ALTER FUNCTION MOSI.GetPersonPhoneNumber (@PersonID INT) RETURNS TABLE AS RETURN (
        SELECT
            CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
            pt.[Name] AS [Number Type],
            ph.PhoneNumber
        FROM
            Person.Person p
            LEFT JOIN Person.PersonPhone ph ON p.BusinessEntityID = ph.BusinessEntityID
            LEFT JOIN Person.PhoneNumberType pt ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID
        WHERE
            p.BusinessEntityID = @PersonID
    )
GO
;

SELECT
    *
FROM
    MOSI.GetPersonPhoneNumber(12)
GO
;

-- No'e digeh table value - function multi statement
CREATE FUNCTION MOSI.CustomizedCustomer (@TotalDue INT, @selectMonth INT) RETURNS @ResultTable TABLE (Customerid INT, TotalDue INT, OrderMonth INT) AS BEGIN
INSERT @ResultTable
SELECT
    s.CustomerID,
    s.TotalDue,
    MONTH(s.OrderDate)
FROM
    Sales.SalesOrderHeader s
WHERE
    s.TotalDue > @TotalDue DELETE @ResultTable
WHERE
    OrderMonth = @selectMonth RETURN
END
GO
;

SELECT * FROM MOSI.CustomizedCustomer(500, 5)