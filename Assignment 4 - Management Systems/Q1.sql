# Assignment 4 - Management Systems 

/*
 Question 1: Employee Mangement System

You are developing an Employee Management System for a company.

Create an employees table with the following information:

Employee ID
Employee Name
Department
City
Salary
Experience in years
Age
Joining Date
Sample Data

Insert at least 15 employees with different values.

Your data must include:

At least 4 different departments — IT, HR, Finance, Sales
At least 5 different cities — Indore, Bhopal, Pune, Mumbai, Bangalore
Salaries ranging from ₹30,000 to ₹1,00,000
Experience ranging from 1 to 10 years
Age ranging from 22 to 40 years
Joining dates from 2020 to 2026
Some employees should have the same department
Some employees should have the same city
Some employees should have similar salaries
Include employees who joined in different years





Write SQL queries to find:
=============================

Employees whose salary is greater than ₹60,000.
Employees whose salary is less than ₹50,000.
Employees whose age is greater than 30.
Employees whose experience is greater than or equal to 5 years.
Employees working in IT or Finance.
Employees working in IT, HR, or Sales.
Employees not working in IT or HR.
Employees from Indore or Pune.
Employees who are not from Indore, Mumbai, or Bhopal.
Employees whose salary is between ₹40,000 and ₹70,000.
Employees whose age is between 25 and 35.
Employees whose experience is between 3 and 7 years.
Employees who joined between 2022 and 2025.
Employees who joined before 2023.
Employees who joined after 2024.
Employees from Indore AND working in IT.
Employees working in IT AND having salary greater than ₹70,000.
Employees whose salary is between ₹50,000 and ₹90,000 AND experience is greater than 4 years.
Employees working in IT or Finance AND salary greater than ₹60,000.
Employees whose joining date is between 2021 and 2024 AND salary is greater than ₹50,000.
Employees whose salary is not between ₹40,000 and ₹70,000.
Employees whose department is not IT, HR, or Sales.
Employees whose joining date is not between 2022 and 2025.
Employees from Indore or Pune, whose salary is between ₹45,000 and ₹80,000, and whose experience is more than 3 years.
Employees who did not join between 2020 and 2023 and whose salary is greater than ₹60,000.
Find employees who are from Indore, Pune, or Bangalore, whose salary is between ₹50,000 and ₹90,000, and whose experience is at least 4 years.
Find employees who are not from Bhopal or Mumbai, are not working in HR, and joined between 2021 and 2025.
Find employees working in IT or Finance, whose salary is greater than ₹60,000, whose age is between 25 and 35, and who joined after 2022.
Find employees whose salary is NOT between ₹40,000 and ₹75,000, whose experience is between 2 and 8 years, and who are not working in Sales.
Find employees who are from Indore or Pune, working in IT, Finance, or HR, with salary between ₹45,000 and ₹85,000, and who joined between 2020 and 2024.

*/

CREATE database Employee_Management_System2;

use Employee_Management_System2;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    experience INT,
    age INT,
    joining_date DATE
);

INSERT INTO employees
(employee_id, employee_name, department, city, salary,
 experience, age, joining_date)
VALUES
(1, 'Amit Sharma', 'IT', 'Indore', 75000, 6, 32, '2021-03-15'),
(2, 'Priya Verma', 'HR', 'Bhopal', 45000, 3, 27, '2023-06-10'),
(3, 'Rahul Patil', 'Finance', 'Pune', 65000, 5, 30, '2022-01-20'),
(4, 'Sneha Gupta', 'Sales', 'Mumbai', 40000, 2, 25, '2024-04-12'),
(5, 'Vikas Jain', 'IT', 'Bangalore', 90000, 8, 35, '2020-08-05'),
(6, 'Neha Singh', 'Finance', 'Indore', 55000, 4, 29, '2023-02-18'),
(7, 'Rohit Mehta', 'Sales', 'Pune', 70000, 7, 33, '2021-11-25'),
(8, 'Pooja Mishra', 'HR', 'Mumbai', 35000, 1, 23, '2025-07-01'),
(9, 'Karan Shah', 'IT', 'Bhopal', 80000, 9, 38, '2022-09-14'),
(10, 'Anjali Rao', 'Finance', 'Bangalore', 60000, 5, 31, '2024-01-08'),
(11, 'Deepak Yadav', 'Sales', 'Indore', 48000, 3, 28, '2020-12-11'),
(12, 'Meera Joshi', 'IT', 'Pune', 100000, 10, 40, '2021-05-19'),
(13, 'Suresh Kumar', 'HR', 'Bangalore', 50000, 4, 30, '2026-02-15'),
(14, 'Kavita Desai', 'Finance', 'Mumbai', 68000, 6, 34, '2025-03-22'),
(15, 'Arjun Nair', 'IT', 'Indore', 42000, 2, 24, '2023-10-05');

