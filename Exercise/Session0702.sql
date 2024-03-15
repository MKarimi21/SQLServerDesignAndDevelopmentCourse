USE DB01;

SELECT
    *
FROM
    dbo.Person P;

INSERT INTO
    dbo.Person (National_Identify, FirstName, LastName)
VALUES
    ('0670546747', 'Mostafa', 'Karimi');

GO
;

-- UPDATE 
UPDATE
    dbo.Person
SET
    FirstName = 1
WHERE
    FirstName IS NULL;

-- UPDATE
UPDATE
    dbo.Person
SET
    FirstName = 'Ali'
WHERE
    CAST(National_Identify AS BIGINT) % 2 = 0;

GO
;

-- DELETE (DATA, LOGINING, LASY) 
DELETE dbo.Person
WHERE
    FirstName IS NULL;

-- DROP TABLE (STRUCTURE)
DROP TABLE dbo.Person;

-- TRUNCATE (DATA, NO LOGINIG, FAST)
TRUNCATE TABLE dbo.Person;