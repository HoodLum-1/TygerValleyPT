 /*Script name: TygervalleyPT Indexes
   Author:		Malesela Sithole
   Date:		25 September 2016
   Description:	Creating indexes for TABLES on TygerValley Pet Shelter database
*/
--============================================================================================

USE TygerValleypt
GO

--Following code drops index idx_manufacture if it exists
IF EXISTS(SELECT* FROM sys.indexes WHERE name = 'idx_manufacture')
drop INDEX idx_manufacture
on manufacture
GO

--Following code drops index idx_food if it exists
IF EXISTS(SELECT* FROM sys.indexes WHERE name = 'idx_food')
drop index idx_food
on foodtype
GO

--Following code drops index idx_category if it exists
IF EXISTS (SELECT* FROM sys.indexes WHERE name = 'idx_category')
drop index idx_category
on category
GO

--Following code drops index idx_pet if it exists
IF EXISTS (SELECT* FROM sys.indexes WHERE name = 'idx_pet')
drop index idx_pet
on pet
GO

USE TygerValleypt
GO
--code below creates index on the manfucture table on the primary key
CREATE INDEX idx_manufacture
ON manufacture(companyID)
PRINT 'Index idx_manufacture created succefully'
GO

--code below creates index on the food table on the primary key
CREATE UNIQUE NONCLUSTERED INDEX idx_food
ON foodType(foodID)
PRINT 'Index idx_food created succefully'
GO

--code below creates index on the category table on the primary key
CREATE UNIQUE NONCLUSTERED INDEX idx_category
ON category(categoryID)
PRINT 'Index idx_category created succefully'
GO

--code below creates index on the category table on the primary key
CREATE UNIQUE NONCLUSTERED INDEX idx_pet
ON pet(petID)
PRINT 'Index idx_pet created succefully'
GO

--End of script TygervalleyPT TygervalleyPT Index