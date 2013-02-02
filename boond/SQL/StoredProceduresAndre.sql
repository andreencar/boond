
IF OBJECT_ID ( 'dbo.addFavCats' ) IS NOT NULL 
    DROP PROCEDURE dbo.addFavCats;
GO
CREATE PROCEDURE addFavCats (@userId int, @favcat1 int, @favcat2 int, @favcat3 int, @favcat4 int, @favcat5 int)
AS
INSERT INTO Person_Category VALUES(@userId, @favcat1)
INSERT INTO Person_Category VALUES(@userId, @favcat2)
INSERT INTO Person_Category VALUES(@userId, @favcat3)
INSERT INTO Person_Category VALUES(@userId, @favcat4)
INSERT INTO Person_Category VALUES(@userId, @favcat5)

IF OBJECT_ID ( 'dbo.BattleFavCats' ) IS NOT NULL 
    DROP PROCEDURE dbo.BattleFavCats;
GO
CREATE PROCEDURE BattleFavCats (@userId int)
AS
Declare @catToBePlayed int
SELECT  TOP 1 @catToBePlayed= CatID FROM Person_Category
ORDER BY NEWID()
PRINT(@catToBePlayed)
EXEC dbo.productosFromsameCat @catToBePlayed


EXEC addFavCats 2,1,2,3,4,5

DELETE FROM Person_Category WHERE PersonID=2

CREATE CLUSTERED INDEX toTestone
ON Person_Category (PersonID)

INSERT INTO Person_Category VALUES(2, 1)

CREATE PROC dbo.AddPerson
@Nome varchar(255), @Idade int, @DefinedCats int, @Sexo varchar(1)
AS
 INSERT INTO Persons VALUES (@Nome, @Idade, @DefinedCats, @Sexo)

DROP PROC dbo.productsFromSameCat

CREATE TABLE #ProductsSP(
	ProductID INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES Produtos(ProductID)
)

CREATE PROC dbo.productsFromSameCat 
@cat INT
AS
BEGIN
	DECLARE @subCat INT
	SET @subCat = (select top 1 SubCatID from SubCategoria where CatID = @cat order by newid())
	INSERT INTO #ProductsSP SELECT TOP 2 ProductID FROM Produtos WHERE SubCat = @subCat
END