-- SQL for the Movies table

BEGIN TRANSACTION;
CREATE TABLE Movies(MId integer primary key autoincrement, Title text);
INSERT INTO Movies VALUES(1,'Capote');
INSERT INTO Movies VALUES(2,'Scent of a woman');
INSERT INTO Movies VALUES(3,'Stigmata');
INSERT INTO Movies VALUES(4,'Exorcist');
INSERT INTO Movies VALUES(5,'Hamsun');
COMMIT;