-- SQL for the orders table

BEGIN TRANSACTION;
CREATE TABLE Orders(Id integer PRIMARY KEY, OrderPrice integer CHECK(OrderPrice>0),
                    Customer text);
INSERT INTO Orders(OrderPrice, Customer) VALUES(1200, "Williamson");
INSERT INTO Orders(OrderPrice, Customer) VALUES(200, "Robertson");
INSERT INTO Orders(OrderPrice, Customer) VALUES(40, "Robertson");
INSERT INTO Orders(OrderPrice, Customer) VALUES(1640, "Smith");
INSERT INTO Orders(OrderPrice, Customer) VALUES(100, "Robertson");
INSERT INTO Orders(OrderPrice, Customer) VALUES(50, "Williamson");
INSERT INTO Orders(OrderPrice, Customer) VALUES(150, "Smith");
INSERT INTO Orders(OrderPrice, Customer) VALUES(250, "Smith");
INSERT INTO Orders(OrderPrice, Customer) VALUES(840, "Brown");
INSERT INTO Orders(OrderPrice, Customer) VALUES(440, "Black");
INSERT INTO Orders(OrderPrice, Customer) VALUES(20, "Brown");
COMMIT;
