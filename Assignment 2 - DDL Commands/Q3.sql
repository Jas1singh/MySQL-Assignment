# Assignment 50 - MySQL 2

/* Question 3: 

ALTER students Table
Task:

Add a column dob DATE

Rename column phone to mobile_number

Modify column age to SMALLINT

Drop column email

*/


ALTER TABLE students
ADD dob DATE;


ALTER TABLE students
RENAME COLUMN phone TO mobile_number;


ALTER TABLE students
MODIFY COLUMN age SMALLINT;


ALTER TABLE students
DROP COLUMN email;


DESC students;