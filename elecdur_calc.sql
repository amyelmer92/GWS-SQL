

--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimElecdur_calc') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimElecdur_calc

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     elecdur_calc as ID,
     CASE
		when elecdur_calc ='9998' then 'Not applicable'
		when elecdur_calc ='9999' then 'Not known (i.e. no date known for decision to admit): a validation error'
		when elecdur_calc is null then 'Not known / not applicable'
		else elecdur_calc --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimElecdur_calc
FROM RawDataset