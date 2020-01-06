		--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimElecdate') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimElecdate

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Elecdate as ID,
     CASE
	  	WHEN Elecdate = '1800-01-01' THEN 'Null date submitted'
		WHEN Elecdate = '1801-01-01' THEN 'Invalid date submitted'
		WHEN Elecdate = '1600-01-01' THEN 'Null date submitted'
		WHEN Elecdate = '1582-15-10' THEN 'Invalid date submitted'
		ELSE Elecdate
     END
	 AS DESCRIPTION

INTO dbo.DimElecdate
FROM RawDataset
