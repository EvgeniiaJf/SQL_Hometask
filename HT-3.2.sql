#Задание2

select TrackName, Duration
from Track
	WHERE Duration = (
	SELECT MAX(Duration) FROM Track
);

select TrackName
from Track
where Duration>='00:03:30';

select CollectionName
from Collection
where YearIssue between 2018 and 2021;

select ArtistName
from Artist
where ArtistName not like '% %';

select TrackName
from Track
where TrackName LIKE 'мой %' or 'my %'
OR TrackName LIKE '% мой' OR '% my'
OR TrackName LIKE '% мой %' OR '% my %'
OR TrackName 'мой' OR 'my';

#Задание3

select g.GenreName, count(distinct ga."ArtistID") as ArtistCount
from Genre as g
join GenreArtist as ga on g.GenreID = ga.GenreID
group by g.GenreName;


select count(*) as TrackCount
from Track as t
join Album as a on t.AlbumID = a.AlbumID
where a.YearIssue between 2019 and 2020;

select a.AlbumName, avg(t.Duration) as AvgDuration
from Album as a
join Track as t on a.AlbumID = t.AlbumID
group by a.AlbumName;

select ar.ArtistName
from Artist as ar
where ar.ArtistID not in (
        select distinct aa.ArtistID
        from ArtistAlbum as aa
        join Album as a on aa.AlbumID = a.AlbumID
        where a.YearIssue = 2020
    );

select distinct c.CollectionName
from Collection as c
join TrackCollection as tc on c.CollectionID = tc.CollectionID
join Track as t on tc.TrackID = t.TrackID
join Album as a on t.AlbumID = a.AlbumID
join ArtistAlbum as aa on a.AlbumID = aa.AlbumID
join Artist as ar on aa.ArtistID = ar.ArtistID
where ar.ArtistName = 'John Coltrane';

#Задание4

select distinct AlbumName
from Album
join ArtistAlbum on Album.AlbumID = ArtistAlbum.AlbumID
JOIN ArtistAlbum ON Artist.ArtistID = ArtistAlbum.ArtistID
join GenreArtist on Artist.ArtistID = GenreArtist.ArtistID
group by ArtistID, AlbumName, AlbumID
having count(distinct GenreArtist) > 1;

select TrackName
from Track
join TrackCollection on Track.TrackID = TrackCollection.TrackID
where TrackCollecrion.TrackID in null;

select distinct ArtistName
from Artist
JOIN Artist ON ArtistAlbum.ArtistID = Artist.ArtistID
join ArtistAlbum ON Album.AlbumID = ArtistAlbum.ArtistID
join Album ON Track.AlbumID = Album.AlbumID
where Duraton = 
	(SELECT MIN(Duration) FROM Track
		JOIN Track ON ArtistAlbum.AlbumID = Track.AlbumID
);