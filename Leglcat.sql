--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimLeglcat') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimLeglcat

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)
SELECT DISTINCT

     leglcat as ID,
	 CASE
		 WHEN leglcat = '00' THEN 'Not Formally Detained'
		WHEN leglcat = '01' then 'Informal'  
		WHEN leglcat = '02' then 'Formally detained under the Mental Health Act, Section 2'  
		WHEN leglcat = '03' then 'Formally detained under the Mental Health Act, Section 3'  
		WHEN leglcat = '04' then 'Formally detained under the Mental Health Act, Section 4'  
		WHEN leglcat = '05' then 'Formally detained under the Mental Health Act, Section 5(2)'  
		WHEN leglcat = '06' then 'Formally detained under the Mental Health Act, Section 5(4)'  
		WHEN leglcat = '07' then 'Formally detained under the Mental Health Act, Section 35'  
		WHEN leglcat = '08' then 'Formally detained under the Mental Health Act, Section 36'  
		WHEN leglcat = '09' then 'Formally detained under the Mental Health Act, Section 37 with Section 41 restrictions'  
		WHEN leglcat = '10' then 'Formally detained under the Mental Health Act, Section 37 excluding Section 37(4)'  
		WHEN leglcat = '11' then 'Formally detained under the Mental Health Act, Section 37(4)'  
		WHEN leglcat = '12' then 'Formally detained under the Mental Health Act, Section 38'  
		WHEN leglcat = '13' then 'Formally detained under the Mental Health Act, Section 44'  
		WHEN leglcat = '14' then 'Formally detained under the Mental Health Act, Section 46' 
		WHEN leglcat = '15' then 'Formally detained under the Mental Health Act, Section 47 with Section 49 restrictions'  
		WHEN leglcat = '16' then 'Formally detained under the Mental Health Act, Section 47'  
		WHEN leglcat = '17' then 'Formally detained under the Mental Health Act, Section 48 with Section 49 restrictions'  
		WHEN leglcat = '18' then 'Formally detained under the Mental Health Act, Section 48'  
		WHEN leglcat = '19' then 'Formally detained under the Mental Health Act, Section 135'  
		WHEN leglcat = '20' then 'Formally detained under the Mental Health Act, Section 136'  
		WHEN leglcat = '21' then 'Formally detained under the previous legislation (fifth schedule)'  
		WHEN leglcat = '22' then 'Formally detained under Criminal Procedure (Insanity) Act 1964 as amended by the Criminal Procedures (Insanity and Unfitness to Plead) Act 1991'  
		WHEN leglcat = '23' then 'Formally detained under other Acts'  
		WHEN leglcat = '24' then 'Supervised discharge under the Mental Health (Patients in the Community) Act 1995'  
		WHEN leglcat = '25' then 'Formally detained under the Mental Health Act, Section 45A'  
		WHEN leglcat = '26' then 'Not applicable'  
		WHEN leglcat = '27' then 'Not known'
		 else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values 
     END AS DESCRIPTION


INTO dbo.DimLeglcat

FROM RawDataset