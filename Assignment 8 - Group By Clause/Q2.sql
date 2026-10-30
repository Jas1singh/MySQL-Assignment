# Assignment 8 - Group By Clause 

/*
 Question 2: 
Student Performance Analysis
Use the following students table for the queries.

NOTE: use your friends names in the given table.
Table: students
student_id name class subject marks exam_date
1 John 10 Math 85 2023-02-10
2 Alice 10 Science 78 2023-03-15
3 Bob 9 Math 92 2023-04-20
4 David 9 Science 80 2023-05-25
5 Eve 10 Math 88 2023-06-30
6 Frank 9 Science 75 2023-07-10
7 Grace 10 Math 90 2023-08-20
8 Hank 9 Math 85 2023-09-15
9 Ivy 10 Science 82 2023-10-10
10 Jack 9 Science 79 2023-11-05
Questions
Find the total number of students in each class.
Find the highest marks scored in Math.
Find the average marks in each subject.
Find the total number of students who scored above 80.
Find the number of students who took the exam in each month.
Find the subject where students scored the highest average marks.
Find the student who scored the lowest marks in Science.
Find the number of students in each class who scored more than 85.
Find the average marks for each subject where the average is above 80.
Find the student who scored the highest marks overall.

*/

CREATE TABLE students (student_id INT PRIMARY KEY,name VARCHAR(50),class INT,subject VARCHAR(50),marks INT,exam_date DATE);


INSERT INTO students(student_id, name, class, subject, marks, exam_date)
VALUES
(1, 'Ankit', 10, 'Math', 85, '2023-02-10'),
(2, 'Aayush', 10, 'Science', 78, '2023-03-15'),
(3, 'Chhavi', 9, 'Math', 92, '2023-04-20'),
(4, 'Chetan', 9, 'Science', 80, '2023-05-25'),
(5, 'Jaswant', 10, 'Math', 88, '2023-06-30'),
(6, 'Palak', 9, 'Science', 75, '2023-07-10'),
(7, 'Muskan', 10, 'Math', 90, '2023-08-20'),
(8, 'Mitanshu', 9, 'Math', 85, '2023-09-15'),
(9, 'Abhiraj', 10, 'Science', 82, '2023-10-10'),
(10, 'Aman', 9, 'Science', 79, '2023-11-05');


SELECT * FROM students;

SELECT class, COUNT(*) AS total_students FROM students GROUP BY class;

SELECT MAX(marks) AS highest_marks FROM students WHERE subject = 'Math';


SELECT subject, AVG(marks) AS average_marks FROM students GROUP BY subject;


SELECT COUNT(*) AS total_students FROM students WHERE marks > 80;


SELECT MONTH(exam_date) AS exam_month, COUNT(*) AS total_students FROM students GROUP BY MONTH(exam_date) ORDER BY exam_month;


SELECT subject, AVG(marks) AS average_marks FROM students GROUP BY subject ORDER BY average_marks DESC LIMIT 1;


SELECT name, marks FROM students WHERE subject = 'Science' ORDER BY marks ASC LIMIT 1;


SELECT class, COUNT(*) AS total_students FROM students WHERE marks > 85 GROUP BY class;

SELECT subject, AVG(marks) AS average_marks FROM students GROUP BY subject HAVING AVG(marks) > 80;


SELECT name, subject, marks FROM students ORDER BY marks DESC LIMIT 1;