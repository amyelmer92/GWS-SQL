--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEndage') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEndage

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Endage as ID,
     CASE --the data dictionary has codes for age <1 year
		when endage = '7001' then 'Less than 1 day'  
		when endage = '7002' then '1 to 6 days'  
		when endage = '7003' then '7 to 28 days'  
		when endage = '7004' then '29 to 90 days (under 3 months)'  
		when endage = '7005' then '91 to 181 days (approximately 3 months to under 6 months)'  
		when endage = '7006' then '182 to 272 days (approximately 6 months to under 9 months)'  
		when endage = '7007' then '273 to 365 days (approximately 9 months to under 1 year)'  
		when endage is Null then 'Not applicable (other maternity event or not known)'
		else Endage --output the original age value

     END
	 AS DESCRIPTION

INTO dbo.DimEndage
FROM RawDataset