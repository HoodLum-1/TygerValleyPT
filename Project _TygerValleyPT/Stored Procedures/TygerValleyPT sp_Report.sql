/*Script name: TygerValleyPT sp_Report
   Author:		Malesela Sithole
   Date:		26 September 2016
   Description: Create Store Procedure for DATABASE TygerValley Pet Shelter
*/
--=========================================================================

USE TygerValleypt
GO

/*This stored procedure will be used to print out
a report for all the companies that have expired
food products that are in the database
*/

CREATE PROCEDURE sp_Report
	@Num INT
AS

--	This code creates a temporary table
	SELECT*
	INTO #temp
	FROM manufacture
--alter table statement below is used to insert a new column
	ALTER TABLE #temp
	ADD
	Printed SMALLINT

--The UPDATE below sets all the rows of the printed column to 0 
	UPDATE #temp
	SET Printed = 0
	DECLARE @companyID INT
	DECLARE @companyName VARCHAR(40)
	DECLARE @companyNum VARCHAR(20)
	DECLARE @companyEmail VARCHAR(40)
	DECLARE @foodID INT
	DECLARE @foodType VARCHAR(40)
	DECLARE @ID INT

	SELECT	@companyID = #temp.companyID, @companyName = #temp.companyName,
			@companyNum = #temp.companyNum, @companyEmail = #temp.companyEmail,
			@foodID = foodType.foodID, @foodType = foodType.foodName 
		FROM #temp
		JOIN foodType
		ON #temp.companyID = foodType.foodID
		WHERE (foodType.expiryDate < GETDATE())

/* A WHILE LOOP is used to print all columns that need printing 
the SELECT Statement is used to select all rows that have 0 at
the printed column
*/
	WHILE EXISTS(SELECT*
	FROM #temp 
	WHERE Printed = 0)

		BEGIN
		SELECT @ID = MIN(companyID)
		FROM #temp
		WHERE Printed = 0

		PRINT 'EXPIRED PRODUCTS REPORT:'
		PRINT '________________________________________________'
		PRINT ''
		PRINT 'Generated:'
		PRINT GETDATE()
		PRINT ''
		PRINT 'Company ID:			' + CAST(@companyID AS VARCHAR (40))
		PRINT 'Company NAME:		' + @companyName
		PRINT 'Contact Number:		' + @companyNum
		PRINT 'Email:				' + @companyEmail
		PRINT '________________________________________________'
		PRINT 'Food ID				Food TYPE'
		PRINT '________________________________________________'
		PRINT '' + CAST (@foodID AS VARCHAR(30))+'					'+ @foodType
		PRINT '________________________________________________'
		PRINT 'Total Records: ' + CAST(@Num AS VARCHAR(10))
		PRINT '________________________________________________'
/* an UPDATE statement is used to update the printed records
   from 0 to 1 to avoid duplication is records, and to show 
   the compiler where to stop the loop
   */
		UPDATE #temp
		SET Printed = 1
		END

--Following code drops the temporary table if it exists
	IF EXISTS(SELECT* FROM sys.tables WHERE name = '#temp')
		DROP TABLE #temp
	GO

--Following code executes the sp_Report stored procedure
	EXEC sp_Report 1
	GO

--Following code drops the procedure sp_Report if it exists
	IF EXISTS(SELECT* FROM sys.procedures WHERE name = 'sp_Report')
		DROP PROCEDURE sp_Report
	GO

	--END of script TygerValleyPT sp_Report