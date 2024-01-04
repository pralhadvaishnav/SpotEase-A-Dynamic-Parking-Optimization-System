drop table if exists Parking_Lot
go
CREATE TABLE Parking_Lot
(
    Parking_Lot_ID char(50) PRIMARY KEY,
    Address char(50) UNIQUE NOT NULL
);

INSERT INTO Parking_Lot VALUES ('L1', 'Whitman Lot');
INSERT INTO Parking_Lot VALUES ('L2', 'Colvin Lot');
INSERT INTO Parking_Lot VALUES ('L3', 'University Avenue Garage');
INSERT INTO Parking_Lot VALUES ('L4', 'Waverly Lot');
INSERT INTO Parking_Lot VALUES ('L5', 'Bird Library Lot');

drop table if exists Rate
go
CREATE TABLE Rate
(
    Rate_Type char(50),
    Hourly_Rate DECIMAL(10,2) CHECK (Hourly_Rate > 0),
    Daily_Rate DECIMAL(10,2) CHECK (Daily_Rate > 0),
    Monthly_Rate DECIMAL(10,2) CHECK (Monthly_Rate > 0),
    PRIMARY KEY (Rate_Type)
);

INSERT INTO Rate VALUES ('Small', 2.00, 20.00, 600.00);
INSERT INTO Rate VALUES ('Charging', 3.00, 35.00, 800.00);
INSERT INTO Rate VALUES ('Handicap', 1.50, 20.00, 500.00);
INSERT INTO Rate VALUES ('Large', 3.50, 35.00, 700.00);
INSERT INTO Rate VALUES ('Medium', 2.50, 30.00, 650.00);

drop table if exists Parking_Space
go
CREATE TABLE Parking_Space
(
    Parking_Space_ID INT,
    Parking_Lot_ID char(50),
    Parking_Space_Type char(50) NOT NULL,
    Is_Occupied char(50) DEFAULT 'False',
    PRIMARY KEY (Parking_Space_ID, Parking_Lot_ID),
    FOREIGN KEY (Parking_Lot_ID) REFERENCES Parking_Lot(Parking_Lot_ID) ON DELETE CASCADE,
    FOREIGN KEY (Parking_Space_Type) References Rate(Rate_Type)
);
INSERT INTO Parking_Space VALUES (11 , 'L1', 'Small', 'TRUE');
INSERT INTO Parking_Space VALUES (12 , 'L1', 'Medium', 'FALSE');
INSERT INTO Parking_Space VALUES (13 , 'L1', 'Large', 'TRUE');
INSERT INTO Parking_Space VALUES (14 , 'L1', 'Charging', 'TRUE');
INSERT INTO Parking_Space VALUES (15 , 'L1', 'Handicap', 'FALSE');
INSERT INTO Parking_Space VALUES (16 , 'L2', 'Small', 'FALSE');
INSERT INTO Parking_Space VALUES (17 , 'L2', 'Medium', 'FALSE');
INSERT INTO Parking_Space VALUES (18 , 'L2', 'Large', 'TRUE');
INSERT INTO Parking_Space VALUES (19 , 'L2', 'Charging', 'TRUE');
INSERT INTO Parking_Space VALUES (20 , 'L2', 'Handicap', 'TRUE');
INSERT INTO Parking_Space VALUES (21 , 'L3', 'Small', 'TRUE');
INSERT INTO Parking_Space VALUES (22 , 'L3', 'Medium', 'FALSE');
INSERT INTO Parking_Space VALUES (23 , 'L3', 'Large', 'FALSE');
INSERT INTO Parking_Space VALUES (24 , 'L3', 'Charging', 'FALSE');
INSERT INTO Parking_Space VALUES (25 , 'L3', 'Handicap', 'TRUE');
INSERT INTO Parking_Space VALUES (26 , 'L4', 'Small', 'TRUE');
INSERT INTO Parking_Space VALUES (27 , 'L4', 'Medium', 'FALSE');
INSERT INTO Parking_Space VALUES (28 , 'L4', 'Large', 'TRUE');
INSERT INTO Parking_Space VALUES (29 , 'L4', 'Charging', 'FALSE');
INSERT INTO Parking_Space VALUES (30 , 'L4', 'Handicap', 'TRUE');
INSERT INTO Parking_Space VALUES (31 , 'L5', 'Small', 'FALSE');
INSERT INTO Parking_Space VALUES (32 , 'L5', 'Medium', 'TRUE');
INSERT INTO Parking_Space VALUES (33 , 'L5', 'Large', 'TRUE');
INSERT INTO Parking_Space VALUES (34 , 'L5', 'Charging', 'TRUE');
INSERT INTO Parking_Space VALUES (35 , 'L5', 'Handicap', 'FALSE');

