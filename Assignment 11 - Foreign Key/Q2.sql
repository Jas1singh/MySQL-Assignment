# Assignment 11 - Foreign Key 

/*
 Question 2: 
A hospital wants to store patient records and their assigned doctors. If a doctor leaves, all related patient records should be deleted.

Tasks:
Create a Doctors table:

DoctorID (PRIMARY KEY, AUTO_INCREMENT)
DoctorName (NOT NULL)
Specialization (NOT NULL, UNIQUE)
Create a Patients table:

PatientID (PRIMARY KEY, AUTO_INCREMENT)
PatientName (NOT NULL)
DoctorID (FOREIGN KEY)
Insert sample data (at least 3 doctors and 5 patients).

Delete a doctor and check if related patients are removed automatically.

Update a patient’s doctor to a new doctor.

*/

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(100) NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (DoctorID)
    REFERENCES Doctors(DoctorID)
    ON DELETE CASCADE
);


INSERT INTO Doctors
(DoctorName, Specialization)
VALUES
('Dr. Sharma', 'Cardiology'),
('Dr. Verma', 'Neurology'),
('Dr. Patel', 'Orthopedics');


INSERT INTO Patients (PatientName, DoctorID)
VALUES
('Aman', 1),
('Riya', 1),
('Karan', 2),
('Pooja', 3),
('Sahil', 2);


SELECT * FROM Patients;

SELECT * FROM Doctors;

UPDATE Patients SET DoctorID = 3 WHERE PatientID = 1;


DELETE FROM Doctors WHERE DoctorID = 1;


SELECT * FROM Patients;