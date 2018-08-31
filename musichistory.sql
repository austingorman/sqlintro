/**
Query all of the entries in the Genre table
**/ 

SELECT * from Genre;

/**
Using the INSERT statement, add one of your favorite artists to the Artist table.
**/

INSERT INTO
Artist
VALUES
(null, "Brett's Mouth", 1998);

/**
Using the INSERT statement, add one, or more, albums by your artist to the Album table.
**/
INSERT INTO
Album
VALUES
(null, "The Brown Album",	"11/14/2003",	"22",	 "DangJam",  40, 12);
/**
Using the INSERT statement, add some songs that are on that album to the Song table.
**/
INSERT INTO
Song
VALUES
(null, "All*",	2,	11/14/2003,	12,	40,	23);

/**
Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.**/

SELECT s.Title, Album.Title, Artist.ArtistName
FROM Song s
LEFT JOIN Album ON s.AlbumId = Album.AlbumId
LEFT JOIN Artist ON s.ArtistId = Artist.ArtistId
WHERE Artist.ArtistName = "Brett's Mouth";
/**
Using SELECT and LEFT JOIN, write a query that displays the song title, the song duration, the album label, and the genre name for every song.
**/

SELECT Song.Title, Song.SongLength, Album.Label
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId;

/**
Using a WHERE clause, modify the previous query to only show the information for songs that have a duration of 250 or greater.
**/

SELECT Song.Title, Song.SongLength, Album.Label
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId
WHERE Song.SongLength >= 250;

/**
Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
**/
SELECT Song.AlbumId, Album.Title, COUNT(Song.SongId)
FROM Song
JOIN Album ON Song.AlbumId = Album.AlbumId
GROUP BY Song.AlbumId;

/**
Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
**/

SELECT Artist.ArtistId, Artist.ArtistName, COUNT(Song.SongId)
FROM Song
JOIN Artist ON Artist.ArtistId = Song.ArtistId
GROUP BY Song.ArtistId;

/**
Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
**/
SELECT Song.GenreId, Genre.Label, COUNT(Song.SongId)
FROM Song
JOIN Genre ON Genre.GenreId = Song.GenreId
GROUP BY Song.GenreId;

/**
Write a SELECT statement to display how many artists exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
**/
SELECT Artist.ArtistId, Genre.Label, COUNT(Song.GenreId)
FROM Song
JOIN Artist ON Song.ArtistId = Artist.ArtistId
JOIN Genre ON Genre.GenreId = Song.GenreId
GROUP BY Genre.GenreId;
/**
Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
**/
SELECT Album.Title, MAX(Album.AlbumLength)
FROM Album;
/**
Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
**/

SELECT Song.Title, MAX(Song.SongLength)
FROM Song;

/**
Modify the previous query to also display the title of the album. **/

SELECT Song.Title, Album.AlbumId, MAX(Song.SongLength)
FROM Song 
JOIN  Album ON Song.AlbumId = Album.AlbumId;

