/*Script name: TygerValleyPT sp_UpdateStock
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description: Create Store Procedure for DATABASE TygerValley Pet Shelter
*/
--=========================================================================

USE TygerValleypt
GO

/*This procedure is used to update stocks in the petType
  table in the database TygerValleyPT makes use of 
  parameters that will be later supplied with details
  for input in the new record that will be created 
*/
CREATE PROCEDURE sp_UpdateStock
	@petID INT,
	@petNum INT,
	@VAL INT,
	@addPet INT
AS

/*Following IF statement is used for validation to check the
parameter @VAL for a value before the update takes place
*/
	IF(@VAL = 1)
		BEGIN
		UPDATE pet
		SET totalInStock = @petNum + @addPet
		WHERE petID = @petID
		END

	ELSE IF (@VAL = 0)
		BEGIN
		UPDATE pet
		SET totalInStock = @petNum + @addPet
		WHERE petID = @petID
		END

	ELSE

	-- Following code will print an error massage if the @VAL number is neither 1 or 0
		BEGIN
		PRINT 'The @VAL value entered is incorrect enter 1 for addition or 0 for subtraction'
		END
GO

--Following code will execute the stored procedure
EXEC sp_UpdateStock 1,2,1,3
GO

--Following code drops the stored procedure is it exists
IF EXISTS(SELECT* FROM sys.procedures WHERE name = 'sp_UpdateStock')
DROP PROCEDURE sp_UpdateStock
GO

--End of script sp_UpdateStock