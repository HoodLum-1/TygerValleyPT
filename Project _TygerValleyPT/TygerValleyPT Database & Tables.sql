 /*Script name: TygerValleyPT Database & Tables
   Author:		Malesela Sithole
   Date:		24 September 2016
   Description:	CREATE DATABASE AND TABLES for TygerValley Pet Shelter
*/

-- ============================================================================
/*This following checks if datababase exists and deletes 
  the database TygerValleypt if it exists to prevent error when 
  recreating it along with is tables
*/
USE master
IF EXISTS(select * from sys.databases where name= 'TygerValleypt')
DROP DATABASE TygerValleypt
GO
-- =============================================================================

--The following code creates the database called TygerValleypt 
  CREATE DATABASE TygerValleypt
ON PRIMARY
(
  NAME = 'tygervalleypt_data',
  FILENAME = 'd:\sql2014\Project _TygerValleypt_data.mdf',
  SIZE = 5MB,
  FILEGROWTH = 10%
  )
  LOG ON
  (
   NAME = 'tygervalleypt_log',
   FILENAME = 'd:\sql2014\Project _TygerValleypt_log.ldf',
   SIZE = 5MB,
   FILEGROWTH = 10%
 )
GO

--Alerts the user that the database has been succesfully created along with its log file
PRINT 'Database TygerValleypt_data created succesfullly'
PRINT 'LOG TygerValleypt_log created succesfully'
GO


USE TygerValleypt
GO
--Creating tables for database TygerValleypt
-- the following creates a table titled manufacturer
CREATE TABLE manufacture
(
	companyID INT NOT NULL IDENTITY UNIQUE, 
	companyName VARCHAR(40) NOT NULL,
	companyNum VARCHAR(40)NOT NULL,
	companyEmail VARCHAR(40)NULL,
	PRIMARY KEY(companyID)
)
PRINT 'Table manufacture created successfully' 
GO

-- the following creates a table titled foodtype
CREATE TABLE foodType
(
	foodID INT NOT NULL IDENTITY UNIQUE,
	foodName VARCHAR(40) NOT NULL,
	foodType VARCHAR(40) NOT NULL,
	measurement VARCHAR(40) NOT NULL,
	expiryDate DATE NOT NULL,
	PRIMARY KEY (foodID),
	companyID INT NOT NULL REFERENCES manufacture(companyID)
)
PRINT 'Table foodType created successfully'
GO

-- the following creates a table titled category
CREATE TABLE category
(
 categoryID INT NOT NULL IDENTITY,
 categoryName VARCHAR(40) NOT NULL,
 amount INT NOT NULL,
 measurement VARCHAR(40) NOT NULL
 PRIMARY KEY(categoryID)
 )
PRINT 'Table category created successfully'
GO

-- the following code will create a table titled allocatedAmount
CREATE TABLE quantity
(
 quantityAmount INT NOT NULL,
 foodID INT NOT NULL REFERENCES foodType(foodID),
 categoryID INT NOT NULL REFERENCES category(categoryID)
 )
PRINT 'Table quantity created successfully'
GO

-- the code below will create a table titled petType
CREATE TABLE pet
(
 petID INT NOT NULL IDENTITY,
 petName VARCHAR(40) NOT NULL,
 petType VARCHAR(40) NOT NULL,
 totalInStock INT NOT NULL,
 categoryID INT NOT NULL REFERENCES category(categoryID)
)
PRINT 'Table pet created successfully' 
GO

-- End of script TygerValleyPT Database & Tables