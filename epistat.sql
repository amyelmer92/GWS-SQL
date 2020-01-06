--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEpistat') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEpistat

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Epistat as ID,
     CASE
		when epistat = '1' then 'Unfinished'  
		when epistat = '3' then 'Finished'  
		when epistat = '9' then 'Derived unfinished (not present on processed data)'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values


     END
	 AS DESCRIPTION

INTO dbo.DimEpistat
FROM RawDataset