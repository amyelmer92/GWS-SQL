--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimSex') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimSex

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     sex as ID,
     CASE
		when sex = '1' then 'Male'  
		when sex = '2' then 'Female'  
		when sex = '9' then 'Not specified'  
		when sex = '0' then 'Not known' 
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values 
     END
	 AS DESCRIPTION

INTO dbo.DimSex
FROM RawDataset