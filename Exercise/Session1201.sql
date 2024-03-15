USE AdventureWorks2017;

-- PIVOT Tableing
/*
 WITH PivotData AS (
 SELECT
 < grouping column >,
 < spreading column >,
 < aggregation column >
 FROM
 < source table >
 )
 SELECT
 < select list >
 FROM
 PivotData PIVOT (
 < aggregate function >(< aggregation column >) FOR < spreading column > IN (< distinct spreading value >)
 ) AS P; 
 */
WITH Sales_CTE AS (
    SELECT
        H.CustomerID,
        YEAR(H.OrderDate) AS OrderYear,
        H.Freight
    FROM
        Sales.SalesOrderHeader H
)
SELECT
    CustomerID,
    ISNULL([2011], 0) AS [2011],
    ISNULL([2012], 0) AS [2012],
    ISNULL([2013], 0) AS [2013],
    ISNULL([2014], 0) AS [2014]
FROM
    Sales_CTE PIVOT (
        SUM(Freight) FOR OrderYear IN ([2011], [2012], [2013], [2014])
    ) AS pvt
ORDER BY
    1;

-- UNPIVOTING
/*
 SELECT < column list >, < names column >, < values column >
 FROM   < source name >
 UNPIVOT( < values column > FOR < names column > IN ( < source columns > )) AS U
 */
-- create data
WITH Sales_CTE AS (
    SELECT
        H.CustomerID,
        YEAR(H.OrderDate) AS OrderYear,
        H.Freight
    FROM
        Sales.SalesOrderHeader H
)
SELECT
    CustomerID,
    ISNULL([2011], 0) AS [2011],
    ISNULL([2012], 0) AS [2012],
    ISNULL([2013], 0) AS [2013],
    ISNULL([2014], 0) AS [2014] INTO MOSI.PivotedData
FROM
    Sales_CTE PIVOT (
        SUM(Freight) FOR OrderYear IN ([2011], [2012], [2013], [2014])
    ) AS pvt
ORDER BY
    1;

--
-- Select rows from a Table or View 'PivotedData' in schema 'MOSI'
SELECT
    CustomerID,
    OrderYear,
    Freight
FROM
    MOSI.PivotedData UNPIVOT(
        Freight FOR OrderYear IN ([2011], [2012], [2013], [2014])
    ) AS U
ORDER BY
    1;

-- FUNCTION
/*
 CREATE FUNCTION CalculateBalance
 (
 @Product INT
 )
 RETURNS INT
 AS
 BEGIN
 DECLARE @RETURN INT = 0;
 RETURN @RETURN
 
 END
 GO
 */
CREATE FUNCTION CalculateBalanceOfProduct (@ProductID INT) RETURNS INT AS BEGIN DECLARE @RETURN INT = 0;

SET
    @RETURN = (
        SELECT
            ISNULL(
                (
                    SELECT
                        SUM(D2.OrderQty)
                    FROM
                        Purchasing.PurchaseOrderDetail D2
                    WHERE
                        D2.ProductID = p.ProductID
                ),
                0
            ) - ISNULL(
                (
                    SELECT
                        SUM(D1.OrderQty)
                    FROM
                        Sales.SalesOrderDetail D1
                    WHERE
                        D1.ProductID = p.ProductID
                ),
                0
            )
        FROM
            Production.Product p
        WHERE
            p.ProductID = @ProductID
    ) RETURN @RETURN
END
GO
;

    -- IF Want to Update Func just change Create to Alter
SELECT
    p.Name,
    dbo.CalculateBalanceOfProduct(p.ProductID) as Balance
FROM
    Production.Product p
WHERE
    dbo.CalculateBalanceOfProduct(p.ProductID) != 0

