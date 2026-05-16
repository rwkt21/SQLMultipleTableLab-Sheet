PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Item;
PRAGMA foreign_keys = ON;

CREATE TABLE Item (
	ItemName VARCHAR (30) NOT NULL,
  ItemType CHAR(1) NOT NULL,
  ItemColour VARCHAR(10),
  PRIMARY KEY (ItemName));

CREATE TABLE Employee (
  EmployeeNumber SMALLINT UNSIGNED NOT NULL ,
  EmployeeName VARCHAR(10) NOT NULL ,
  EmployeeSalary INTEGER UNSIGNED NOT NULL ,
  DepartmentName VARCHAR(10) NOT NULL REFERENCES Department,
  BossNumber SMALLINT UNSIGNED REFERENCES Employee,
  PRIMARY KEY (EmployeeNumber));

CREATE TABLE Department (
  DepartmentName VARCHAR(10) NOT NULL,
  DepartmentFloor SMALLINT UNSIGNED NOT NULL,
  DepartmentPhone SMALLINT UNSIGNED NOT NULL,
  EmployeeNumber SMALLINT UNSIGNED NOT NULL REFERENCES 
    Employee,
  PRIMARY KEY (DepartmentName));

CREATE TABLE Sale (
  SaleNumber INTEGER UNSIGNED NOT NULL,
  SaleQuantity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  ItemName VARCHAR(30) NOT NULL REFERENCES Item,
  DepartmentName VARCHAR(10) NOT NULL REFERENCES Department,
  PRIMARY KEY (SaleNumber));

CREATE TABLE Supplier (
  SupplierNumber INTEGER UNSIGNED NOT NULL,
  SupplierName VARCHAR(30) NOT NULL,
  PRIMARY KEY (SupplierNumber));

CREATE TABLE Delivery (
  DeliveryNumber INTEGER UNSIGNED NOT NULL,
  DeliveryQuantity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
  ItemName VARCHAR(30) NOT NULL REFERENCES Item,
  DepartmentName VARCHAR(10) NOT NULL REFERENCES Department,
  SupplierNumber INTEGER UNSIGNED NOT NULL REFERENCES  
     Supplier,
  PRIMARY KEY (DeliveryNumber));

INSERT INTO Item VALUES ('Boots-snakeproof', 'C', 'Green');
INSERT INTO Item VALUES ('Camel Saddle', 'R', 'Brown');
INSERT INTO Item VALUES ('Compass', 'N', NULL);
INSERT INTO Item VALUES ('Elephant polo stick', 'R', 'Bamboo');
INSERT INTO Item VALUES ('Exploring in 10 Easy Lessons', 'B', NULL);
INSERT INTO Item VALUES ('Geo positioning system', 'N', NULL);
INSERT INTO Item VALUES ('Hammock', 'F', 'Khaki');
INSERT INTO Item VALUES ('Hat-Polar Explorer', 'C', 'White');
INSERT INTO Item VALUES ('How to Win Foreign Friends', 'B', NULL);
INSERT INTO Item VALUES ('Map case', 'E', 'Brown');
INSERT INTO Item VALUES ('Map measure', 'N', NULL);
INSERT INTO Item VALUES ('Pith Helmet', 'C', 'Khaki');
INSERT INTO Item VALUES ('Pocket knife-Avon', 'E', 'Brown');
INSERT INTO Item VALUES ('Pocket knife-Nile', 'E', 'Brown');
INSERT INTO Item VALUES ('Safari chair', 'F', 'Khaki');
INSERT INTO Item VALUES ('Safari cooking kit', 'F', NULL);
INSERT INTO Item VALUES ('Sextant', 'N', NULL);
INSERT INTO Item VALUES ('Stetson', 'C', 'Black');
INSERT INTO Item VALUES ('Tent - 2 person', 'F', 'Khaki');
INSERT INTO Item VALUES ('Tent - 8 person', 'F', 'Khaki');
 
-- INSERT data into Employee
-- Note: Alice (employee 1) has no boss, so BossNumber is NULL
INSERT INTO Employee VALUES (1, 'Alice', 75000, 'Management', NULL);
INSERT INTO Employee VALUES (2, 'Ned', 45000, 'Marketing', 1);
INSERT INTO Employee VALUES (3, 'Andrew', 25000, 'Marketing', 2);
INSERT INTO Employee VALUES (4, 'Clare', 22000, 'Marketing', 2);
INSERT INTO Employee VALUES (5, 'Todd', 38000, 'Accounting', 1);
INSERT INTO Employee VALUES (6, 'Nancy', 22000, 'Accounting', 5);
INSERT INTO Employee VALUES (7, 'Brier', 43000, 'Purchasing', 1);
INSERT INTO Employee VALUES (8, 'Sarah', 56000, 'Purchasing', 7);
INSERT INTO Employee VALUES (9, 'Sophie', 35000, 'Personnel', 1);
INSERT INTO Employee VALUES (10, 'Sanjay', 15000, 'Navigation', 3);
INSERT INTO Employee VALUES (11, 'Rita', 15000, 'Books', 4);
INSERT INTO Employee VALUES (12, 'Gigi', 16000, 'Clothes', 4);
INSERT INTO Employee VALUES (13, 'Maggie', 16000, 'Clothes', 4);
INSERT INTO Employee VALUES (14, 'Paul', 11000, 'Equipment', 3);
INSERT INTO Employee VALUES (15, 'James', 15000, 'Equipment', 3);
INSERT INTO Employee VALUES (16, 'Pat', 15000, 'Furniture', 3);
INSERT INTO Employee VALUES (17, 'Mark', 15000, 'Recreation', 3);
 
