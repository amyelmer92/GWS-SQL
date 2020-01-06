--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimCategory') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimCategory

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Category as ID,
     CASE

		when category = '10' then 'NHS patient: not formally detained'  
		when category = '11' then 'NHS patient: formally detained under Part II of the Mental Health Act 1983'  
		when category = '12' then 'NHS patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'  
		when category = '13' then 'NHS patient: formally detained under part X, Mental Health Act 1983'  
		when category = '20' then 'Private patient: not formally detained'  
		when category = '21' then 'Private patient: formally detained under Part II of the Mental Health Act 1983'  
		when category = '22' then 'Private patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'  
		when category = '23' then 'Private patient: formally detained under part X, Mental health Act 1983'  
		when category = '30' then 'Amenity patient: not formally detained'  
		when category = '31' then 'Amenity patient: formally detained under Part II of the Mental Health Act 1983'  
		when category = '32' then 'Amenity patient: formally detained under Part III of the Mental Health Act 1983 or under other Acts'  
		when category = '33' then 'Amenity patient: formally detained under part X, Mental health Act 1983'  
		when category is Null then 'Other maternity event'  

		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimCategory
FROM RawDataset