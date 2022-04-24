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
	Album_ID int references Albums(Album_ID),
	Artist_ID int references Artists(Artist_ID)
)

INSERT INTO Artists VALUES
('Eminem')

INSERT INTO Albums VALUES
('Music To Be Murdered', 1)

INSERT INTO Musics VALUES
('Premonition - Intro', '2:53', 1, 1),
('Unaccommodating', '3:36', 1, 1),
('You Gon Learn', '3:54', 1, 1),
('Alfred - Interlude', '0:30', 1, 1),
('Those Kinda Nights', '2:57', 1, 1),
('In Too Deep', '3:14', 1, 1),
('Godzilla', '3:30', 1, 1),
('Darkness', '5:37', 1, 1),
('Leaving Heaven', '4:25', 1, 1),
('Yah Yah', '4:46', 1, 1),
('Stepdad - Inrto', '0:15', 1, 1),
('Stepdad', '3:33', 1, 1),
('Marsh', '3:20', 1, 1),
('Never Love Again', '2:57', 1, 1),
('Little Engine', '2:57', 1, 1),
('Lock It Up', '2:50', 1, 1),
('Farewell', '4:07', 1, 1),
('No Regrets', '3:20', 1, 1),
('I Will', '5:03', 1, 1),
('Alfred - Outro', '0:39', 1, 1)


CREATE VIEW MusicToBeMurderedInfo
AS
SELECT m.Name AS 'Music', m.TotalSecond AS 'Total Second', ar.Name AS 'Artist', al.Name AS 'Album' FROM Musics m
JOIN Artists ar
ON
ar.Artist_ID=m.Artist_ID
JOIN Albums al
ON
al.Album_ID=m.Album_ID


SELECT * FROM MusicToBeMurderedInfo