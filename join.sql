IF OBJECT_ID('dbo.CleanedTable') IS NOT NULL

BEGIN

     DROP TABLE dbo.CleanedTable

END

select 
	rawdataset.hesid as hesid,
	rawdataset.lopatid as lopatid,
	coalesce(rawdataset.newnhsno, 'Not Known') as newnhsno, --output the NHS number - if it's unknown, output 'Not Known'
	rawdataset.newnhsno_check as newnhsnocheck,
	coalesce(DimEthnos.[DESCRIPTION], 'Not Known') as ethnos, --output the ethnos - if it's unknown, output 'Not Known'
	DimSex.[DESCRIPTION] as sex,
	
	 --use the rules as stated in the dictionary, if null, output 'null date submitted'
	coalesce(
			CASE
	  			WHEN DOB = '1800-01-01' THEN 'Null date submitted'
				WHEN DOB = '1801-01-01' THEN 'Invalid date submitted'
				WHEN DOB = '1600-01-01' THEN 'Null date submitted'
				WHEN DOB = '1582-15-10' THEN 'Invalid date submitted'
				ELSE DOB
			 END , 
			 'Null date submitted'
			 )
			 as dob,

	rawdataset.diag_01 as diag_01, --left this in as I couldn't get wildcards to work on the join, eg F82 wouldn't match with F82.X - if I get a change add case into the join?
	coalesce(DiagCodes.[Code Description], 'No exact match') as diagdesc,

	dimepistart.[description] as epistart,
	dimepiend.[description] as epiend,
	dimepitype.[description] as epitype,
	coalesce(rawdataset.epidur, 'Null = Not applicable (other maternity event or not known)') as epidur,
	DimAdmimeth.[DESCRIPTION] as admimeth,
	DimAdmincatst.[DESCRIPTION] as admincatst,
	DimAdmincat.[description] as admincat,
	DimCategory.[description] as category,
	DimClasspat.[description] as classpat,

	--use the rules as stated in the dictionary, if null, output 'not known'
	coalesce(
			CASE
	  			WHEN Elecdate = '1800-01-01' THEN 'Null date submitted'
				WHEN Elecdate = '1801-01-01' THEN 'Invalid date submitted'
				WHEN Elecdate = '1600-01-01' THEN 'Null date submitted'
				WHEN Elecdate = '1582-15-10' THEN 'Invalid date submitted'
				ELSE Elecdate
			END,
			'Not Known'
			)
			as elecdate,
	
	--use the rules as stated in the dictionary, output not known/not applicable if null
	coalesce(
		CASE
		 	when rawdataset.elecdur = '9998' then 'Not applicable'
			when rawdataset.elecdur = '9999' then 'Not known'
			else elecdur
		END,
		'Not Known/Not Applicable'
		) 
		as elecdur,

	 --the original data uses 'Not Known' for a lot of null values/non-sensible values
	coalesce(
		CASE
			when rawdataset.elecdur_calc ='9998' then 'Not applicable'
			when rawdataset.elecdur_calc ='9999' then 'Not known (i.e. no date known for decision to admit): a validation error'
			else rawdataset.elecdur_calc 
		 END, 
		 'Not Known, Not Applicable'
		 )
		 as elecdur_calc,


	coalesce(dimendage.[description], concat(dimdob.description, ' for DOB')) as endage,--use the endage rules in the DD, where there's a null value, it seems to be bacause there's no given DOB, so output the DOB error
	
	RawDataset.episode as episode,

	coalesce(dimstartage.[description], 'Not applicable (other maternity event or not known)') as startage,
	coalesce(dimleglcat.[description], 'Not Known') as leglcat,

	DimAdmisorc.[DESCRIPTION] as admisorc,
	rawdataset.admistart as admistart



/*unused dimensions & reasons 
	coalesce(rawdataset.bedyear, 'Not Known') as bedyear, --output the bedyear - if it's unknown, output 'Not Known'
	^^ some of these are empty, epidur gives the time in hospital, whereas this gives the time within 1 year - if stay spans over 2 years, the field is often blank.
	rawdataset.spell as spell,
	^^1 for every record - seems pointless

	dimactivage.[description] as activage,
	dimadmiage.[description] as admiage
	^^ the above 2 columns, based on DOB & date of episode (etc) do no seem correct, eg hesid 1471967271 was born in 1982, admistart in 2010, but admiage nd activage in the 70s
	rawdataset.mydob as mydob -- DOB gives more granular info
	coalesce(DimSpellbgin.[DESCRIPTION], 'Not Known') as spellbgin, --all values are 1, not sure of integrity - if true, then there could just be a blanket statement
	dimepistat.[description] as epistat, --all records are 'finished', so this is probably not relevent

*/


into CleanedTable

from RawDataset 

left join DimEthnos on DimEthnos.ID = RawDataset.ethnos
left join DimSex on dimsex.ID = RawDataset.sex
left join Dimdob on dimdob.id = rawdataset.dob
left join DimAdmisorc on dimadmisorc.id = rawdataset.admisorc
left join dimadmimeth on dimadmimeth.id = rawdataset.admimeth
left join DimAdmincatst on DimAdmincatst.id = RawDataset.admincatst
left join dimadmincat on dimadmincat.id = rawdataset.admincat
left join DimCategory on DimCategory.id = RawDataset.category
left join DimClasspat on DimClasspat.ID = RawDataset.classpat
left join dimendage on dimendage.id = rawdataset.endage
left join dimepistart on dimepistart.id = rawdataset.epistart
left join dimepiend on dimepiend.id = rawdataset.epiend
left join dimepitype on dimepitype.id = rawdataset.epitype
left join dimepidur on dimepidur.id = rawdataset.epidur
left join dimspellbgin on dimspellbgin.id = rawdataset.spellbgin
left join dimstartage on	dimstartage.id = rawdataset.startage
left join dimleglcat on dimleglcat.id = rawdataset.leglcat 
left join dimepistat on dimepistat.id = rawdataset.epistat 
left join dimactivage on dimactivage.id = rawdataset.activage
left join dimadmiage on dimadmiage.id = rawdataset.admiage
left join DiagCodes on RawDataset.diag_01=DiagCodes.[5th edition] 
			or RawDataset.diag_01=DiagCodes.[4th or1] 
			or RawDataset.diag_01=DiagCodes.[4th or2] 
			or RawDataset.diag_01=DiagCodes.[4th or3] 
			or RawDataset.diag_01=DiagCodes.[4th or4]





