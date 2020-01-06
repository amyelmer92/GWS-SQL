--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEpidur') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEpidur

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Epidur as ID,
     CASE
	 	WHEN Epidur is null THEN 'Null = Not applicable (other maternity event or not known)'
		else Epidur --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimEpidur
FROM RawDataset