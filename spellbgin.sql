--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimSpellbgin') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimSpellbgin

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Spellbgin as ID,
     CASE
		when spellbgin = '0' then 'Not the first episode of spell'  
		when spellbgin = '1' then 'First episode of spell that started in a previous year'  
		when spellbgin = '2' then 'First episode of spell that started in current year'  
		when spellbgin is Null then 'Not applicable'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimSpellbgin
FROM RawDataset