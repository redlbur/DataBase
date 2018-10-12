CREATE DATABASE lab4;

CREATE TABLE Warehouses(
code INT,
  location char(255),
  capacity INT
);

CREATE TABLE Boxes(
code char(4),
  contents char(255),
  value REAL,
  warehouse INT
);

 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

SELECT * FROM Warehouses;--4
SELECT * FROM Boxes WHERE value > 150;--5
SELECT DISTINCT Contents FROM Boxes;--6
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse;--7
SELECT Warehouse, AVG(Value) FROM Boxes
GROUP BY Warehouse HAVING AVG(Value) > 2;--8
INSERT INTO Warehouses (Location,Capacity) VALUES ('New York',3);--9
INSERT INTO Boxes VALUES('H5RT','Papers',200,2);--10
UPDATE Boxes SET Value = Value * 0.85;--11
DELETE FROM Boxes WHERE Value < 150;--12
DELETE FROM Boxes WHERE Warehouse IN(SELECT Code FROM Warehouses WHERE Code = 3)
RETURNING *;--13