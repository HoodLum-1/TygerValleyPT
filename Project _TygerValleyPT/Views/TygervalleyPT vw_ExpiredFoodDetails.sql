 /*Script name: TygervalleyPT vw_ExpiredFoodDetails
   Author:		Malesela Sithole
   Date:		25 September 2016
   Description:	Creating view for TABLES on TygerValley Pet Shelter database
*/
--==========================================================================

USE TygerValleypt
GO

-- Drops the view vw_ExpiredFoodDetails if exists
IF EXISTS (SELECT * FROM sys.views WHERE name = 'vw_ExpiredFoodDetails')
DROP VIEW vw_ExpiredFoodDetails
GO	

/*This will create a view called vw_ExpiredFoodDetails and
  select all the tables in the database, which will be use
  along with the GETDATE function to display all the expired
   food items if there are any such expired items
  */

CREATE VIEW vw_ExpiredFoodDetails
AS
	SELECT manufacture.companyName, manufacture.companyNum, foodType.foodName, foodType.foodID,
		   foodType.expiryDate, quantity.quantityAmount, category.categoryName
	FROM manufacture
	INNER JOIN foodType
	ON manufacture.companyID = foodType.companyID
	INNER JOIN quantity
	ON foodType.foodID = quantity.foodID
	INNER JOIN category
	ON quantity.categoryID = category.categoryID
	WHERE (foodType.expiryDate < GETDATE())
GO

--this code shows all the data in the view that was created
SELECT *
	FROM vw_ExpiredFoodDetails
GO

--End of script TygervalleyPT vw_ExpiredFoodDetails