drop table if exists Customer
GO
CREATE TABLE Customer
(
    Customer_ID Char(50),
    License_Plate Char(50) NOT NULL,
    Primary Key (Customer_ID)
);

INSERT INTO Customer (Customer_ID, License_Plate) values ('C1', 'KHA7559');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C2', 'THC3645');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C3', 'PBS8683');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C4', 'AFR345');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C5', 'KSG6414');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C6', 'KJS3739');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C7', 'KNP8174');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C8', 'KDM4791');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C9', 'AM97132');
INSERT INTO Customer (Customer_ID, License_Plate) values ('C10', 'SXG457');

update Customer set License_Plate = 'KLB3542' where License_Plate= 'SXG457'

drop table if exists Pass_Holder
GO

CREATE TABLE Pass_Holder
(
    Customer_ID Char(50),
    First_Name Char(50) NOT NULL,
    Last_Name Char(50) NOT NULL,
    Phone_Number Char(50) NOT NULL UNIQUE,
    Address Char(50) NOT NULL,
    Email Char(50) NOT NULL UNIQUE,
    Primary Key (Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);
alter table Pass_Holder 
    drop column Last_Name;
alter table Pass_Holder
    add  Last_Name Char(50) NOT NULL;

alter table Pass_Holder
    add Gender Char(10) NOT NULL;

INSERT INTO Pass_Holder (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Email, Gender)  values ('C6', 'Syed', 'Naqvi', '5084642294', '916 Ackerman Ave', 'snaqvi@gmail.com', 'Male');
INSERT INTO Pass_Holder (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Email, Gender)  values ('C7', 'Shrey', 'Sheth', '6072335838', '604 Walnut Ave', 'ssheth@gmail.com','Male');
INSERT INTO Pass_Holder (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Email, Gender)  values ('C8', 'Rahul', 'Kotian', '8144740588', '818 Lancaster Ave', 'rkotian@gmail.com','Male');
INSERT INTO Pass_Holder (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Email, Gender)  values ('C9', 'Pralhad', 'Vaishnav', '9734574828', '305 S Beech St', 'pvaishanv@gmail.com','Male');
INSERT INTO Pass_Holder (Customer_ID, First_Name, Last_Name, Phone_Number, Address, Email, Gender)  values ('C10', 'Laura', 'Korte', '8127457647', '2343 Euclid Ave', 'lkorte@gmail.com','Female');

create view test AS
Select * from Pass_Holder
where Customer_ID ='C10';

update Pass_Holder set First_Name= 'Angelina' , Last_Name ='Jolie' where Customer_ID = 'C10'


drop table if exists Parking_Lot_Employee
GO
CREATE TABLE Parking_Lot_Employee
(
    Employee_ID Char(50),
    First_Name Char(50) NOT NULL,
    Last_Name Char(50) NOT NULL,
    Hiring_Date DATE NOT NULL,
    Employment_Status Char(50) DEFAULT 'ACTIVE',
    Primary Key (Employee_ID)
);
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E1', 'James', 'Patten', '2022-10-22', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E2', 'Henry', 'Wilson', '2022-12-30', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E3', 'Leroy', 'Nagel', '2022-11-14', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E4', 'Diane', 'William', '2022-03-15', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E5', 'Sandra', 'Brunswick', '2022-03-15', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E6', 'Corey', 'Morrison', '2022-10-10', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E7', 'Walter', 'White', '2022-12-01', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E8', 'Holly', 'Taylor', '2022-04-04', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E9', 'Bart', 'Simpson', '2022-05-05', 'ACTIVE'); 
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E10', 'Jeffrey', 'Watson', '2022-12-17', 'ACTIVE');
INSERT INTO Parking_Lot_Employee (Employee_ID, First_Name, Last_Name, Hiring_Date, Employment_Status) values ('E11', 'Alan', 'Walker', '2022-04-07', 'ACTIVE'); 


drop table if exists Manager
go
CREATE TABLE Manager
(
    Employee_ID Char(50),
    Manager_ID Char(50) NOT NULL UNIQUE,
    Managed_By_ID Char(50),
    Primary Key (Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Parking_Lot_Employee(Employee_ID) ON DELETE CASCADE,
    FOREIGN KEY (Managed_By_ID) REFERENCES Manager(Manager_ID) ON DELETE NO ACTION
);

INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E11', 'M6', null);
INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E10', 'M5', 'M6');
INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E8', 'M3', 'M5');
INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E7', 'M2', 'M3');
INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E9', 'M4', 'M2');
INSERT INTO Manager (Employee_ID, Manager_ID, Managed_By_ID) VALUES ('E6', 'M1', 'M2');

drop table if exists Manager_Salary
go
CREATE TABLE Manager_Salary
(
    Manager_Type CHAR(50) PRIMARY KEY,
    Salary DECIMAL (10,2) CHECK (Salary > 0)
);
INSERT INTO Manager_Salary (Manager_Type, Salary) VALUES ('Lot Manager', 40000);
INSERT INTO Manager_Salary (Manager_Type, Salary) VALUES ('Regional Manager', 50000);
INSERT INTO Manager_Salary (Manager_Type, Salary) VALUES ('Assistant Director', 60000);
INSERT INTO Manager_Salary (Manager_Type, Salary) VALUES ('Director', 70000);
INSERT INTO Manager_Salary (Manager_Type, Salary) VALUES ('Executive', 80000);


drop table if exists Manager_ID_Manager_Type
go
CREATE TABLE Manager_ID_Manager_Type
(
    Manager_ID CHAR(50),
    Manager_Type CHAR(50),
    PRIMARY KEY (Manager_ID,Manager_Type),
    FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID) ON DELETE CASCADE,
    FOREIGN KEY (Manager_Type) REFERENCES Manager_Salary(Manager_Type)
);

INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M1', 'Lot Manager');
INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M2', 'Regional Manager');
INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M3', 'Assistant Director');
INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M4', 'Lot Manager');
INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M5', 'Director');
INSERT INTO Manager_ID_Manager_Type (Manager_ID, Manager_Type) VALUES ('M6', 'Executive');

drop table if exists Officer
GO
CREATE TABLE Officer
(
    Employee_ID CHAR(50) PRIMARY KEY,
    Officer_ID CHAR(50) NOT NULL UNIQUE,
    Shift CHAR(50),
    Managed_By_ID CHAR(50) NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Parking_Lot_Employee(Employee_ID) ON DELETE CASCADE,
    FOREIGN KEY (Managed_By_ID) REFERENCES Manager(Manager_ID)
);
INSERT INTO Officer VALUES ('E1', 'O1', 'Day','M1');
INSERT INTO Officer VALUES ('E2', 'O2', 'Day', 'M1');
INSERT INTO Officer VALUES ('E3', 'O3', 'Night', 'M4');
INSERT INTO Officer VALUES ('E4', 'O4', 'Night', 'M4');
INSERT INTO Officer VALUES ('E5', 'O5', 'Night', 'M4');

drop table if exists Fine_Type_Cost
CREATE TABLE Fine_Type_Cost
(
    Fine_Type CHAR(50) PRIMARY KEY,
    Cost DECIMAL(10,2) CHECK (Cost > 0)
);
INSERT INTO Fine_Type_Cost VALUES ('Over Time Limit', 60.00);
INSERT INTO Fine_Type_Cost VALUES ('Parking In Non-designated Space', 150.00);
INSERT INTO Fine_Type_Cost VALUES ('Parking In Handicap Space', 250.00);
INSERT INTO Fine_Type_Cost VALUES ('Parking In Emergency Vehicle Space', 500.00);
INSERT INTO Fine_Type_Cost VALUES ('No Payment', 100.00);

drop table if exists Fine
GO
CREATE TABLE Fine
(
    Fine_ID CHAR(50) PRIMARY KEY,
    Officer_ID CHAR(50) NOT NULL,
    Customer_ID CHAR(50) NOT NULL,
    Fine_Type CHAR(50) NOT NULL,
    Issue_Date_Time DATETIME NOT NULL,
    Due_Date DATETIME NOT NULL,
    Payment_Date_Time DATETIME NOT NULL,
    FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Fine_Type) REFERENCES Fine_Type_Cost(Fine_Type)
);
INSERT INTO Fine VALUES ('F1', 'O1', 'C1', 'Parking In Handicap Space', '2022-05-29 07:00:00', '2022-06-05', '2022-06-03 18:15:00');
INSERT INTO Fine VALUES ('F2', 'O1', 'C5', 'Over Time Limit', '2022-05-29 12:00:00', '2022-06-05', '2022-06-01 12:00:35');
INSERT INTO Fine VALUES ('F3', 'O2', 'C7', 'Over Time Limit', '2022-06-01 15:03:00', '2022-06-08', '2022-06-05 16:14:35');
INSERT INTO Fine VALUES ('F4', 'O3', 'C8', 'Over Time Limit', '2022-06-09 19:00:00', '2022-06-16', '2022-06-10 13:00:00');
INSERT INTO Fine VALUES ('F5', 'O5', 'C10','Parking In Emergency Vehicle Space', '2022-06-09 20:13:00', '2022-06-16', '2022-06-13 22:00:16');