-- INSERT data into Department
INSERT INTO Department VALUES ('Management', 5, 34, 1);
INSERT INTO Department VALUES ('Books', 1, 81, 4);
INSERT INTO Department VALUES ('Clothes', 2, 24, 4);
INSERT INTO Department VALUES ('Equipment', 3, 57, 3);
INSERT INTO Department VALUES ('Furniture', 4, 14, 3);
INSERT INTO Department VALUES ('Navigation', 1, 41, 3);
INSERT INTO Department VALUES ('Recreation', 2, 29, 4);
INSERT INTO Department VALUES ('Accounting', 5, 35, 5);
INSERT INTO Department VALUES ('Purchasing', 5, 36, 7);
INSERT INTO Department VALUES ('Personnel', 5, 37, 9);
INSERT INTO Department VALUES ('Marketing', 5, 38, 2);
 
-- INSERT data into Sale
INSERT INTO Sale VALUES (1001, 2, 'Boots-snakeproof', 'Clothes');
INSERT INTO Sale VALUES (1002, 1, 'Pith Helmet', 'Clothes');
INSERT INTO Sale VALUES (1003, 1, 'Sextant', 'Navigation');
INSERT INTO Sale VALUES (1004, 3, 'Hat-Polar Explorer', 'Clothes');
INSERT INTO Sale VALUES (1005, 5, 'Pith Helmet', 'Equipment');
INSERT INTO Sale VALUES (1006, 1, 'Pocket knife-Nile', 'Clothes');
INSERT INTO Sale VALUES (1007, 1, 'Pocket knife-Nile', 'Recreation');
INSERT INTO Sale VALUES (1008, 1, 'Compass', 'Navigation');
INSERT INTO Sale VALUES (1009, 1, 'Geo positioning system', 'Navigation');
INSERT INTO Sale VALUES (1010, 5, 'Map measure', 'Navigation');
INSERT INTO Sale VALUES (1011, 1, 'Geo positioning system', 'Books');
INSERT INTO Sale VALUES (1012, 1, 'Sextant', 'Books');
INSERT INTO Sale VALUES (1013, 3, 'Pocket knife-Nile', 'Books');
INSERT INTO Sale VALUES (1014, 1, 'Pocket knife-Nile', 'Navigation');
INSERT INTO Sale VALUES (1015, 1, 'Pocket knife-Nile', 'Equipment');
INSERT INTO Sale VALUES (1016, 1, 'Sextant', 'Clothes');
INSERT INTO Sale VALUES (1017, 1, 'Sextant', 'Equipment');
INSERT INTO Sale VALUES (1018, 1, 'Sextant', 'Recreation');
INSERT INTO Sale VALUES (1019, 1, 'Sextant', 'Furniture');
INSERT INTO Sale VALUES (1020, 1, 'Pocket knife-Nile', 'Furniture');
INSERT INTO Sale VALUES (1021, 1, 'Exploring in 10 Easy Lessons', 'Books');
INSERT INTO Sale VALUES (1022, 1, 'How to Win Foreign Friends', 'Books');
INSERT INTO Sale VALUES (1023, 1, 'Compass', 'Books');
INSERT INTO Sale VALUES (1024, 1, 'Pith Helmet', 'Books');
INSERT INTO Sale VALUES (1025, 1, 'Elephant polo stick', 'Recreation');
INSERT INTO Sale VALUES (1026, 1, 'Camel Saddle', 'Recreation');
 
-- INSERT data into Supplier
INSERT INTO Supplier VALUES (101, 'Global Maps and Books');
INSERT INTO Supplier VALUES (102, 'Nepalese Corp.');
INSERT INTO Supplier VALUES (103, 'All Sports Manufacturing');
INSERT INTO Supplier VALUES (104, 'Sweatshops Unlimited');
INSERT INTO Supplier VALUES (105, 'All Points inc.');
INSERT INTO Supplier VALUES (106, 'Sao Paulo Manufacturing');
 
