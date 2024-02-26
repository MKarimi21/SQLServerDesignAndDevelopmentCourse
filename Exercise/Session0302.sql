SELECT [FirstName], [LastName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'EM';
GO;

-- Return Uniqe Category
SELECT DISTINCT PersonType FROM Person.Person;
GO;

-- UNION -> TEKRARI HAROO HAZF MIKONEH
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'EM'  -- 273
UNION
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'SC';  -- 753
-- RETURN 550 ROWS
GO;

-- INTERSECT
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'EM'
INTERSECT
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'SC';
-- RETURN 136 ROWS
GO;

-- UNION ALL -> TEKRARI HA ROO HAM MIGIREH
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'EM'
UNION ALL
SELECT [FirstName]
FROM [AdventureWorks2017].[Person].[Person]
WHERE PersonType = 'SC';
-- RETURN 1026 ROWS
GO;