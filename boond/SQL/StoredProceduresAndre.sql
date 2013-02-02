
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
