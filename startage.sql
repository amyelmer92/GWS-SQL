--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimStartage') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimStartage

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Startage as ID,
     CASE --the data dictionary has codes for age <1 year

		when startage = '7001' then 'Less than 1 day' 
		when startage = '7002' then '1 to 6 days'  
		when startage = '7003' then '7 to 28 days'  
		when startage = '7004' then '29 to 90 days (under 3 months)'  
		when startage = '7005' then '91 to 181 days (approximately 3 months to under 6 months)'  
		when startage = '7006' then '182 to 272 days (approximately 6 months to under 9 months)'  
		when startage = '7007' then '273 to 364 days (approximately 9 months to under 1 year)'  
		when startage is Null then 'Not applicable (other maternity event or not known)'
		else startage --the original value for startage

     END
	 AS DESCRIPTION

INTO dbo.DimStartage
FROM RawDataset