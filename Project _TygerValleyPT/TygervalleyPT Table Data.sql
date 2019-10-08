 /*Script name: TygervalleyPT Table Data
   Author:		Malesela Sithole
   Date:		24 September 2016
   Description:	Inserting data into TABLES for TygerValley Pet Shelter database
*/
--=============================================================================

USE TygerValleypt
Go

--Inserting data into the tables on database TygerValleypt
-- the code below inserts data inside the manufacture table
INSERT INTO manufacture
VALUES  ('Mars Petcare Inc'		, '+27129678804','marspetcareinc@mars.com'),
		('Nestlé PetCare'		, '+27123334444','nestlépetCare@petcaremail.com'),
		('Diamond Pet Foods'	, '+27124452011','diamondpetfood@leap.co.za'),
		('Hills Pet Nutrition'	, '+27116675498','hillspetnutrition@gomail.com'),
		('Blue Buffalo'			, '+27121251972','bluebuffalo@buffalo.com'),
		('Pet Planner'			, '+27119978324','petplanner@planning.co.za'),
		('Animal Care'			, '+27193347846','animalcare@wecare.co.za')
PRINT 'Data inserted into manufacture table'
GO

-- the code below inserts data inside the foodType table
INSERT INTO foodType
VALUES  ('Vegetable','Wet', 300, '20-Sep-2019', 1),
		('Seeds'	,'Dry', 100, '18-Jan-2018', 2),
		('Grass'	,'Dry', 95, '7-Jun-2021', 3),
		('Meat'		,'Wet', 105, '1-Mar-2019', 4),
		('Nuts'		,'Dry', 200, '28-Feb-2020', 5),
		('Treats'	,'Dry', 150, '26-sep-2017', 6),
		('Canned'	,'Wet', 169, '25-Dec-2014', 7)
PRINT 'Data inserted into foodType table'
GO

-- the code below inserts data inside the category table
INSERT INTO category
VALUES  ('Mammals'		, 2225, 'KG'),
		('Birds'		, 100, 'KG'),
		('Reptiles'		, 50, 'KG'),
		('Amphiianbs'	, 40, 'KG')
PRINT 'Data inserted into category table'
GO

-- the code below inserts data inside the quantity table
INSERT INTO quantity
VALUES  (330, 1, 1),
		(250, 2, 1),
		(161, 3, 2),
		(40, 4, 2),
		(30, 5, 3),
		(165, 6, 3),
		(95, 7, 4)
PRINT 'Data inserted into quantity table' 
GO

-- the code below inserts data inside the pet table
INSERT INTO pet
VALUES  ('Dog'		,'Mammals', 30, 1),
		('Cat'		,'Mammals', 20, 1),
		('rabbits'	,'Mammals', 10, 1),
		('Hamsters'	,'Mammals', 15, 1),
		('Turtles'	,'Reptiles', 5, 3),
		('Snakes'	,'Reptiles', 11, 3),
		('Frogs'	,'Amphiianbs',12, 4),
		('Toads'	,'Amphiianbs', 8, 4),
		('Pigs'		,'Mammals', 19, 1),
		('Horses'	,'Mammals', 10, 1),
		('Chickens'	,'Birds', 25, 2),
		('Crows'	,'Birds', 6, 2)
PRINT 'Data inserted into pet table'
GO

--End of script TygervalleyPT Table Data