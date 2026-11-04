# Assignment 11 - Foreign Key 

/*
 Question 4: 

A university wants to track students' exam results. If a student is deleted, their results should also be deleted.
Tasks:
Create a Students table:
StudentID (PRIMARY KEY, AUTO_INCREMENT)
StudentName (NOT NULL)
Create an Exams table:
ExamID (PRIMARY KEY, AUTO_INCREMENT)
SubjectName (NOT NULL, UNIQUE)
Create a Results table:
ResultID (PRIMARY KEY, AUTO_INCREMENT)
StudentID (FOREIGN key)
ExamID (FOREIGN KEY)
Score (NOT NULL, CHECK Score BETWEEN 0 AND 100)
Insert sample data (at least 3 students, 3 exams, and 5 results).
Delete a student and check if their results are removed automatically.
Update an exam’s subject name and observe the effect.
 
*/


CREATE TABLE Students (StudentID INT PRIMARY KEY AUTO_INCREMENT, StudentName VARCHAR(100) NOT NULL);


CREATE TABLE Exams (ExamID INT PRIMARY KEY AUTO_INCREMENT, SubjectName VARCHAR(100) NOT NULL UNIQUE);


CREATE TABLE Results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ExamID INT,
    Score INT NOT NULL CHECK (Score BETWEEN 0 AND 100),

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
    ON DELETE CASCADE,

    FOREIGN KEY (ExamID)
    REFERENCES Exams(ExamID)
    ON UPDATE CASCADE
);



INSERT INTO Students (StudentName)
VALUES
('Rahul'),
('Amit'),
('Priya');


INSERT INTO Exams (SubjectName)
VALUES
('Mathematics'),
('Science'),
('English');


INSERT INTO Results
(StudentID, ExamID, Score)
VALUES
(1, 1, 85),
(1, 2, 90),
(2, 1, 75),
(2, 3, 80),
(3, 2, 95);


SELECT * FROM Students;


SELECT * FROM Exams;


SELECT * FROM Results;


DELETE FROM Students WHERE StudentID = 1;


SELECT * FROM Results;


UPDATE Exams SET SubjectName = 'Advanced Mathematics' WHERE ExamID = 1;


SELECT * FROM Exams;