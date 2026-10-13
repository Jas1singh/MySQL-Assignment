# Assignment 50 - MySQL 2 

/* Question 1: 

Create and Populate students Table
Columns:

id INT

name VARCHAR(100)

age INT

gender VARCHAR(10)

address VARCHAR(150)

phone VARCHAR(15)

email VARCHAR(100)

Task:

Insert 5 different student records with dummy data.

*/

CREATE TABLE students (
    id INT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(150),
    phone VARCHAR(15),
    email VARCHAR(100)
);


INSERT INTO students
(id, name, age, gender, address, phone, email)
VALUES
(1, 'Rahul Sharma', 20, 'Male', 'Indore, MP',
 '9876543210', 'rahul@gmail.com'),
(2, 'Priya Verma', 21, 'Female', 'Bhopal, MP',
 '9876543211', 'priya@gmail.com'),
(3, 'Amit Patel', 22, 'Male', 'Ujjain, MP',
 '9876543212', 'amit@gmail.com'),
(4, 'Neha Singh', 19, 'Female', 'Dewas, MP',
 '9876543213', 'neha@gmail.com'),
(5, 'Rohan Gupta', 23, 'Male', 'Indore, MP',
 '9876543214', 'rohan@gmail.com');
 

SELECT * FROM students;
