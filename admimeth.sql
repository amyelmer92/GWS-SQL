--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimAdmimeth') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimAdmimeth

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Admimeth as ID,
     CASE
	 	when admimeth = '11' then 'Waiting list'
		when admimeth = '12' then 'Booked'
		when admimeth = '13' then 'Planned'
		when admimeth = '21' then 'Accident and emergency or dental casualty department of the Health Care Provider'
		when admimeth = '22' then 'General Practitioner'
		when admimeth = '23' then 'Bed bureau'
		when admimeth = '24' then 'Consultant Clinic'
		when admimeth = '25' then 'Admission via Mental Health Crisis Resolution Team'
		when admimeth = '2A' then 'Accident and Emergency Department of another provider where the patient had not been admitted'
		when admimeth = '2B' then 'Transfer of an admitted patient from another Hospital Provider in an emergency'
		when admimeth = '2C' then 'Baby born at home as intended'
		when admimeth = '2D' then 'Other emergency admission'
		when admimeth = '28' then 'Other means'
		when admimeth = '31' then 'Admitted ante-partum'
		when admimeth = '32' then 'Admitted post-partum'
		when admimeth = '82' then 'The birth of a baby in this Health Care Provider'
		when admimeth = '83' then 'Baby born outside the Health Care Provider except when born at home as intended'
		when admimeth = '81' then 'Transfer of any admitted patient from other Hospital Provider other than in an emergency'
		when admimeth = '84' then 'Admission by Admissions Panel of a High Security Psychiatric Hospital, patient not entered on the HSPH Admissions Waiting List'
		when admimeth = '89' then 'HSPH Admissions Waiting List of a High Security Psychiatric Hospital'
		when admimeth = '98' then 'Not applicable'
		when admimeth = '99' then 'Not Known'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimAdmimeth
FROM RawDataset