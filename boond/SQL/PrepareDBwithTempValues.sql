INSERT INTO PERSONs VALUES(null,'Andre',22,0,'m')
DECLARE @andreID int, @catMusica int, @catCinema int, @catJogos int, @catInternet int, @catCarros int
SELECT @andreID=PersonID FROM persons Where Nome = 'Andre'
/*
INSERT INTO Categoria VALUES('Musica')
INSERT INTO Categoria VALUES('Cinema')
INSERT INTO Categoria VALUES('Jogos')
INSERT INTO Categoria VALUES('Internet')
INSERT INTO Categoria VALUES('Carros')
*/
SELECT @catMusica=CatID FROM Categoria Where Nome = 'Musica'
SELECT @catCinema=CatID FROM Categoria Where Nome = 'Cinema'
SELECT @catJogos=CatID FROM Categoria Where Nome = 'Jogos'
SELECT @catinternet=CatID FROM Categoria Where Nome = 'Internet'
SELECT @catCarros=CatID FROM Categoria Where Nome = 'Carros'

/*EXEC addFavCats @andreID,@catMusica,@catCinema,@catJogos,@catinternet,@catCarros
*/
DECLARE @FPS int, @RPG int, @MMO int, @Kizomba int, @Kuduro int, @Thriller int, @Drama int

INSERT INTO SubCategoria VALUES(@catMusica,,'Kizomba')
INSERT INTO SubCategoria VALUES(@catMusica,null,'Indie Rock')
INSERT INTO SubCategoria VALUES(@catMusica,null,'Alternative Rock')
INSERT INTO SubCategoria VALUES(@catMusica,null,'House')
INSERT INTO SubCategoria VALUES(@catMusica,null,'Reggae')
INSERT INTO SubCategoria VALUES(@catCinema,null,'Drama')
INSERT INTO SubCategoria VALUES(@catCinema,null,'Comedia')
INSERT INTO SubCategoria VALUES(@catCinema,null,'Terror')
INSERT INTO SubCategoria VALUES(@catCinema,null,'Thriller')
INSERT INTO SubCategoria VALUES(@catCinema,null,'Musical')
INSERT INTO SubCategoria VALUES(@catCinema,null,'FPS')
INSERT INTO SubCategoria VALUES(@catCinema,null,'MMORPG')
INSERT INTO SubCategoria VALUES(@catCinema,null,'MOBA')
INSERT INTO SubCategoria VALUES(@catCinema,null,'TPS')
INSERT INTO SubCategoria VALUES(@catCinema,null,'RTS')
INSERT INTO SubCategoria VALUES(@catInternet,null,'Gaming')
INSERT INTO SubCategoria VALUES(@catInternet,null,'News')
INSERT INTO SubCategoria VALUES(@catInternet,null,'Videos')
INSERT INTO SubCategoria VALUES(@catInternet,null,'Social')
INSERT INTO SubCategoria VALUES(@catInternet,null,'Comedy')
INSERT INTO SubCategoria VALUES(@catCarros,null,'Modelos')
INSERT INTO SubCategoria VALUES(@catCarros,null,'Marcas')



Select * from Persons
Select * from Categoria
Select * from SubCategoria