-- INSERT data into Delivery
INSERT INTO Delivery VALUES (51, 50, 'Pocket knife-Nile', 'Navigation', 105);
INSERT INTO Delivery VALUES (52, 10, 'Pocket knife-Nile', 'Books', 105);
INSERT INTO Delivery VALUES (53, 10, 'Pocket knife-Nile', 'Clothes', 105);
INSERT INTO Delivery VALUES (54, 10, 'Pocket knife-Nile', 'Equipment', 105);
INSERT INTO Delivery VALUES (55, 10, 'Pocket knife-Nile', 'Furniture', 105);
INSERT INTO Delivery VALUES (56, 10, 'Pocket knife-Nile', 'Recreation', 105);
INSERT INTO Delivery VALUES (57, 50, 'Compass', 'Navigation', 101);
INSERT INTO Delivery VALUES (58, 10, 'Geo positioning system', 'Navigation', 101);
INSERT INTO Delivery VALUES (59, 10, 'Map measure', 'Navigation', 101);
INSERT INTO Delivery VALUES (60, 25, 'Map case', 'Navigation', 101);
INSERT INTO Delivery VALUES (61, 2, 'Sextant', 'Navigation', 101);
INSERT INTO Delivery VALUES (62, 1, 'Sextant', 'Equipment', 105);
INSERT INTO Delivery VALUES (63, 20, 'Compass', 'Equipment', 103);
INSERT INTO Delivery VALUES (64, 1, 'Geo positioning system', 'Books', 103);
INSERT INTO Delivery VALUES (65, 15, 'Map measure', 'Navigation', 103);
INSERT INTO Delivery VALUES (66, 1, 'Sextant', 'Books', 103);
INSERT INTO Delivery VALUES (67, 5, 'Sextant', 'Recreation', 102);
INSERT INTO Delivery VALUES (68, 3, 'Sextant', 'Navigation', 104);
INSERT INTO Delivery VALUES (69, 5, 'Boots-snakeproof', 'Clothes', 105);
INSERT INTO Delivery VALUES (70, 15, 'Pith Helmet', 'Clothes', 105);
INSERT INTO Delivery VALUES (71, 1, 'Pith Helmet', 'Clothes', 105);
INSERT INTO Delivery VALUES (72, 1, 'Pith Helmet', 'Clothes', 101);
INSERT INTO Delivery VALUES (73, 1, 'Pith Helmet', 'Clothes', 103);
INSERT INTO Delivery VALUES (74, 1, 'Pith Helmet', 'Clothes', 104);
INSERT INTO Delivery VALUES (75, 5, 'Pith Helmet', 'Navigation', 105);
INSERT INTO Delivery VALUES (76, 5, 'Pith Helmet', 'Books', 105);
INSERT INTO Delivery VALUES (77, 5, 'Pith Helmet', 'Equipment', 105);
INSERT INTO Delivery VALUES (78, 5, 'Pith Helmet', 'Furniture', 105);
INSERT INTO Delivery VALUES (79, 5, 'Pith Helmet', 'Recreation', 105);
INSERT INTO Delivery VALUES (80, 10, 'Pocket knife-Nile', 'Navigation', 102);
INSERT INTO Delivery VALUES (81, 1, 'Compass', 'Navigation', 102);
INSERT INTO Delivery VALUES (82, 1, 'Geo positioning system', 'Navigation', 102);
INSERT INTO Delivery VALUES (83, 10, 'Map measure', 'Navigation', 102);
INSERT INTO Delivery VALUES (84, 5, 'Map case', 'Navigation', 102);
INSERT INTO Delivery VALUES (85, 5, 'Compass', 'Books', 102);
INSERT INTO Delivery VALUES (86, 5, 'Pocket knife-Avon', 'Recreation', 102);
INSERT INTO Delivery VALUES (87, 5, 'Tent - 2 person', 'Recreation', 102);
INSERT INTO Delivery VALUES (88, 2, 'Tent - 8 person', 'Recreation', 102);
INSERT INTO Delivery VALUES (89, 5, 'Exploring in 10 Easy Lessons', 'Navigation', 102);
INSERT INTO Delivery VALUES (90, 5, 'How to Win Foreign Friends', 'Navigation', 102);
INSERT INTO Delivery VALUES (91, 10, 'Exploring in 10 Easy Lessons', 'Books', 102);
INSERT INTO Delivery VALUES (92, 10, 'How to Win Foreign Friends', 'Books', 102);
INSERT INTO Delivery VALUES (93, 2, 'Exploring in 10 Easy Lessons', 'Recreation', 102);
INSERT INTO Delivery VALUES (94, 2, 'How to Win Foreign Friends', 'Recreation', 102);
INSERT INTO Delivery VALUES (95, 5, 'Compass', 'Equipment', 105);
INSERT INTO Delivery VALUES (96, 2, 'Boots-snakeproof', 'Equipment', 105);
INSERT INTO Delivery VALUES (97, 20, 'Pith Helmet', 'Equipment', 106);
INSERT INTO Delivery VALUES (98, 20, 'Pocket knife-Nile', 'Equipment', 106);
INSERT INTO Delivery VALUES (99, 1, 'Sextant', 'Equipment', 106);
INSERT INTO Delivery VALUES (100, 3, 'Hat-Polar Explorer', 'Clothes', 105);
INSERT INTO Delivery VALUES (101, 3, 'Stetson', 'Clothes', 105);
 
-- Verify all tables
SELECT * FROM Item;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Sale;
SELECT * FROM Supplier;
SELECT * FROM Delivery;