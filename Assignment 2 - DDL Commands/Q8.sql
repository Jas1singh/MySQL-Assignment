# Assignment 50 - MySQL 2 
/* Question 8: 

Create and Insert into employees Table
Columns:

emp_id INT

emp_name VARCHAR(100)

gender VARCHAR(10)

dob DATE

department VARCHAR(100)

position VARCHAR(100)

salary DECIMAL(8,2)

joining_date DATE

phone VARCHAR(15)

Task:

Insert 5 employee records

*/

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    department VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(8,2),
    joining_date DATE,
    phone VARCHAR(15)
);


INSERT INTO employees
(emp_id, emp_name, gender, dob, department, position,
 salary, joining_date, phone)
VALUES
(101, 'Amit Sharma', 'Male', '1995-04-12',
 'IT', 'Software Developer', 45000.00, '2022-06-15',
 '9876500001'),

(102, 'Priya Jain', 'Female', '1998-08-20',
 'HR', 'HR Executive', 35000.00, '2023-01-10',
 '9876500002'),

(103, 'Vikas Patel', 'Male', '1993-02-05',
 'Finance', 'Accountant', 40000.00, '2021-09-01',
 '9876500003'),

(104, 'Sneha Verma', 'Female', '1997-11-18',
 'Marketing', 'Marketing Manager', 55000.00, '2020-03-12',
 '9876500004'),

(105, 'Rahul Gupta', 'Male', '1996-06-25',
 'Sales', 'Sales Executive', 32000.00, '2024-02-01',
 '9876500005');
 

SELECT * FROM employees;