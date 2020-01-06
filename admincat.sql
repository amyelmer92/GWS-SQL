--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimAdmincat') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimAdmincat

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Admincat as ID,
     CASE
		when admincat = '1' then 'NHS patient'
		when admincat = '2' then 'Private patient'
		when admincat = '3' then 'Amenity patient'
		when admincat = '4' then 'Category II patient'
		when admincat = '98' then 'Not applicable'
		when admincat = '99' then 'Not known: a validation error'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimAdmincat
FROM RawDataset