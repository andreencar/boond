DELETE FROM PERSONS

INSERT INTO PERSONs VALUES(null,'Andre',22,'m')
DECLARE @andreID int, @catMusica int, @catCinema int, @catJogos int, @catInternet int, @catCarros int
SELECT @andreID=PersonID FROM persons Where Nome = 'Andre'

DELETE FROM PERSON_CATEGORY

DELETE FROM categoria
INSERT INTO Categoria VALUES('Musica')
INSERT INTO Categoria VALUES('Cinema')
INSERT INTO Categoria VALUES('Jogos')
INSERT INTO Categoria VALUES('Internet')
INSERT INTO Categoria VALUES('Carros')

SELECT @catMusica=CatID FROM Categoria Where Nome = 'Musica'
SELECT @catCinema=CatID FROM Categoria Where Nome = 'Cinema'
SELECT @catJogos=CatID FROM Categoria Where Nome = 'Jogos'
SELECT @catinternet=CatID FROM Categoria Where Nome = 'Internet'
SELECT @catCarros=CatID FROM Categoria Where Nome = 'Carros'

EXEC addFavCats @andreID,@catMusica,@catCinema,@catJogos,@catinternet,@catCarros

DELETE FROM SUBCATEGORIA

DECLARE

