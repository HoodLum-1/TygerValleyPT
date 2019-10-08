/*Script name: TygerValleyPT sp_NewPetType
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description: Create Store Procedure for DATABASE TygerValley Pet Shelter
*/
--=========================================================================

USE TygerValleypt
GO

/* The following stored procedure is used to add
a new animal or pet to an existing category in
the TygerValleyPT database pet table 
*/

CREATE PROCEDURE sp_NewPetType
	@petName VARCHAR(40),
	@petType VARCHAR(40),
	@totalInStock INT,
	@categoryID INT
As
	IF EXISTS(SELECT categoryID FROM category WHERE category.categoryID = 1)
	INSERT INTO pet
	VALUES (@petName, @petType, @totalInStock, @categoryID)
	ELSE
	PRINT 'Primary key does not exist'
GO

--Executes the stored procedure  sp_NewPetType
EXEC sp_NewPetType 'chameleons','Reptiles',10,3
GO

--Drops the sp_NewPetType procedure is it exists
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_NewPetType')
DROP PROCEDURE sp_NewPetType
GO

--End of script TygerValleyPT sp_NewPetType