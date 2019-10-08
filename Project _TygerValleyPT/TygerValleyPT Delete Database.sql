 /*Script name: TygerValleyPT Delete Database
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description:	Creating a delete for TygerValley Pet Shelter database
*/
--====================================================================

--This drops the database called TygerValleypt

USE master
IF EXISTS(select * from sys.databases where name= 'TygerValleypt')
DROP DATABASE TygerValleypt
GO

--End of script TygerValleyPT Delete Database