SELECT * FROM employees;



SELECT * FROM employees WHERE salary > 60000;

SELECT * FROM employees WHERE salary < 50000;

SELECT * FROM employees WHERE age > 30;

SELECT * FROM employees WHERE experience >= 5;

SELECT * FROM employees WHERE department = 'IT' OR department = 'Finance';

SELECT * FROM employees WHERE department IN ('IT', 'HR', 'Sales');


SELECT * FROM employees WHERE department NOT IN ('IT', 'HR');


SELECT * FROM employees WHERE city IN ('Indore', 'Pune');


SELECT * FROM employees WHERE city NOT IN ('Indore', 'Mumbai', 'Bhopal');


SELECT * FROM employees WHERE salary BETWEEN 40000 AND 70000;


SELECT * FROM employees WHERE age BETWEEN 25 AND 35;


SELECT * FROM employees WHERE experience BETWEEN 3 AND 7;


SELECT * FROM employees WHERE joining_date BETWEEN '2022-01-01' AND '2025-12-31';


SELECT * FROM employees WHERE joining_date < '2023-01-01';


SELECT * FROM employees WHERE joining_date >= '2025-01-01';


SELECT * FROM employees WHERE city = 'Indore' AND department = 'IT';


SELECT * FROM employees WHERE department = 'IT' AND salary > 70000;


SELECT * FROM employees WHERE salary BETWEEN 50000 AND 90000 AND experience > 4;


SELECT * FROM employees WHERE (department = 'IT' OR department = 'Finance') AND salary > 60000;


SELECT * FROM employees WHERE joining_date BETWEEN '2021-01-01' AND '2024-12-31' AND salary > 50000;


SELECT * FROM employees WHERE salary NOT BETWEEN 40000 AND 70000;


SELECT * FROM employees WHERE department NOT IN ('IT', 'HR', 'Sales');


SELECT * FROM employees WHERE joining_date NOT BETWEEN '2022-01-01' AND '2025-12-31';


SELECT * FROM employees WHERE city IN ('Indore', 'Pune') AND salary BETWEEN 45000 AND 80000 AND experience > 3;


SELECT * FROM employees WHERE joining_date NOT BETWEEN '2020-01-01' AND '2023-12-31' AND salary > 60000;


SELECT * FROM employees WHERE city IN ('Indore', 'Pune', 'Bangalore') AND salary BETWEEN 50000 AND 90000 AND experience >= 4;


SELECT * FROM employees WHERE city NOT IN ('Bhopal', 'Mumbai') AND department <> 'HR' AND joining_date BETWEEN '2021-01-01' AND '2025-12-31';


SELECT * FROM employees WHERE department IN ('IT', 'Finance') AND salary > 60000 AND age BETWEEN 25 AND 35 AND joining_date >= '2023-01-01';


SELECT * FROM employees WHERE salary NOT BETWEEN 40000 AND 75000 AND experience BETWEEN 2 AND 8 AND department <> 'Sales';
  

SELECT * FROM employees WHERE city IN ('Indore', 'Pune') AND department IN ('IT', 'Finance', 'HR') AND salary BETWEEN 45000 AND 85000 AND joining_date BETWEEN '2020-01-01' AND '2024-12-31';  