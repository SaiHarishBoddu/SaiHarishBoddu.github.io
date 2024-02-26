DROP TABLE CT_Train;
DROP TABLE CT_Bus;
DROP TABLE Digital_Wallet;
DROP TABLE CT_digital_card;
DROP TABLE Enrolled_Student_Mailing_Address;
DROP TABLE Student_CT_Pass_Registration;
DROP TABLE UConn_enrolled_student;

CREATE TABLE UConn_enrolled_student (
    Net_ID VARCHAR(10) PRIMARY KEY,
    Student_ID INT,
    Enrolled_Date DATE,
    First_Name VARCHAR(15),
    Last_Name VARCHAR(15)
);

CREATE TABLE Student_CT_Pass_Registration (
    Registration_ID INT PRIMARY KEY,
    Semester INT,
    Status VARCHAR(15),
    Campus VARCHAR(15),
    Net_ID VARCHAR(10),
    FOREIGN KEY (Net_ID) REFERENCES UConn_enrolled_student(Net_ID)
);


CREATE TABLE CT_digital_card (
    QR_code VARCHAR(30) PRIMARY KEY,
    Net_ID VARCHAR(10),
    Last_Transaction_Date DATE,
    Pass_ID INT,
    FOREIGN KEY (Net_ID) REFERENCES UConn_enrolled_student(Net_ID)
);

CREATE TABLE Digital_Wallet (
    Wallet_ID VARCHAR(25) PRIMARY KEY,
    CT_digital_card_number VARCHAR(20),
    Credit_Card_1 INT,
    Debit_Card_1 INT,
    Credit_Card_2 INT,
    QR_Code VARCHAR(30),
    FOREIGN KEY (QR_Code) REFERENCES CT_digital_card(QR_code)
);

CREATE TABLE Enrolled_Student_Mailing_Address (
    Address_ID INT PRIMARY KEY,
    Net_ID VARCHAR(10),
    City_Name VARCHAR(15),
    Zip_Code INT,
    State VARCHAR(25),
    Address_Line_1 VARCHAR(30),
    Address_Line_2 VARCHAR(30),
    FOREIGN KEY (Net_ID) REFERENCES UConn_enrolled_student(Net_ID)
);

CREATE TABLE CT_Bus (
    Bus_No VARCHAR(20) PRIMARY KEY,
    Bus_Line VARCHAR(25),
    Route_No VARCHAR(10),
    QR_Code VARCHAR(30),
    FOREIGN KEY (QR_Code) REFERENCES CT_digital_card(QR_code)
);

CREATE TABLE CT_Train (
    Train_No INT PRIMARY KEY,
    Train_Line VARCHAR(25),
    Track_No INT,
    QR_Code VARCHAR(30),
    FOREIGN KEY (QR_Code) REFERENCES CT_digital_card(QR_code)
);
SHOW TABLES;


INSERT INTO UConn_enrolled_student (Net_ID, Student_ID, Enrolled_Date, First_Name, Last_Name)
VALUES 
('Emj00001', 745312, '2022-05-17', 'Emma', 'Johnson'),
('Lsm00002', 821409, '2021-09-28', 'Liam', 'Smith'),
('Olb00003', 693857, '2023-02-11', 'Olivia', 'Brown'),
('Nod00004', 980145, '2022-11-03', 'Noah', 'Davis'),
('Avm00005', 285763, '2021-12-22', 'Ava', 'Martinez'),
('Isw00006', 135729, '2022-08-07', 'Isabella', 'Wilson'),
('Saa00007', 650384, '2023-01-15', 'Sophia', 'Anderson'),
('Mta00008', 893725, '2021-10-09', 'Mia', 'Taylor'),
('Cgg00009', 426518, '2022-06-30', 'Charlotte', 'Garcia'),
('Aro00010', 579314, '2022-04-18', 'Amelia', 'Rodriguez'),
('Hrm00011', 791634, '2021-08-03', 'Harper', 'Martinez'),
('Ehe00012', 642189, '2022-10-25', 'Evelyn', 'Hernandez'),
('Ago00013', 284901, '2023-03-19', 'Abigail', 'Gonzalez'),
('Eda00014', 508376, '2021-07-12', 'Emily', 'Davis'),
('Ewi00015', 937415, '2022-09-14', 'Elizabeth', 'Wilson'),
('Ssm00016', 264738, '2022-01-28', 'Sofia', 'Smith'),
('Ajo00017', 730951, '2023-02-28', 'Avery', 'Johnson'),
('Elj00018', 621903, '2022-03-08', 'Ella', 'Jones'),
('Sta00019', 479365, '2023-03-30', 'Scarlett', 'Taylor'),
('Gbr00020', 186735, '2021-11-16', 'Grace', 'Brown');


