-- SQL for the Books table

BEGIN TRANSACTION;
CREATE TABLE Books(Id integer PRIMARY KEY, Title text, Author text,
                   Isbn text default 'not available');
INSERT INTO Books VALUES(1,'War and Peace','Leo Tolstoy','978-0345472403');
INSERT INTO Books VALUES(2,'The Brothers Karamazov',
                         'Fyodor Dostoyevsky','978-0486437910');
INSERT INTO Books VALUES(3,'Crime and Punishment',
                         'Fyodor Dostoyevsky','978-1840224306');
COMMIT;
