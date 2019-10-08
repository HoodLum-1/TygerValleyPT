 /*Script name: TygervalleyPT vw_PetsPerType
   Author:		Malesela Sithole
   Date:		25 September 2016
   Description:	Creating view for the TABLES on TygerValley Pet Shelter database
*/
--===============================================================================

USE TygerValleypt
GO

--drops the created view called vw_PetsPerType
IF EXISTS(SELECT * FROM sys.views WHERE name = 'vw_PetsPerType')
DROP VIEW vw_PetsPerType
GO

/* This will create a view called vw_PetsPerType and
 select each animal type, the total in stock, the 
 identity for the category and the category name
  which will all be stored in the view vw_PetsPerType
*/
CREATE VIEW vw_PetsPerType
AS 
	SELECT pet.petType, pet.totalInStock, pet.petID, pet.petName
	FROM pet 
GO

--this code views all the data in the view that was created
SELECT *
	 FROM vw_PetsPerType
GO

--end of script TygervalleyPT vw_PetsPerType