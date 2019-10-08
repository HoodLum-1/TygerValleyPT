/*Script name: TygerValleyPT sp_DeleteFoodType
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description: Create Store Procedure for DATABASE TygerValley Pet Shelter
*/
--=========================================================================


USE TygerValleypt
GO

/*
The procedure created below deletes all
the items in the foodType table which
have reached or past their expiary date 
*/ 
CREATE PROCEDURE sp_DeleteFoodType
AS
DELETE FROM foodType
WHERE expiryDate < GETDATE()
GO


-- Following code will execute the stored procedure created above
EXEC sp_DeleteFoodType
PRINT 'Expired food type has been deleted from table foodType'
GO

--Following code drops the stored procedure is it exists
IF EXISTS(SELECT* FROM sys.procedures WHERE name = 'sp_DeleteFoodType')
DROP PROCEDURE sp_DeleteFoodType
GO

--End of script sp_DeleteFoodType