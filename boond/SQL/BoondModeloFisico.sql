USE wdme_db

DROP TABLE Person_Product

DROP TABLE Village_Product

DROP TABLE Person_Category

DROP TABLE SubCategoria

DROP TABLE Categoria

DROP TABLE Persons

DROP TABLE VillageList

DROP TABLE Produtos



CREATE TABLE VillageList(
villageID int IDENTITY,
PRIMARY KEY (villageID)
) 

CREATE TABLE Persons(
PersonID int IDENTITY,
villageID int,
Nome varchar(255) NOT NULL,
Idade int NOT NULL,
DefinedCats int,
Sexo varchar(1) NOT NULL CHECK (sexo='m' OR sexo='f')
PRIMARY KEY(PersonID)
FOREIGN KEY (villageID) REFERENCES VillageList(villageID)
)

IF (OBJECT_ID('dbo.Categoria') IS NULL)
CREATE TABLE Categoria(
CatID int IDENTITY,
Nome varchar(255) NOT NULL UNIQUE,
PRIMARY KEY (CatID)
) 

IF (OBJECT_ID('dbo.SubCategoria') IS NULL)
CREATE TABLE SubCategoria(
CatID int NOT NULL,
SubCatID int,
Nome varchar(255) NOT NULL UNIQUE,
PRIMARY KEY (SubCatID, CatID),
FOREIGN KEY (CatID) REFERENCES Categoria(catID)
) 

CREATE TABLE Person_Product(
	PersonID int NOT NULL,
	ProductID int NOT NULL,
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	FOREIGN KEY (ProductID) REFERENCES Produtos(ProductID)
)

CREATE TABLE Village_Product(
	villageID int NOT NULL,
	ProductID int NOT NULL,
	FOREIGN KEY (villageID) REFERENCES VillageList(villageID),
	FOREIGN KEY (ProductID) REFERENCES Produtos(ProductID)
)

CREATE TABLE Person_Category(
	PersonID int NOT NULL,
	CatID int NOT NULL,
	FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
	FOREIGN KEY (CatID) REFERENCES Categoria(CatID)
)


CREATE clustered INDEX pID
ON Person_Category(PersonID)

DROP TABLE Produtos
IF(OBJECT_ID('dbo.Produtos') IS NULL)
CREATE TABLE Produtos(
Cat int NOT NULL,
SubCat int NOT NULL,
ProductID int NOT NULL,
Nome varchar(255) NOT NULL,
FeedURI varchar(255) NOT NULL,
ImageURL VARCHAR(2083) NOT NULL, 
PRIMARY KEY (ProductID),
FOREIGN KEY (SubCat, Cat) REFERENCES SubCategoria(SubCatID, CatID)
) 

GO
CREATE TRIGGER InProd ON Produtos
INSTEAD OF INSERT
AS
DECLARE @newProdID int, @SubCat int, @Nome varchar(255)
DECLARE  cur CURSOR FOR (SELECT SubCat,Nome FROM INSERTED)
OPEN cur
FETCH NEXT FROM cur INTO @SubCat, @Nome
WHILE(@@FETCH_STATUS = 0)
BEGIN
SET @newProdID= (SELECT MAX (ProductID) FROM Produtos WHERE SubCat=@SubCat)
IF(@newProdID IS NULL)
SET @newProdID=0
INSERT INTO Produtos VALUES(@SubCat,@newProdID,@Nome)
END
CLOSE cur
DEALLOCATE cur


IF OBJECT_ID ( 'jungle_to_village' ) IS NOT NULL 
    DROP PROCEDURE 'jungle_to_village';
GO
CREATE PROCEDURE jungle_to_village
DECLARE CURSOR usersWithoutVillage FOR SELECT PersonID FROM Persons WHERE villageID = 0
DECLARE @pid int
OPEN usersWithoutVillage 
FETCH NEXT usersWithoutVillage INTO @pid
WHILE(@@FETCH_STATUS = 0)
BEGIN




FETCH NEXT usersWithoutVillage INTO @pid
END
CLOSE usersWithoutVillage
DEALLOCATE usersWithoutVillage
GO

CREATE FUNCTION getVillageToInsert  (@pid int)
RETURNS int
BEGIN
DECLARE @personFavRef, @person
END


