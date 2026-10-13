/*
 Assignment 49 - MySQL 1 
''' Question 2: 
EMPLOYEE MANAGEMENT SYSTEM

Q1. Create a database named company_db and use the database.

Q2. Create a table named employee with:
- employee_id – INT, PRIMARY KEY, AUTO_INCREMENT
- employee_name – VARCHAR(50)
- age – INT
- department – VARCHAR(50)
- designation – VARCHAR(50)
- salary – INT

Q3. Insert the following 10 employee records:

employee_name | age | department | designation | salary
Rahul Sharma | 28 | IT | Developer | 55000
Priya Verma | 26 | HR | Executive | 42000
Amit Singh | 30 | IT | Team Lead | 75000
Neha Patel | 27 | Finance | Accountant | 48000
Rohit Mehta | 32 | IT | Manager | 90000
Sneha Jain | 25 | Marketing | Executive | 40000
Karan Gupta | 29 | IT | Developer | 60000
Pooja Mishra | 31 | HR | Manager | 80000
Ankit Tiwari | 28 | Finance | Analyst | 65000
Riya Kapoor | 27 | Marketing | Manager | 70000

Q4. Display the structure of the employee table using DESC.

Q5. Display all records from the employee table.

*/

-- Q1. Create and use database
CREATE DATABASE company_db;
USE company_db;

-- Q2. Create employee table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    designation VARCHAR(50),
    salary INT
);

-- Q3. Insert 10 employee records
INSERT INTO employee
(employee_name, age, department, designation, salary)
VALUES
('Rahul Sharma', 28, 'IT', 'Developer', 55000),
('Priya Verma', 26, 'HR', 'Executive', 42000),
('Amit Singh', 30, 'IT', 'Team Lead', 75000),
('Neha Patel', 27, 'Finance', 'Accountant', 48000),
('Rohit Mehta', 32, 'IT', 'Manager', 90000),
('Sneha Jain', 25, 'Marketing', 'Executive', 40000),
('Karan Gupta', 29, 'IT', 'Developer', 60000),
('Pooja Mishra', 31, 'HR', 'Manager', 80000),
('Ankit Tiwari', 28, 'Finance', 'Analyst', 65000),
('Riya Kapoor', 27, 'Marketing', 'Manager', 70000);

-- Q4. Display table structure
DESC employee;

-- Q5. Display all records
SELECT * FROM company_db.employee;
