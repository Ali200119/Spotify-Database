CREATE DATABASE Spotify

USE Spotify

CREATE TABLE Artists
(
	Artist_ID int primary key identity,
	Name nvarchar(25)
)

CREATE TABLE Albums
(
	Album_ID int primary key identity,
	Name nvarchar(25),
	Artist_ID int references Artists(Artist_ID)
)

CREATE TABLE Musics
(
	Music_ID int primary key identity,
	Name nvarchar(25),
	TotalSecond nvarchar(5),
	ListenerCount int,
	Album_ID int references Albums(Album_ID),
	Artist_ID int references Artists(Artist_ID)
)

INSERT INTO Artists VALUES
('Eminem')

INSERT INTO Albums VALUES
('Music To Be Murdered', 1)

INSERT INTO Musics VALUES
('Premonition - Intro', '2:53', 1000, 1, 1),
('Unaccommodating', '3:36', 5500, 1, 1),
('You Gon Learn', '3:54', 7000, 1, 1),
('Alfred - Interlude', '0:30', 20000, 1, 1),
('Those Kinda Nights', '2:57', 40000, 1, 1),
('In Too Deep', '3:14', 54000, 1, 1),
('Godzilla', '3:30', 83000, 1, 1),
('Darkness', '5:37', 90000, 1, 1),
('Leaving Heaven', '4:25', 107000, 1, 1),
('Yah Yah', '4:46', 16000, 1, 1),
('Stepdad - Inrto', '0:15', 10000, 1, 1),
('Stepdad', '3:33', 30000, 1, 1),
('Marsh', '3:20', 150000, 1, 1),
('Never Love Again', '2:57', 370000, 1, 1),
('Little Engine', '2:57', 320000, 1, 1),
('Lock It Up', '2:50', 500000, 1, 1),
('Farewell', '4:07', 400000, 1, 1),
('No Regrets', '3:20', 700000, 1, 1),
('I Will', '5:03', 770000, 1, 1),
('Alfred - Outro', '0:39', 260000, 1, 1)


CREATE VIEW AlbumInfo
AS
SELECT m.Name AS 'Music', m.TotalSecond AS 'Duration', ar.Name AS 'Artist', al.Name AS 'Album' FROM Musics m
JOIN Artists ar
ON
ar.Artist_ID=m.Artist_ID
JOIN Albums al
ON
al.Album_ID=m.Album_ID


SELECT * FROM AlbumInfo



CREATE VIEW ArtistInfo
AS
SELECT al.Name AS 'Albom', Count(m.Music_ID) AS 'Count of Tracks' FROM Albums al
JOIN Musics m
ON
m.Album_ID=al.Album_ID
GROUP BY al.Name


SELECT * FROM ArtistInfo



CREATE PROCEDURE usp_GetAlbum @ListenerCount int, @Album_ID int
AS
SELECT m.Name AS 'Music', m.ListenerCount AS 'Count of Listeners', al.Name AS 'Album' FROM Albums al
JOIN Musics m
ON
m.Album_ID=al.Album_ID
WHERE m.ListenerCount>@ListenerCount AND al.Album_ID=@Album_ID


EXEC usp_GetAlbum 270000, 1