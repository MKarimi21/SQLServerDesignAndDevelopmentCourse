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
        SUM(Freight) FOR OrderYear IN (
            [2011],
            [2012],
            [2013],
            [2014]
        )
    ) AS pvt
ORDER BY
    1;