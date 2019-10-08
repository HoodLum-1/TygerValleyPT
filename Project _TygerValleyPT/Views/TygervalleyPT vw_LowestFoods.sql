/*Script name: TygervalleyPT vw_LowestFoods
   Author:		Malesela Sithole
   Date:		25 September 2016
   Description:	Creating view for TABLES on TygerValley Pet Shelter database
*/
--==========================================================================

USE TygerValleypt
GO

--Drops view vw_LowestFoods if it exists
IF EXISTS (SELECT * FROM sys.views WHERE name = 'vw_LowestFoods')
DROP VIEW vw_LowestFoods
GO


/* This code creates a view called vw_LowestFoods to select
 the category and the sum of the total animals in tygervalley
 pet shelter which will display the lowest three records
 */
CREATE VIEW vw_LowestFoods
AS
	SELECT  category.categoryName, SUM(pet.totalInStock)
	AS totalStock
	FROM category
	INNER JOIN pet
	ON category.categoryID = pet.categoryID
	GROUP BY category.categoryName
GO

SELECT TOP 3 categoryName, totalstock
FROM vw_LowestFoods
ORDER BY totalStock ASC
GO

--End of script TygervalleyPT vw_LowestFoods