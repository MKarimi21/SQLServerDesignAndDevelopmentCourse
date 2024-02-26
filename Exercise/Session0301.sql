USE AdventureWorks2017;
GO;

-- Alias
SELECT 'A' AS FirstName, 'B' AS LastName;
SELECT 'A' FirstName, 'B' LastName;
SELECT 'A' AS [First Name], 'B' AS [Last Name];

-- In 1 Column -> + OR CONCATENATE
SELECT 'A' + 'B' AS ConcatColumn;
SELECT 10 + 20 AS SumConcatColumn;
