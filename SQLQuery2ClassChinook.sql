select Name as artistname	
from Artist
--where ArtistId > 100
--where Name like '%m%'
--where ArtistId in (1,24,57,112)

select Artist.Name as ArtistName, Album.Title as albumName
from  Artist
		left join Album
			on Artist.ArtistId = Album.ArtistId
-- all with the artist name starts with letter a
select*
from Album
	join Artist 
		on Album.ArtistId = Artist.ArtistId
where Artist.Name like 'a%'


select* 
from Album
	join Artist 
		on Album.ArtistId = Artist.ArtistId
where Artist.Name like 'a%'