-- Triggers
/*---------------------------------------------------------*/
-- Server (INSTANCE), DDL
CREATE TRIGGER MessageAfterCreatingDataBase ON ALL SERVER
AFTER
    CREATE_DATABASE,
    ALTER_DATABASE,
    DROP_DATABASE AS BEGIN PRINT 'Message: Database was created/altered or dropped!'
END
GO
;

USE master;

CREATE DATABASE [Test];

DROP DATABASE [Test];

GO
;

DISABLE TRIGGER MessageAfterCreatingDataBase ON ALL SERVER;

GO
;

DROP TRIGGER MessageAfterCreatingDataBase ON ALL SERVER;

GO
;

-- Trigegr on table - usefull for logging and security
USE DB1;

CREATE TABLE dbo.People_DeleteLog (
    Id INT IDENTITY(1, 1),
    Delete_PeopleId CHAR(10),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

GO
;

CREATE TRIGGER DeleteLog ON dbo.People
AFTER
    DELETE AS BEGIN
SET
    NOCOUNT ON;

INSERT
    dbo.People_DeleteLog (Delete_PeopleId)
SELECT
    D.National_Identity
FROM
    deleted D
END
GO
;