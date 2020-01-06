--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimActivage') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimActivage

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Activage as ID,
     CASE
	 	WHEN Activage = '999' THEN 'unknown'

		else Activage --the original data value uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimActivage
FROM RawDataset