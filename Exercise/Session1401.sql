IF (
    DATENAME(WEEKDAY, GETDATE()) IN ('Thursday', 'Friday')
) BEGIN PRINT 'Happy weekend :D'
END
ELSE BEGIN PRINT 'Working hard...'
END;

GO
;

---- Try Catch (Error handling)
BEGIN TRY
SELECT
    1 / 0;

END TRY BEGIN CATCH
SELECT
    ERROR_MESSAGE(),
    ERROR_NUMBER(),
    ERROR_LINE();

END CATCH;

GO
;

---- while (loop)
DECLARE @V INT = 0;

WHILE (@V <= 10) BEGIN PRINT '@V= ' + CAST(@V AS VARCHAR(2));

SET
    @V + = 1;

END;

GO
;

---- delay
USE AdventureWorks2017;

BEGIN
SELECT
    *
FROM
    Sales.SalesOrderHeader h;

WAITFOR DELAY '0:00:35';

-- Delay for 35 seconds
-- WAITFOR TIME '12:00:00'; 
SELECT
    *
FROM
    Sales.Customer c;

END;

GO
;

