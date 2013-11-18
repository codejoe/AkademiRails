-- SQL for the Friends table

BEGIN TRANSACTION;
CREATE TABLE Friends(Id integer PRIMARY KEY, Name text UNIQUE NOT NULL,
                     Sex text CHECK(Sex IN ('M', 'F')));
INSERT INTO Friends VALUES(1,'Jane', 'F');
INSERT INTO Friends VALUES(2,'Thomas', 'M');
INSERT INTO Friends VALUES(3,'Franklin', 'M');
INSERT INTO Friends VALUES(4,'Elisabeth', 'F');
INSERT INTO Friends VALUES(5,'Mary', 'F');
INSERT INTO Friends VALUES(6,'Lucy', 'F');
INSERT INTO Friends VALUES(7,'Jack', 'M');
COMMIT;