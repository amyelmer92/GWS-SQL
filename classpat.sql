--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimClasspat') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimClasspat

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Classpat as ID,
     CASE
		when Classpat = '1' THEN 'Ordinary Admission'
		when Classpat = '2' THEN 'Day case admission'
		when Classpat = '3' THEN 'Regular day attender'
		when Classpat = '4' THEN 'Regular night attender'
		when Classpat = '5' THEN 'Mothers and babies using only delivery facilities'
		when Classpat = '8' THEN 'Not applicable (other maternity event)'
		when Classpat = '9' THEN 'Not known'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimClasspat
FROM RawDataset