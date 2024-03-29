USE AdventureWorks2017;

SELECT
    C.CustomerID,
    C.PersonID,
    C.TerritoryID INTO MOSI.CustomizedCustomer
FROM
    Sales.Customer C
WHERE
    C.CustomerID % 2 = 0;

GO
;

-- VIEW: SINGLE TABLE
CREATE
OR ALTER VIEW MOSI.V_Customer AS
SELECT
    *
FROM
    MOSI.CustomizedCustomer C
WHERE
    C.PersonID % 2 = 0;

GO
;

SELECT
    *
FROM
    MOSI.V_Customer -- DML ACTIONS ON SINGLE TABLE VIEWS
    --  ! CHON AZ TABALE ASLISH GEREFTE VIZHEGI HASHAM GEREFTE PAS
    --  IDENTITY RO BAYAD OFF KARD KE ID BE TOOR KHODKAR ADAD 
    --  NADEH VA DASTI ID VARED KONIM
SET
    IDENTITY_INSERT MOSI.CustomizedCustomer ON;

INSERT INTO
    MOSI.V_Customer(CustomerID, PersonID, TerritoryID)
VALUES
    (12, 12, 12),
    (13, 13, 13);

SET
    IDENTITY_INSERT MOSI.CustomizedCustomer OFF;

GO
;

-- DAR TABLE HAST AMA CHON DAR PERSON ID FARD HAS 13* VA DAR VIEW BALA + ZADEH BOODIM
SELECT
    *
FROM
    MOSI.V_Customer C
WHERE
    C.CustomerID IN (12, 13);

GO
;

-- VIEW OPTION: WITH CHECK OPTION
CREATE
OR ALTER VIEW MOSI.V_Customer AS
SELECT
    *
FROM
    MOSI.CustomizedCustomer C
WHERE
    C.PersonID % 2 = 0 WITH CHECK OPTION;

-- CHEK MISHE KE EJAZEH BEDEH YA NA
GO
;

SET
    IDENTITY_INSERT MOSI.CustomizedCustomer ON;

INSERT INTO
    MOSI.V_Customer(CustomerID, PersonID, TerritoryID)
VALUES
    (1500, 15000, 1),
    (1501, 15001, 2);

SET
    IDENTITY_INSERT MOSI.CustomizedCustomer OFF;

GO
;