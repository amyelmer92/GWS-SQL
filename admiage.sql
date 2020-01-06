--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.Admiage') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimAdmiage

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     admiage as ID,
     CASE
	 	WHEN admiage = '999' THEN 'unknown'

		else admiage --the original data value uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimAdmiage
FROM RawDataset