drop table if exists Patrols
Go
CREATE TABLE Patrols
(
    Officer_ID CHAR(50),
    Parking_Lot_ID CHAR(50),
    PRIMARY KEY (Officer_ID, Parking_Lot_ID),
    FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID) ON DELETE CASCADE,
    FOREIGN KEY (Parking_Lot_ID) REFERENCES Parking_Lot(Parking_Lot_ID) ON DELETE CASCADE
);
INSERT INTO Patrols VALUES ('O1', 'L1');
INSERT INTO Patrols VALUES ('O1', 'L2');
INSERT INTO Patrols VALUES ('O1', 'L3');
INSERT INTO Patrols VALUES ('O1', 'L4');
INSERT INTO Patrols VALUES ('O1', 'L5');
INSERT INTO Patrols VALUES ('O2', 'L2');
INSERT INTO Patrols VALUES ('O3', 'L1');
INSERT INTO Patrols VALUES ('O3', 'L2');
INSERT INTO Patrols VALUES ('O3', 'L3');
INSERT INTO Patrols VALUES ('O3', 'L4');
INSERT INTO Patrols VALUES ('O3', 'L5');
INSERT INTO Patrols VALUES ('O4', 'L4');
INSERT INTO Patrols VALUES ('O5', 'L5');


drop table if exists Parking_Slip
go
CREATE TABLE Parking_Slip
(
    Parking_Slip_ID char(50) PRIMARY KEY,
    Issue_Date_Time DATETIME NOT  NULL,
    Expiry_Date_Time DATETIME NOT  NULL,
    Parking_Lot_ID char(50) NOT  NULL,
    Parking_Space_ID INT NOT  NULL,
    Customer_ID char(50) NOT  NULL,
    FOREIGN KEY (Parking_Space_ID, Parking_Lot_ID) REFERENCES Parking_Space(Parking_Space_ID,Parking_Lot_ID) ON DELETE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);
