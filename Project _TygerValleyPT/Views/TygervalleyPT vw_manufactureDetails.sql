 /*Script name: TygervalleyPT vw_manufactureDetails
   Author:		Malesela Sithole
   Date:		25 September 2016
   Description:	Creating view for TABLES on TygerValley Pet Shelter database
*/
--==========================================================================

USE TygerValleypt
GO

-- The following code drops the view called vw_manufactureDetails if exists
IF EXISTS(select * FROM sys.views WHERE name = 'vw_manufactureDetails')
DROP VIEW vw_manufactureDetails
GO

/*--This view will create the view called vw_ManufacturerDetails
 it will select all the data in the table  manufacturer and join
 it with the table foodType and the table quantity and they will
  all be able to be viewed in the view
*/

CREATE VIEW vw_manufactureDetails
AS
	SELECT manufacture.*, quantity.quantityAmount, foodType.foodID,	foodType.foodName
	From manufacture
	INNER JOIN foodType
	ON manufacture.companyID = foodType.companyID
	INNER JOIN quantity
	ON foodType.foodID = quantity.foodID
GO

--this code shows all the data in the view that was created
SELECT*
	FROM vw_manufactureDetails
GO

--End of script TygervalleyPT vw_manufactureDetails