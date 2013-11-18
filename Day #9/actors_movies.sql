-- SQL for the ActorsMovies table

BEGIN TRANSACTION;
CREATE TABLE ActorsMovies(Id integer primary key autoincrement,
                          AId integer, MId integer);
INSERT INTO ActorsMovies VALUES(1,1,1);
INSERT INTO ActorsMovies VALUES(2,2,1);
INSERT INTO ActorsMovies VALUES(3,3,1);
INSERT INTO ActorsMovies VALUES(4,4,2);
INSERT INTO ActorsMovies VALUES(5,5,2);
INSERT INTO ActorsMovies VALUES(6,6,3);
INSERT INTO ActorsMovies VALUES(7,7,3);
INSERT INTO ActorsMovies VALUES(8,8,4);
INSERT INTO ActorsMovies VALUES(9,9,4);
INSERT INTO ActorsMovies VALUES(10,10,4);
INSERT INTO ActorsMovies VALUES(11,8,5);
COMMIT;
