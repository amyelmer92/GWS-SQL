--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimAdmincatst') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimAdmincatst

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Admincatst as ID,
     CASE
	 	when admincatst = '1' then 'NHS patient'
		when admincatst = '2' then 'Private patient' 
		when admincatst = '3' then 'Amenity patient' 
		when admincatst = '4' then 'Category II patient' 
		when admincatst = '98' then 'Not applicable'
		when admincatst = '99' then 'Not known: a validation error'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimAdmincatst
FROM RawDataset