INSERT INTO Parking_Slip VALUES ('PS1' , '2022-08-01 19:00:00', '2022-08-01 20:00:00', 'L1', 11, 'C1');
INSERT INTO Parking_Slip VALUES ('PS2' , '2022-09-01 15:00:00', '2022-09-01 16:00:00', 'L2', 16, 'C2');
INSERT INTO Parking_Slip VALUES ('PS3' , '2022-10-01 12:00:00', '2022-10-01 13:00:00', 'L3', 21, 'C3');
INSERT INTO Parking_Slip VALUES ('PS4' , '2022-12-01 04:00:00', '2022-12-01 05:00:00', 'L4', 26, 'C4');
INSERT INTO Parking_Slip VALUES ('PS5' , '2022-01-01 20:00:00', '2022-01-01 21:00:00', 'L5', 31, 'C5');


drop table if exists Parking_Pass
go
CREATE TABLE Parking_Pass
(
    Parking_Pass_ID char(50) PRIMARY KEY,
    Issue_Date_Time DATETIME NOT  NULL,
    Expiry_Date_Time DATETIME NOT  NULL,
    Parking_Lot_ID char(50) NOT  NULL,
    Parking_Space_ID INT NOT  NULL,
    Customer_ID char(50) NOT  NULL,
    FOREIGN KEY (Parking_Space_ID, Parking_Lot_ID) REFERENCES Parking_Space(Parking_Space_ID,Parking_Lot_ID) ON DELETE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Pass_Holder(Customer_ID) ON DELETE CASCADE
);

