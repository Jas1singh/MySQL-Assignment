# Assignment 6 - MySQL Constraints 

/*
 Question 1: 

Create a table named `Students` with the following columns and constraints:

| Column Name | Data Type | Constraint |
|---|---|---|
| StudentID | INT | PRIMARY KEY |
| Name | VARCHAR(50) | NOT NULL |
| Age | INT | Must be between 18 and 25 |
| Marks | DECIMAL(5,2) | Must be between 0 and 100 |

**Task:** Insert the following records and observe which insertions succeed or fail.

1. `(101, 'Alice', 20, 85.5)`
2. `(102, 'Bob', 17, 90.0)` — Should fail due to the Age constraint.
3. `(103, 'Charlie', 22, 105.0)` — Should fail due to the Marks constraint.
4. `(104, 'David', 24, 75.0)`

Finally, display all successfully inserted records.


Q2. Patients Table

Create a table named `Patients` with the following columns and constraints:

| Column Name | Data Type | Constraint |
|---|---|---|
| PatientID | INT | PRIMARY KEY |
| PatientName | VARCHAR(50) | NOT NULL |
| Age | INT | Must be between 1 and 100 |
| AdmissionStatus | VARCHAR(15) | Must be 'Admitted' or 'Discharged'; DEFAULT 'Admitted' |
| TreatmentCost | DECIMAL(10,2) | Must be at least 1000 |

**Task:** Insert the following records and verify the constraints.

1. `(201, 'Michael', 25, 'Admitted', 5000)`
2. `(202, 'Linda', 105, 'Admitted', 8000)` — Should fail due to the Age constraint.
3. `(203, 'David', 40, DEFAULT, 1200)` — Should insert 'Admitted' as the default value.
4. `(204, 'Sarah', 30, 'Discharged', 700)` — Should fail due to the TreatmentCost constraint.

Finally, display all successfully inserted records and verify the default value.


Q3. GymMembers Table

Create a table named `GymMembers` with the following columns and constraints:

| Column Name | Data Type | Constraint |
|---|---|---|
| MemberID | INT | PRIMARY KEY |
| MemberName | VARCHAR(50) | NOT NULL |
| MembershipType | VARCHAR(15) | Must be 'Basic', 'Premium', or 'VIP'; DEFAULT 'Basic' |
| MonthlyFee | DECIMAL(6,2) | Must be at least 500 |

**Task:** Insert the following records and verify the constraints.

1. `(501, 'John', 'Premium', 1200)`
2. `(502, 'Emma', 'Gold', 800)` — Should fail due to the MembershipType constraint.
3. `(503, 'Daniel', DEFAULT, 700)` — Should insert 'Basic' as the default value.
4. `(504, 'Sophia', 'VIP', 300)` — Should fail due to the MonthlyFee constraint.

Finally, display all successfully inserted records and verify the default value.

## General Instructions

1. Use `CREATE TABLE` to define each table.
2. Apply the appropriate `PRIMARY KEY`, `NOT NULL`, `CHECK`, and `DEFAULT` constraints.
3. Use `INSERT INTO` to insert the given records.
4. Observe and identify the reason for each failed insertion.
5. Use `SELECT *` to display the successfully inserted records.

**Note:** Use MySQL 8.0.16 or later for enforced `CHECK` constraints. Execute each insertion separately so that one failed query does not prevent you from testing the remaining records.
*/

CREATE DATABASE Mysql_Constraints;

USE Mysql_Constraints;


# Student Table :

CREATE table students (Student_ID int PRIMARY KEY, Name VARCHAR(50) NOT NULL, Age int check(age between 18 and 25), Marks DECIMAL(5,2) NOT NULL check(marks between 0 and 100));


insert into students VALUES(101,'Alice',20,85.5);

insert into students VALUES(102,'Bob',17,90.0,);

insert into students VALUES,(103,'Charlie',22,105.0);

insert into students VALUES(104,'David',24,75.0);


SELECT * FROM students;


# Patients Table :

CREATE TABLE Patients (PatientID INT PRIMARY KEY, PatientName VARCHAR(50) NOT NULL, Age INT CHECK (Age BETWEEN 1 AND 100), AdmissionStatus VARCHAR(15) DEFAULT 'Admitted' CHECK (AdmissionStatus IN ('Admitted', 'Discharged')), TreatmentCost DECIMAL(10,2) CHECK (TreatmentCost >= 1000));


insert into Patients VALUES (201, 'Michael', 25, 'Admitted', 5000);

insert into Patients VALUES (202, 'Linda', 105, 'Admitted', 8000);

insert into Patients VALUES (203, 'David', 40, DEFAULT, 1200);

insert into Patients VALUES (204, 'Sarah', 30, 'Discharged', 700);


SELECT * FROM Patients;



# GymMembers Table :

CREATE TABLE GymMembers (MemberID INT PRIMARY KEY, MemberName VARCHAR(50) NOT NULL, MembershipType VARCHAR(15) DEFAULT 'Basic' CHECK (MembershipType IN ('Basic', 'Premium', 'VIP')), MonthlyFee DECIMAL(6,2) CHECK (MonthlyFee >= 500));


INSERT INTO GymMembers VALUES (501, 'John', 'Premium', 1200);

INSERT INTO GymMembers VALUES (502, 'Emma', 'Gold', 800);

INSERT INTO GymMembers VALUES (503, 'Daniel', DEFAULT, 700);

INSERT INTO GymMembers VALUES (504, 'Sophia', 'VIP', 300);

SELECT * from GymMembers;
