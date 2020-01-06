select count(*) from RawDataset where bedyear is null
select count(*) from RawDataset where bedyear is not null
select count(*) from RawDataset where endage is null
select count(*) from RawDataset where endage is not null
select count(*) from RawDataset where ethnos is null
select count(*) from RawDataset where ethnos is not null
select count(*) from RawDataset where elecdate is null
select count(*) from RawDataset where elecdate is not null
select count(*) from RawDataset where newnhsno is null 
select count(*) from RawDataset where newnhsno is not null


select count(*) from RawDataset where elecdur_calc is null
select count(*) from RawDataset where elecdur_calc is not null
select count(*) from RawDataset where epistart is null
select count(*) from RawDataset where epistart is not null

select count(*) from RawDataset where spellbgin is null
select count(*) from RawDataset where spellbgin is not null

select count(*) from CleanedTable where epistat = 'Finished'
select count(*) from RawDataset where epistart is not null

select count(*) from RawDataset where epistart is null
select count(*) from RawDataset where epistart is not null
select count(*) from RawDataset where epistart is null
select count(*) from RawDataset where epistart is not null


select count(*) from RawDataset  as nhscheckno where newnhsno_check = 'N'
select count(*) from RawDataset as ethnosX where ethnos = 'X' 
select count(*) from RawDataset as ethnos9 where ethnos = '9' 
select count(*) from RawDataset as sex0	where sex = 0 or sex = 9
select count(*) from RawDataset as sex9	where sex = 9 
select count(*) from RawDataset  as sorc99 where admisorc = '99'
select count(*) from RawDataset  as meth99 where admimeth = '00'
select count(*) from RawDataset as eldate01011800 where elecdate = '1800-01-01' 
select count(*) from RawDataset as eldate01011801 where elecdate = '1801-01-01' 
select count(*) from RawDataset as eldate01011600 where elecdate = '1600-01-01' 
select count(*) from RawDataset as eldate15101582 where elecdate = '1582-15-10' 
select count(*) from RawDataset as eldur01011800 where elecdate = '1800-01/01'  
select count(*) from RawDataset as eldur01011801 where elecdate = '1801-01/01'  
select count(*) from RawDataset as eldur01011600 where elecdate = '1600-01/01'  
select count(*) from RawDataset as eldur15101582 where elecdate = '1582-15/10'  


select elecdate from RawDataset

select count(admincat) from RawDataset where admincat = 01 and admincatst != 01
select count(admincat) from RawDataset where admincatst = 01

select count(*) from RawDataset where episode = 1
select count(*) from RawDataset where episode = 2
select count(*) from RawDataset where episode = 3
select count(*) from RawDataset where episode = 4
select count(*) from RawDataset where episode = 5
select count(*) from RawDataset where episode = 6
select count(*) from RawDataset where episode = 7
select count(*) from RawDataset where episode = 8
select count(*) from RawDataset where episode = 9
select count(*) from RawDataset where episode = 10

select bedyear from RawDataset where bedyear is null