INSERT INTO Parking_Pass VALUES ('PP1' , '2022-08-01 00:00:00', '2022-08-31 23:59:59', 'L1', 12, 'C6');
INSERT INTO Parking_Pass VALUES ('PP2' , '2022-09-01 00:00:00', '2022-09-30 23:59:59', 'L2', 17, 'C7');
INSERT INTO Parking_Pass VALUES ('PP3' , '2022-10-01 00:00:00', '2022-10-31 23:59:59', 'L3', 22, 'C8');
INSERT INTO Parking_Pass VALUES ('PP4' , '2022-12-01 00:00:00', '2022-12-31 23:59:59', 'L4', 27, 'C9');
INSERT INTO Parking_Pass VALUES ('PP5' , '2022-01-01 00:00:00', '2022-01-31 23:59:59', 'L5', 32, 'C10');

Create View All_Lots AS 
Select  p. Parking_Lot_ID,p. Address, sp.Parking_Space_ID,sp.Parking_Space_Type,sp.Is_Occupied
from Parking_Lot p
INNER JOIN Parking_Space sp
On p.Parking_Lot_ID = sp.Parking_Lot_ID;

Create view CustomerFines AS
Select f.Officer_ID,f. Customer_ID,f. Fine_Type,fc.cost,f. Issue_Date_Time,f. Due_Date from fine f Inner join Fine_Type_Cost fc
ON f. Fine_Type = fc. Fine_Type
INNER JOIN Officer o
ON o.Officer_ID=f.Officer_ID;



create view ParkingpassData as 
Select distinct l.Address ,ps.Customer_ID,p.First_Name,p.Last_Name,ps.Parking_Pass_ID,ps.Issue_Date_Time,ps.Expiry_Date_Time from Pass_Holder p
INNER JOIN Parking_Pass ps
ON p.Customer_ID=ps.Customer_ID
INNER JOIN Parking_Space s
ON  Ps.Parking_Lot_ID =s.Parking_Lot_ID
INNER JOIN Parking_Lot l
ON  l.Parking_Lot_ID =s.Parking_Lot_ID


---USER STORY 1--
SELECT l.Address,ps.Parking_Space_ID,ps.Parking_Space_Type,ps.Parking_Lot_ID,r.Hourly_Rate,r.Monthly_Rate,r.Daily_Rate,ps.Is_Occupied FROM Parking_Space ps
INNER JOIN Rate r
ON ps.Parking_Space_Type = r.Rate_Type
LEFT JOIN Parking_Lot l
on   l.Parking_Lot_ID =ps.Parking_Lot_ID
where ps.Parking_Space_Type ='Medium' AND ps.Is_Occupied = 'FALSE'

--USER STORY 2--
select Email, Phone_Number,First_Name,Last_Name from Pass_Holder ph 
INNER JOIN Parking_Pass pp
ON ph.Customer_ID = pp.Customer_ID
WHERE pp.Expiry_Date_Time = '2022-12-31 23:59:59'

--USER STORY 3--
SELECT l.Address,ps.Parking_Space_ID,ps.Parking_Space_Type,ps.Parking_Lot_ID,r.Monthly_Rate,ps.Is_Occupied FROM Parking_Space ps
INNER JOIN Rate r
ON ps.Parking_Space_Type = r.Rate_Type
LEFT JOIN Parking_Lot l
on   l.Parking_Lot_ID =ps.Parking_Lot_ID
where ps.Parking_Space_Type ='Charging' AND ps.Is_Occupied = 'FALSE' AND Monthly_Rate <='800'


--USER STORY 4--
select e.First_Name, e.Last_Name, e.Employee_ID, e.Hiring_Date, m.Manager_ID, m.Managed_By_ID from Parking_Lot_Employee e
INNER JOIN Manager m
on e.Employee_ID = m.Employee_ID
where Hiring_Date >= '2022-08-10'

--USER STORY 5--
drop FUNCTION if EXISTS f_finetype
GO
CREATE FUNCTION f_finetype (@Fine_Type varchar (50))
RETURNS TABLE
as 
RETURN
(
SELECT f.Fine_Type,sum(fc.Cost) AS AmountCharged from Fine f
INNER JOIN Fine_Type_Cost fc
ON f.Fine_Type = fc.Fine_Type
WHERE
f.Fine_Type = @Fine_type
GROUP BY f.Fine_Type
);
 GO
SELECT * from f_Finetype ('Over Time Limit')