#Задание2

SELECT TrackName, Duration
FROM Track
	WHERE Duration = (
	SELECT MAX(Duration) FROM Track
);

SELECT TrackName
FROM Track
WHERE Duration>=210;

SELECT CollectionName
FROM Collection
WHERE YearIssue BETWEEN 2018 AND 2021;

SELECT ArtistName
FROM Artist
WHERE ArtistName NOT LIKE '% %';

SELECT TrackName
FROM Track
WHERE TrackName LIKE 'мой %'
	OR TrackName LIKE '% мой'
	OR TrackName LIKE '% мой %'
	OR TrackName = 'мой'
	OR TrackName LIKE 'my %'
	OR TrackName LIKE '% my'
	OR TrackName LIKE '% my %'
	OR TrackName = 'my';

#Задание3

SELECT g.GenreName, COUNT(DISTINCT ga.ArtistID) as ArtistCount
FROM Genre as g
JOIN GenreArtist as ga on g.GenreID = ga.GenreID
GROUP BY g.GenreName;


SELECT COUNT(*) as TrackCount
FROM Track t
JOIN Album a ON t.AlbumID = a.AlbumID
WHERE a.YearIssue BETWEEN 2019 AND 2020;

SELECT a.AlbumName, AVG(t.Duration) as AvgDuration
FROM Album a
JOIN Track t ON a.AlbumID = t.AlbumID
GROUP BY a.AlbumName;

SELECT ar.ArtistName
FROM Artist as ar
WHERE ar.ArtistID NOT IN (
        SELECT DISTINCT aa.ArtistID
        FROM ArtistAlbum aa
        JOIN Album a ON aa.AlbumID = a.AlbumID
        WHERE a.YearIssue = 2020
    );

SELECT DISTINCT c.CollectionName
FROM Collection c
JOIN TrackCollection tc ON c.CollectionID = tc.CollectionID
JOIN Track t ON tc.TrackID = t.TrackID
JOIN Album a ON t.AlbumID = a.AlbumID
JOIN ArtistAlbum aa ON a.AlbumID = aa.AlbumID
JOIN Artist ar ON aa.ArtistID = ar.ArtistID
WHERE ar.ArtistName = 'John Coltrane';

#Задание4

SELECT DISTINCT a.AlbumName
FROM Album a
JOIN ArtistAlbum aa ON a.AlbumID = aa.AlbumID
JOIN Artist ar ON aa.ArtistID = ar.ArtistID
JOIN GenreArtist ga ON ar.ArtistID = ga.ArtistID
GROUP BY a.AlbumID, a.AlbumName
HAVING COUNT(DISTINCT ga.GenreID) > 1;

SELECT Track.TrackName
FROM Track
JOIN TrackCollection ON Track.TrackID = TrackCollection.TrackID
WHERE TrackCollection.TrackID IS NULL;

SELECT DISTINCT a.ArtistName
FROM Artist a
JOIN ArtistAlbum aa ON ArtistID = aa.ArtistID
JOIN Album a ON aa.AlbumID = a.AlbumID
JOIN Track t ON a.AlbumID = t.AlbumID
WHERE t.Duration = (
	SELECT MIN(Duration) FROM Track
);