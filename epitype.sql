--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimEpitype') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimEpitype

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     epitype as ID,
     CASE
		when epitype = '1' then 'General episode (anything that is not covered by the other codes)'  
		when epitype = '2' then 'Delivery episode'  
		when epitype = '3' then 'Birth episode'  
		when epitype = '4' then 'Formally detained under the provisions of mental health legislation or long-term (over one year) psychiatric patients who should have additional information recorded on the psychiatric census. This value can only appear in unfinished records (Episode Status (EPISTAT) = 1)'
		when epitype = '5' then 'Other delivery event' 
		when epitype = '6' then 'Other birth event'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values
		END
	 AS DESCRIPTION

INTO dbo.DimEpitype
FROM RawDataset