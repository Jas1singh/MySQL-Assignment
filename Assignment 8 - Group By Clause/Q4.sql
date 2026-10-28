# Assignment 8 - Group By Clause 

/*
 Question 4: 
 NOTE:USE TABLE from QNO 2:Table: Students

Find the average marks in each subject and display only subjects where the average is above 80. (GROUP BY + HAVING)
Find the total number of students in each class and order them by class in descending order. (GROUP BY + ORDER BY)
Find the subject where students scored the highest average marks, displaying only subjects where the average is above 85. (GROUP BY + HAVING + ORDER BY)
Find the student who scored the highest marks overall. (ORDER BY + LIMIT 1)
Find the number of students in each class who scored more than 85, displaying only classes with more than 2 such students. (GROUP BY + HAVING)

*/

SELECT subject, AVG(marks) AS average_marks FROM students GROUP BY subject HAVING AVG(marks) > 80;


SELECT class, COUNT(*) AS total_students FROM students GROUP BY class ORDER BY class DESC;


SELECT subject, AVG(marks) AS average_marks FROM students GROUP BY subject HAVING AVG(marks) > 85 ORDER BY average_marks DESC;


SELECT student_id, name, subject, marks FROM students ORDER BY marks DESC LIMIT 1;


SELECT class, COUNT(*) AS total_students FROM students WHERE marks > 85 GROUP BY class HAVING COUNT(*) > 2;


