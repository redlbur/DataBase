ALTER TABLE Movie ADD CONSTRAINT movie_PK PRIMARY KEY(mID); --1

ALTER TABLE Movie ADD CONSTRAINT unique_Movie UNIQUE(title, year); --2

ALTER TABLE Reviewer ADD CONSTRAINT reviewer_PK PRIMARY KEY(rID); --3

ALTER TABLE Rating ADD CONSTRAINT unique_Rating UNIQUE(rID, mID, ratingDate); --4

ALTER TABLE Reviewer ALTER COLUMN name SET NOT NULL; --5

ALTER TABLE Rating ALTER COLUMN stars SET NOT NULL; --6

ALTER TABLE Movie ADD CONSTRAINT movie_Year_Checker CHECK(year>1900); --7


ALTER TABLE Rating ADD CONSTRAINT rating_Star_Checher CHECK(stars between 1 and 5); --8

ALTER TABLE Rating ADD CONSTRAINT ratind_Date_Checker CHECK(ratingDate >= TO_DATE('2000-01-01', 'yyyy-mm-dd')); --9

ALTER TABLE Movie ADD CONSTRAINT movie_Checker CHECK((director='Steven Spielberg' AND year<1990) OR (director='James Cameron' AND year>1990) or (director not in ('Steven Spielberg', 'James Cameron'))); --10

UPDATE Movie set mID= mID+1; --11

insert INTO Movie VALUES (109, 'Titanic', 1997, 'JC'); --12

insert into Reviewer values (201, 'Ted Codd'); --13

update Rating set rID = 205, mID = 104; --14

insert into Reviewer values (209, null); --15

update Rating set stars = null where rID = 208; --16

update Movie set year = year - 40; --17

update Rating set stars = stars + 1; --18

insert into Rating values (201, 101, 1, '1999-01-01'); --19

insert into Movie values (109, 'Jurassic Park', 1993, 'Steven Spielberg'); --20

update Movie set year = year-10 where title = 'Titanic'; --21

insert into Movie values (109, 'Titanic', 2001, null); --22

update Rating set mID = 109; --23

update Movie set year = 1901 where director <> 'James Cameron'; --24

update Rating set stars = stars - 1; --25

ALTER TABLE Rating ADD CONSTRAINT rating_FK foreign KEY(rID) references Reviewer on update CASCADE on delete set NULL; --26

ALTER TABLE Rating ADD CONSTRAINT rating_FK2 foreign KEY(mID) references Movie on delete CASCADE;  --26

SELECT sum(rID) FROM Rating WHERE rID IS NOT NULL;

SELECT count(rID) FROM Rating WHERE rID IS NULL;

update Movie set mID = 109 where mID = 102;

update Reviewer set rID = rID + 10;

delete from Reviewer where rID > 215;

delete from Movie where mID < 105;

SELECT * FROM Rating;

SELECT * FROM Movie;