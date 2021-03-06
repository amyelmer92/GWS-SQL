		--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEpiend') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEpiend

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Epiend as ID,
     CASE
	  	WHEN Epiend = '1800-01-01' THEN 'Null date submitted'
		WHEN Epiend = '1801-01-01' THEN 'Invalid date submitted'
		WHEN Epiend = '1600-01-01' THEN 'Null date submitted'
		WHEN Epiend = '1582-15-10' THEN 'Invalid date submitted'
		ELSE Epiend
     END
	 AS DESCRIPTION

INTO dbo.DimEpiend
FROM RawDataset