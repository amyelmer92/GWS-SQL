IF OBJECT_ID('dbo.DimNewnhsno') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimNewnhsno

END

SELECT DISTINCT

	 newnhsno as ID,
     CASE
		WHEN newnhsno is null THEN 'Not Known'
		else newnhsno 
     END
	 AS DESCRIPTION,
	 len(newnhsno) as length_newhnhsnu

INTO dbo.DimNewnhsno
FROM RawDataset
