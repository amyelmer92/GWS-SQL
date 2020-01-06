--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimElecdur') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimElecdur

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Elecdur as ID,
     CASE
	 	when elecdur = '9998' then 'Not applicable'
		when elecdur = '9999' then 'Not known'
		else elecdur

     END
	 AS DESCRIPTION

INTO dbo.DimElecdur
FROM RawDataset