INSERT INTO Student_CT_Pass_Registration (Registration_ID, Semester, Status, Campus, Net_ID)
VALUES 
(1001, 1, 'Active', 'Storrs', 'Emj00001'),
(1002, 2, 'Active', 'Stamford', 'Lsm00002'),
(1003, 1, 'Active', 'Waterbury', 'Olb00003'),
(1004, 2, 'Inactive', 'Avery Point', 'Nod00004'),
(1005, 1, 'Active', 'Hartford', 'Avm00005'),
(1006, 2, 'Active', 'Waterbury', 'Isw00006'),
(1007, 1, 'Active', 'Storrs', 'Saa00007'),
(1008, 2, 'Active', 'Stamford', 'Mta00008'),
(1009, 1, 'Inactive', 'Waterbury', 'Cgg00009'),
(1010, 2, 'Active', 'Hartford', 'Aro00010'),
(1011, 1, 'Active', 'Storrs', 'Hrm00011'),
(1012, 2, 'Active', 'Stamford', 'Ehe00012'),
(1013, 1, 'Active', 'Waterbury', 'Ago00013'),
(1014, 2, 'Active', 'Avery Point', 'Eda00014'),
(1015, 1, 'Active', 'Hartford', 'Ewi00015'),
(1016, 2, 'Active', 'Storrs', 'Ssm00016'),
(1017, 1, 'Active', 'Stamford', 'Ajo00017'),
(1018, 2, 'Inactive', 'Waterbury', 'Elj00018'),
(1019, 1, 'Active', 'Hartford', 'Sta00019'),
(1020, 2, 'Active', 'Avery Point', 'Gbr00020');


SELECT * from CT_digital_card;

INSERT INTO CT_digital_card (QR_code, Net_ID, Last_Transaction_Date, Pass_ID)
VALUES 
('QR111111', 'Emj00001', '2023-10-05', 1234),
('QR222222', 'Lsm00002', '2023-09-15', 2345),
('QR333333', 'Olb00003', '2023-08-25', 3456),
('QR444444', 'Nod00004', '2023-07-05', 4567),
('QR555555', 'Avm00005', '2023-06-15', 5678),
('QR666666', 'Isw00006', '2023-05-25', 6789),
('QR777777', 'Saa00007', '2023-04-05', 7890),
('QR888888', 'Mta00008', '2023-03-15', 8901),
('QR999999', 'Cgg00009', '2023-02-25', 9012),
('QR101010', 'Aro00010', '2023-02-05', 0123),
('QR202020', 'Hrm00011', '2023-01-15', 1234),
('QR303030', 'Ehe00012', '2022-12-25', 2345),
('QR404040', 'Ago00013', '2022-12-05', 3456),
('QR505050', 'Eda00014', '2022-11-15', 4567),
('QR606060', 'Ewi00015', '2022-10-25', 5678),
('QR707070', 'Ssm00016', '2022-10-05', 6789),
('QR808080', 'Ajo00017', '2022-09-15', 7890),
('QR909090', 'Elj00018', '2022-08-25', 8901),
('QR010101', 'Sta00019', '2022-08-05', 9012),
('QR111211', 'Gbr00020', '2022-07-15', 0123);

