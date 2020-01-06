--first, check if tablename exists - if so, drop it
IF OBJECT_ID('dbo.DimAdmisorc') IS NOT NULL

BEGIN

     DROP TABLE dbo.DimAdmisorc

END

--then select the IDs from the relevant column, create table, adding description (use case statement, and values from data dictionary)

SELECT DISTINCT

     Admisorc as ID,
     CASE
		when admisorc = '19' then 'The usual place of residence, unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes PATIENTS with no fixed abode'
		when admisorc = '29' then 'Temporary place of residence when usually resident elsewhere, for example, hotels and residential educational establishments'
		when admisorc = '30' then 'Repatriation from high security psychiatric hospital (1999-00 to 2006-07)' 
		when admisorc = '37' then 'Penal establishment: court (1999-00 to 2006-07)'
		when admisorc = '38' then 'Penal establishment: police station (1999-00 to 2006-07)'
		when admisorc = '39' then 'Penal establishment, Court or Police Station /  Police Custody Suite'
		when admisorc = '48' then 'High security psychiatric hospital, Scotland (1999-00 to 2006-07)'
		when admisorc = '49' then 'NHS other hospital provider: high security psychiatric accommodation in an NHS hospital provider (NHS trust or NHS Foundation Trust)'
		when admisorc = '50' then 'NHS other hospital provider: medium secure unit (1999-00 to 2006-07)'
		when admisorc = '51' then 'NHS other hospital provider: ward for general patients or the younger physically disabled or A&E department'
		when admisorc = '52' then 'NHS other hospital provider: ward for maternity patients or neonates'
		when admisorc = '53' then 'NHS other hospital provider: ward for patients who are mentally ill or have learning disabilities'
		when admisorc = '54' then 'NHS run Care Home'
		when admisorc = '65' then 'Local authority residential accommodation i.e. where care is provided' 
		when admisorc = '66' then 'Local authority foster care, but not in residential accommodation i.e. where care is provided'
		when admisorc = '69' then 'Local authority home or care (1989-90 to 1995-96)'
		when admisorc = '79' then 'Babies born in or on the way to hospital'
		when admisorc = '85' then 'Non-NHS (other than Local Authority) run care home' 
		when admisorc = '86' then 'Non-NHS (other than Local Authority) run nursing home'
		when admisorc = '87' then 'Non-NHS run hospital' 
		when admisorc = '88' then 'non-NHS (other than Local Authority) run hospice' 
		when admisorc = '89' then 'Non-NHS institution (1989-90 to 1995-96)'
		when admisorc = '98' then 'Not applicable'
		when admisorc = '99' then 'Not known'
		else 'Not Known' --the original data uses 'Not Known' for a lot of null values/non-sensible values

     END
	 AS DESCRIPTION

INTO dbo.DimAdmisorc
FROM RawDataset