# Assignment 8 - Group By Clause 

/*
 Question 1: 
Employee Salary Analysis
Use the following employees table to solve the questions below.

NOTE:-use your friends names in the given table.
Table: employees

id name department job_role salary hire_date
1 Alice HR       Manager       6000.00 2022-01-15
2 Bob HR Recruiter 4000.00 2023-03-20
3 Charlie IT Developer 5000.00 2022-07-25
4 David IT Developer 5500.00 2021-12-05
5 Eve IT Tester 4500.00 2023-06-10
6 Frank IT Tester 4800.00 2023-09-12
7 Grace Finance Analyst 5200.00 2021-11-18
8 Hank Finance Analyst 5300.00 2022-04-30
9 Ivy Finance Manager 7000.00 2023-08-14
10 Jack HR Recruiter 4200.00 2022-10-05

Questions:

Find the total number of employees in each department.
Find the average salary of employees in each job role.
Find the highest salary in the IT department.
Find the lowest salary among all employees.
Count the number of employees who joined after January 1, 2023.
Find the total salary paid in each department.
Find the job role that has the highest total salary payout.
Find the average salary of employees who joined after 2022.
Find departments where the total salary exceeds 10,000.
Find the department with the highest number of employees.

*/
CREATE DATABASE Group_By;

use Group_By;


CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


INSERT INTO employees (id, name, department, job_role, salary, hire_date)
VALUES
(1, 'Ankit', 'HR', 'Manager', 6000.00, '2022-01-15'),
(2, 'Chhavi', 'HR', 'Recruiter', 4000.00, '2023-03-20'),
(3, 'Chetan', 'IT', 'Developer', 5000.00, '2022-07-25'),
(4, 'Jaswant', 'IT', 'Developer', 5500.00, '2021-12-05'),
(5, 'Gopal', 'IT', 'Tester', 4500.00, '2023-06-10'),
(6, 'Aayush', 'IT', 'Tester', 4800.00, '2023-09-12'),
(7, 'Palak', 'Finance', 'Analyst', 5200.00, '2021-11-18'),
(8, 'Muskan', 'Finance', 'Analyst', 5300.00, '2022-04-30'),
(9, 'Mona', 'Finance', 'Manager', 7000.00, '2023-08-14'),
(10, 'Priya', 'HR', 'Recruiter', 4200.00, '2022-10-05');


SELECT * FROM employees;

SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department;


SELECT job_role, AVG(salary) AS average_salary FROM employees GROUP BY job_role;



SELECT MAX(salary) AS highest_salary FROM employees WHERE department = 'IT';


SELECT MIN(salary) AS lowest_salary FROM employees;


SELECT COUNT(*) AS total_employees FROM employees WHERE hire_date > '2023-01-01';


SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;


SELECT job_role, SUM(salary) AS total_salary FROM employees GROUP BY job_role ORDER BY total_salary DESC LIMIT 1;


SELECT AVG(salary) AS average_salary FROM employees WHERE hire_date >= '2023-01-01';


SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department HAVING SUM(salary) > 10000;


SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department ORDER BY total_employees DESC LIMIT 1;