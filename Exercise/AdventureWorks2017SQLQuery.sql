USE [master] RESTORE DATABASE [AdventureWorks2017]
FROM
    DISK = N'D:\Learning\05 - SQL\SQL Server Design and Development\Exercise\AdventureWorks2017.bak' WITH FILE = 1,
    MOVE N'AdventureWorks2017' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\AdventureWorks2017.mdf',
    MOVE N'AdventureWorks2017_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\AdventureWorks2017_log.ldf',
    NOUNLOAD,
    STATS = 5
GO