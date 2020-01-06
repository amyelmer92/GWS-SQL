--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.Dim****') IS NOT NULL

BEGIN

     DROP TABLE dbo.Dim****

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     *!*!* as ID,
     CASE
	 	WHEN !*! = '*.*' THEN '.*.'

		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

--INTO dbo.Dim****
FROM RawDataset