#Задание2

select TrackName, Duration
from Track
where MAX(Duration);

select TrackName
from Track
where Duration>00:03:30;

select CollectionName
from Collection
where YearIssue between 2018 and 2021;

select ArtistName
from Artist
where ArtistName not like '% %';

select TrackName
from Track
where TrackName like '%мой%' or '%my%';

#Задание3

select g.GenreName, count(distinct ga.'ArtistID') as ArtistCount
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
from Album as a
join ArtistAlbum on Album = a.ArtistAlbum
join GenreArtist on ArtistAlbum = GenreArtist.ArtistAlbum
group by AlbumName, AlbumID
having count(distinct GenreArtist) > 1;

select TrackName
from Track
join TrackCollection on Track.TrackID = TrackCollecrion.TrackID
where TrackCollecrion.TrackID in null;

select distinct ArtistName
from Track
join Album on Track.AlbumID = Album.AlbumID
join Artist on ArtistAlbum.ArtistID = Artist.ArtistID
where Duraton = (select min(Duration) from Track);