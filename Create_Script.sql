create table if not exists Artist (
	artist_id serial primary key,
	artist_name varchar(60) not null
);

create table if not exists Genre (
	genre_id serial primary key,
	genre_name varchar(60) not null
);

create table if not exists ArtistGenre (
	artist_id serial references Artist(artist_id),
	genre_id serial references Genre(genre_id),
	constraint pk primary key (artist_id, genre_id)
);

create table if not exists Album (
	album_id serial primary key,
	album_title varchar(60) not null,
	album_year integer not null check (album_year > 1900) 
);

create table if not exists ArtistAlbum (
	artist_id serial references Artist(artist_id),
	album_id serial references Album(album_id),
	constraint art_al primary key (artist_id, album_id)
);

create table if not exists Mixtape (
	mixtape_id serial primary key,
	mixtape_title varchar(60) not null,
	mixtape_year integer not null check (mixtape_year > 1900)
);

create table if not exists TrackInfo (
	track_id serial primary key,
	album_id serial references Album(album_id), 
	track_title varchar(60) not null,
	track_duration integer not null check (track_duration > 0)
);

create table if not exists MixtapeTracklist (
	track_id serial references TrackInfo(track_id),
	mixtape_id serial references Mixtape(mixtape_id),
	constraint mix_tr primary key (track_id, mixtape_id)
);
