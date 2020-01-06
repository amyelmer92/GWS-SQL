		--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEpistart') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEpistart

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Epistart as ID,
     CASE
	  	WHEN Epistart = '1800-01-01' THEN 'Null date submitted'
		WHEN Epistart = '1801-01-01' THEN 'Invalid date submitted'
		WHEN Epistart = '1600-01-01' THEN 'Null date submitted'
		WHEN Epistart = '1582-15-10' THEN 'Invalid date submitted'
		ELSE Epistart
     END
	 AS DESCRIPTION

INTO dbo.DimEpistart
FROM RawDataset