INSERT INTO Digital_Wallet (Wallet_ID, CT_digital_card_number, Credit_Card_1, Debit_Card_1, Credit_Card_2, QR_Code)
VALUES 
('W001', 'DCN111111', 1111, 2222, 3333, 'QR111111'),
('W002', 'DCN222222', 2222, 3333, 4444, 'QR222222'),
('W003', 'DCN333333', 3333, 4444, 5555, 'QR333333'),
('W004', 'DCN444444', 4444, 5555, 6666, 'QR444444'),
('W005', 'DCN555555', 5555, 6666, 7777, 'QR555555'),
('W006', 'DCN666666', 6666, 7777, 8888, 'QR666666'),
('W007', 'DCN777777', 7777, 8888, 9999, 'QR777777'),
('W008', 'DCN888888', 8888, 9999, 1010, 'QR888888'),
('W009', 'DCN999999', 9999, 1010, 1111, 'QR999999'),
('W010', 'DCN101010', 1010, 1111, 1212, 'QR101010'),
('W011', 'DCN202020', 1111, 1212, 1313, 'QR202020'),
('W012', 'DCN303030', 1212, 1313, 1414, 'QR303030'),
('W013', 'DCN404040', 1313, 1414, 1515, 'QR404040'),
('W014', 'DCN505050', 1414, 1515, 1616, 'QR505050'),
('W015', 'DCN606060', 1515, 1616, 1717, 'QR606060'),
('W016', 'DCN707070', 1616, 1717, 1818, 'QR707070'),
('W017', 'DCN808080', 1717, 1818, 1919, 'QR808080'),
('W018', 'DCN909090', 1818, 1919, 2020, 'QR909090'),
('W019', 'DCN010101', 1919, 2020, 2121, 'QR010101'),
('W020', 'DCN111211', 2020, 2121, 2222, 'QR111211');

INSERT INTO Enrolled_Student_Mailing_Address (Address_ID, Net_ID, City_Name, Zip_Code, State, Address_Line_1, Address_Line_2)
VALUES 
(2001, 'Emj00001', 'Storrs', 06269, 'Connecticut', '123 University Ave', 'Apt 101'),
(2002, 'Lsm00002', 'Stamford', 06901, 'Connecticut', '456 Main St', 'Suite 202'),
(2003, 'Olb00003', 'Waterbury', 06702, 'Connecticut', '789 Oak Rd', 'Unit B'),
(2004, 'Nod00004', 'Avery Point', 06330, 'Connecticut', '101 Pine Ln', 'Apt C'),
(2005, 'Avm00005', 'Hartford', 06101, 'Connecticut', '202 Elm St', 'Unit 303'),
(2006, 'Isw00006', 'Waterbury', 06702, 'Connecticut', '303 Maple Ave', 'Apt 404'),
(2007, 'Saa00007', 'Storrs', 06269, 'Connecticut', '404 Birch Dr', 'Unit D'),
(2008, 'Mta00008', 'Stamford', 06901, 'Connecticut', '505 Cedar Blvd', 'Suite 505'),
(2009, 'Cgg00009', 'Waterbury', 06702, 'Connecticut', '606 Pine Ln', 'Apt E'),
(2010, 'Aro00010', 'Hartford', 06101, 'Connecticut', '707 Oak Rd', 'Unit F'),
(2011, 'Hrm00011', 'Storrs', 06269, 'Connecticut', '808 Elm St', 'Apt 707'),
(2012, 'Ehe00012', 'Stamford', 06901, 'Connecticut', '909 Maple Ave', 'Suite 606'),
(2013, 'Ago00013', 'Waterbury', 06702, 'Connecticut', '1010 Pine Ln', 'Unit G'),
(2014, 'Eda00014', 'Avery Point', 06330, 'Connecticut', '1111 University Ave', 'Apt 505'),
(2015, 'Ewi00015', 'Hartford', 06101, 'Connecticut', '1212 Main St', 'Unit 404'),
(2016, 'Ssm00016', 'Waterbury', 06702, 'Connecticut', '1313 Oak Rd', 'Apt 303'),
(2017, 'Ajo00017', 'Storrs', 06269, 'Connecticut', '1414 Pine Ln', 'Unit 202'),
(2018, 'Elj00018', 'Stamford', 06901, 'Connecticut', '1515 Cedar Blvd', 'Suite 303'),
(2019, 'Sta00019', 'Waterbury', 06702, 'Connecticut', '1616 Birch Dr', 'Apt 101'),
(2020, 'Gbr00020', 'Hartford', 06101, 'Connecticut', '1717 Maple Ave', 'Unit 101');


