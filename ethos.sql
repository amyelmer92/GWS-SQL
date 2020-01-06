--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEthnos') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEthnos

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     ETHNOS as ID,
     CASE
	 	WHEN ETHNOS = 'H' THEN 'Indian (Asian or Asian British) '
		WHEN ETHNOS = 'A' THEN 'British (White)'
		WHEN ETHNOS = 'B' THEN 'Irish (White)'
		WHEN ETHNOS = 'K' THEN 'Bangladeshi (Asian or Asian British)'
		WHEN ETHNOS = 'D' THEN 'White and Black Caribbean (Mixed)'
		WHEN ETHNOS = 'N' THEN 'African (Black or Black British)'
		WHEN ETHNOS = 'L' THEN 'Any other Asian background'
		WHEN ETHNOS = 'F' THEN 'White and Asian (Mixed)'
		WHEN ETHNOS Is null THEN 'Not Known'
		WHEN ETHNOS = 'C' then 'Other White background' 
		WHEN ETHNOS = 'E' then 'White and Black African (Mixed)' 
		WHEN ETHNOS = 'G' then 'Any other Mixed background'
		WHEN ETHNOS = 'J' then 'Pakistani (Asian or Asian British)'
		WHEN ETHNOS = 'M' then 'Caribbean (Black or Black British)'
		WHEN ETHNOS = 'P' then 'Any other Black background'
		WHEN ETHNOS = 'R' then 'Chinese (other ethnic group)' 
		WHEN ETHNOS = 'S' then 'Any other ethnic group'
		WHEN ETHNOS = 'Z' then 'Not stated'
		WHEN ETHNOS = 'X' then 'Not known'
		WHEN ETHNOS = '99' then 'Not known'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimEthnos
FROM RawDataset