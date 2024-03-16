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