INSERT INTO CT_Bus (Bus_No, Bus_Line, Route_No, QR_Code)
VALUES 
('B001', 'Peter Pan', 'Route A', 'QR111111'),
('B002', 'CT Fastrack', 'Route B', 'QR222222'),
('B003', 'CT Transit', 'Route C', 'QR333333'),
('B004', 'Peter Pan', 'Route D', 'QR444444'),
('B005', 'CT Fastrack', 'Route E', 'QR555555'),
('B006', 'CT Transit', 'Route F', 'QR666666'),
('B007', 'Waterbury express', 'Route G', 'QR777777'),
('B008', 'CT Fastrack', 'Route H', 'QR888888'),
('B009', 'CT Transit', 'Route I', 'QR999999'),
('B010', 'Peter Pan', 'Route J', 'QR101010'),
('B011', 'Grey Hound CT', 'Route K', 'QR202020'),
('B012', 'CT Transit', 'Route L', 'QR303030'),
('B013', 'Peter Pan', 'Route M', 'QR404040'),
('B014', 'CT Fastrack', 'Route N', 'QR505050'),
('B015', 'Hartford express', 'Route O', 'QR606060'),
('B016', 'Peter Pan', 'Route P', 'QR707070'),
('B017', 'CT Fastrack', 'Route Q', 'QR808080'),
('B018', 'New Hampshire express', 'Route R', 'QR909090'),
('B019', 'Peter Pan', 'Route S', 'QR010101'),
('B020', 'CT Fastrack', 'Route T', 'QR111211');

SELECT * FROM CT_Bus;

INSERT INTO CT_Train (Train_No, Train_Line, Track_No, QR_Code)
VALUES 
(3001, 'Hartford Express', 1, 'QR111111'),
(3002, 'New Haven Line', 2, 'QR222222'),
(3003, 'Shore Line East', 3, 'QR333333'),
(3004, 'CT Rail Hartford Line', 4, 'QR444444'),
(3005, 'Waterbury Express', 1, 'QR555555'),
(3006, 'Hartford Shuttle', 2, 'QR666666'),
(3007, 'CT Rail Hartford Line', 3, 'QR777777'),
(3008, 'Shore Line East', 4, 'QR888888'),
(3009, 'Waterbury Metro', 1, 'QR999999'),
(3010, 'New Haven Line', 2, 'QR101010'),
(3011, 'Shore Line East', 3, 'QR202020'),
(3012, 'Avery Point Express', 4, 'QR303030'),
(3013, 'Stamford Metro', 1, 'QR404040'),
(3014, 'New Haven Line', 2, 'QR505050'),
(3015, 'Hartford Metro', 3, 'QR606060'),
(3016, 'Shore Line East', 4, 'QR707070'),
(3017, 'New Haven Line', 1, 'QR808080'),
(3018, 'New Haven Line', 2, 'QR909090'),
(3019, 'Waterbury Transit', 3, 'QR010101'),
(3020, 'Hartford Connector', 4, 'QR111211');

SELECT * FROM CT_Train;

SELECT *from Enrolled_Student_Mailing_Address esma 



   

   

-- Report 1 final Student Enrollment Status

SELECT s.First_Name, s.Last_Name,
CASE
 WHEN sp.Status = 'Active' THEN 'Active'
 ELSE 'Inactive'
 END AS Enrollment_Status
FROM UConn_enrolled_student s
JOIN Student_CT_Pass_Registration sp ON s.Net_ID = sp.Net_ID;

-- Report 2 final
SELECT
COUNT(DISTINCT Wallet_ID) AS Total_Wallets,
AVG(Credit_Card_Count) AS Average_Credit_Cards
FROM (
SELECT Wallet_ID, 
(
CASE 
 WHEN Credit_Card_1 IS NOT NULL THEN 1 ELSE 0 END +
 CASE 
 WHEN Credit_Card_2 IS NOT NULL THEN 1 ELSE 0 END
) 
AS Credit_Card_Count FROM Digital_Wallet
) AS CardCounts;

-- Report 3 final Average Transaction Count Per Student

SELECT d.Net_ID, COUNT(d.QR_code) AS TransactionCount
FROM CT_digital_card d
GROUP BY d.Net_ID

-- Report 4 Final Student Card Usage Details 

SELECT s.First_Name, s.Last_Name, d.QR_code, d.Last_Transaction_Date
FROM UConn_enrolled_student s
JOIN CT_digital_card d ON s.Net_ID = d.Net_ID
ORDER BY d.Last_Transaction_Date DESC;

--  Report 5 Final Train Usage Statistic
SELECT t.Train_Line, COUNT(t.QR_Code) AS CardCount
FROM CT_Train t
GROUP BY t.Train_Line;

-- backup report Students enrolled and active before 2022

SELECT U.First_Name, U.Last_Name, U.Enrolled_Date, U.Net_ID, P.Status
FROM UConn_enrolled_student U
JOIN Student_CT_Pass_Registration P ON U.Net_ID = P.Net_ID
WHERE YEAR(U.Enrolled_Date) < 2022 AND P.Status = 'Active';















