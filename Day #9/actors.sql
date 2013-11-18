-- SQL for the Actors table

BEGIN TRANSACTION;
CREATE TABLE Actors(AId integer primary key autoincrement, Name text);
INSERT INTO Actors VALUES(1,'Philip Seymour Hofman');
INSERT INTO Actors VALUES(2,'Kate Shindle');
INSERT INTO Actors VALUES(3,'Kelci Stephenson');
INSERT INTO Actors VALUES(4,'Al Pacino');
INSERT INTO Actors VALUES(5,'Gabrielle Anwar');
INSERT INTO Actors VALUES(6,'Patricia Arquette');
INSERT INTO Actors VALUES(7,'Gabriel Byrne');
INSERT INTO Actors VALUES(8,'Max von Sydow');
INSERT INTO Actors VALUES(9,'Ellen Burstyn');
INSERT INTO Actors VALUES(10,'Jason Miller');
COMMIT;