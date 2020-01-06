


		--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.Dimdob') IS NOT NULL

BEGIN

     DROP TABLE dbo.Dimdob

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     dob as ID,
     CASE
	  	WHEN DOB = '1800-01-01' THEN 'Null date submitted'
		WHEN DOB = '1801-01-01' THEN 'Invalid date submitted'
		WHEN DOB = '1600-01-01' THEN 'Null date submitted'
		WHEN DOB = '1582-15-10' THEN 'Invalid date submitted'
		ELSE DOB
     END
	 AS DESCRIPTION

INTO dbo.Dimdob
FROM RawDataset
