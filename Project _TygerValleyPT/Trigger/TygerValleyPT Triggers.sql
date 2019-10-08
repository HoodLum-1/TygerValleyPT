/*Script name: TygerValleyPT Triggers
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description: Create Triggers for DATABASE TygerValley Pet Shelter
*/
--====================================================================

USE TygerValleypt
GO

--Table to store errors
CREATE TABLE errors
(
errorCODE INT NOT NULL,
errorDisc VARCHAR(100) NOT NULL
)
GO 

--The following code creates a trigger called tr_manufacture
CREATE TRIGGER tr_manufacture
ON manufacture
INSTEAD OF INSERT,DELETE, UPDATE
AS
	RAISERROR ('You cannot EDIT informaion on table manufacture',16,10);
	
	INSERT INTO errors
	VALUES (123,'USER TRIED TO EDIT TABLE MANUFACTURE. TIME: '
	+CAST(GETDATE() AS VARCHAR))
GO

--The following code tries to insert data into the manufecture table 
INSERT INTO manufacture
VALUES  ('Valley Pet Shop', '+27129678804','valleypetshop@valleysho.co.za')
GO

--the following code creates a trigger called tr_allocate
CREATE TRIGGER tr_allocate
ON quantity
INSTEAD OF INSERT, DELETE
AS
	RAISERROR ('You cannot DELETE or INSERT from the QUANTITY table only UPDATE are allowed',16,10);
	INSERT INTO errors
	VALUES (123,'USER TRIED TO EDIT TABLE QUANTITY. TIME: '
	+CAST(GETDATE() AS VARCHAR))

GO

--The following code tries to insert data into the quantity table 
INSERT INTO quantity
VALUES  (400, 3, 4)
GO

--the following code creates a trigger called tr_add
CREATE TRIGGER tr_add
ON pet
AFTER INSERT
AS
PRINT 'Record successfully added into the pet table'
GO

--The following code inserts data into the pet table
INSERT INTO pet
VALUES  ('Goats','Mammals', 15, 1)
GO


--Following lines of code drop the tiggers created above

DROP table errors
GO

DROP trigger tr_manufacture
GO

DROP trigger tr_add
GO

DROP trigger tr_allocate
GO

--END of script TygerValleyPT Triggers