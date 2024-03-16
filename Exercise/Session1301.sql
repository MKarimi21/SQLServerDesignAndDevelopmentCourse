-- Stored Procedure
/*
 Create Procedure <Procedure_Name, system, ProcedureName>
 -- Add the parameters for the stored procedure here
 <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, ,0>,
 <@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, ,0>,
 AS 
 Begin
 -- Set Nocount on added to prevent extra result sets form
 -- interfering with select statements.
 SET NOCOUNT ON;
 
 -- Insert statements for procedure here
 SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
 END
 GO
 */
CREATE PROCEDURE MOSI.GetOrders @CustomerID INT,
@OrderDate DATE,
@SalesPersonId INT AS BEGIN
SET
    NOCOUNT ON;

SELECT
    *
FROM
    Sales.SalesOrderHeader s
WHERE
    (
        s.CustomerID = @CustomerID
        OR @CustomerID IS NULL
    )
    AND (
        s.OrderDate = @OrderDate
        OR @OrderDate IS NULL
    )
    AND (
        s.SalesPersonID = @SalesPersonId
        OR @SalesPersonId IS NULL
    )
END
GO
;

-- filtring
EXECUTE MOSI.GetOrders 29825,
NULL,
279;

SELECT
    *
FROM
    Sales.SalesOrderHeader s
GO
;

SELECT
    s.CustomerID,
    s.OrderDate,
    s.SalesOrderID,
    s.TotalDue INTO MOSI.SampleOrders
FROM
    Sales.SalesOrderHeader s
GO
;

CREATE PROC MOSI.DeleteOrders @StartOrderDate DATETIME,
@EndOrderDate DATETIME AS BEGIN
SET
    NOCOUNT ON;

DELETE MOSI.SampleOrders
WHERE
    OrderDate BETWEEN @StartOrderDate
    AND @EndOrderDate;

PRINT @@ROWCOUNT + ' rows deleted.'
END;

GO
;