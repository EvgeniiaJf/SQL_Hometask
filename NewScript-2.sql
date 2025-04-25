insert into Genre (GenreID, GenreName) 
values
(1, 'Jazz'),
(2, 'Blues'),
(3, 'Stoner');

insert into Artist (ArtistID, ArtistName) 
values
(1, 'John Coltrane'),
(2, 'Mississippi John Hurt'),
(3, 'Aretha Franklin'),
(4, 'Electric Wizard');

insert into GenreArtist (GenreID, ArtistID) 
values
(1, 1),
(1, 3),
(2, 2),
(3, 4);

INSERT INTO Album (AlbumID, AlbumName, YearIssue)
values
(1, 'Soultrane', 1958),
(2, 'Folk Songs and Blues', 1963),
(3, 'Spirit in the Dark', 1970),
(4, 'Black Masses', 2010);

INSERT INTO ArtistAlbum (ArtistID, AlbumID)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Track (TrackID, TrackName, Duration, AlbumID)
values
(1, 'Good Baite', 37897, 1),
(2, 'Theme for Ernie', 67896, 1),
(3, 'Avalon Blues', 2356, 2),
(4, 'Honest I Do', 34578, 3),
(5, 'Patterns of Evil', 6782, 4),
(6, 'Turn Off Your Mind', 6980, 4);

INSERT INTO Collection (CollectionID, CollectionName, YearIssue)
values
(1, 'Random Playlist', 2011),
(2, 'Eugenia Favorite Playlist', 2017),
(3, 'Old like 30-years-me', 2021),
(4, 'Sadness songs', 2025);

INSERT INTO TrackCollection (TrackID, CollectionID)
values
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 2),
(2, 2),
(4, 1),
(3, 4),
(6, 4),
(1, 1);
