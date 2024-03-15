/* baraye sakht data base aval USE master ta bedoone kojaim
 bad create database [];
 */
USE master;

CREATE DATABASE [DB01];

/* GO baes mishe oon kol script ghablish khoondeh nashe
 va edameh oon chizi ke neveshti bebadesh run koni
 */
GO
	/* hala aval bayad table haroo besazim ke behtare moshakhas 
	 konim az kodoom DB estefadeh konim ba dastoor USE [];
	 */
	CREATE TABLE TBL01 (COL01 INT, COL02 CHAR(5));

GO
	/*Delete kardan Table ba DROP
	 */
	USE master;

DROP TABLE TBL01;

GO
	/*dar char 5 -> 5 ta space migire -> T----
	 ama dar varchar 5 -> faghat hamoonghad ke neveshtim faza 
	 dar database migire masaln T dighe 4 taye
	 badi faza dar system nemizare
	 */
	USE DB01;

CREATE TABLE TBL01 (COL01 INT, COL02 CHAR(5));

GO
	/*Tarif Schema ya jodakonandeh dar database
	 mese dbo.[] ya masalan table haye production ya sale
	 */
	USE DB01;

CREATE SCHEMA Production;

GO
	/* sakhte yek table ba schema production
	 */
	CREATE TABLE Production.TBL02 (COL01 VARCHAR(5));

/*DDL: Data Definition Language
 
 */
USE DB01;

CREATE TABLE TBL03 (FIRSTNAME VARCHAR(50), LASTNAME VARCHAR(50));

GO
	-- ezafeh karan sotoon dige be oon table ya taghirr mideh
ALTER TABLE
	TBL03
ADD
	NATIONALCODE CHAR(10);

GO
	-- DML: Data Manipulation Language
INSERT INTO
	dbo.TBL03 (FIRSTNAME, LASTNAME, NATIONALCODE)
VALUES
	('Mostafa', 'Karimi', '0670546747');

SELECT
	*
FROM
	dbo.TBL03;

UPDATE
	dbo.TBL03
SET
	NATIONALCODE = '1234567890'
WHERE
	NATIONALCODE = '0670546747';

DELETE dbo.TBL03
WHERE
	NATIONALCODE = '1234567890';