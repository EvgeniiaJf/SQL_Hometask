create table if not exists Genre (
GenreID serial primary key,
GenreName VARCHAR(100) not null
);


create table if not exists Artist (
ArtistID serial primary key,
ArtistName VARCHAR(100) not null
);


create table if not exists GenreArtist (
GenreID INTEGER references Genre(GenreID),
ArtistID INTEGER references Artist(ArtistID)
);


create table if not exists ALBUM (
AlbumID serial primary key,
AlbumName VARCHAR(100) not null,
YearIssue INTEGER CHECK(YearIssue BETWEEN 1900 AND 2999)
);

create table if not exists ArtistAlbum (
ArtistID INTEGER references Artist(ArtistID),
AlbumID INTEGER references Album(AlbumID)
);


create table if not exists Track (
TrackID serial primary key,
TrackName VARCHAR(200),
Duration INTEGER CHECK(Duration > 0),
AlbumID INTEGER references Album(AlbumID)
);


create table if not exists Collection (
CollectionID serial primary key,
CollectionName VARCHAR(100),
YearIssue INTEGER CHECK(YearIssue BETWEEN 1900 AND 2999)
);


create table if not exists TrackCollection (
TrackID INTEGER references Track(TrackID),
CollectionID INTEGER references Collection(CollectionID)
);