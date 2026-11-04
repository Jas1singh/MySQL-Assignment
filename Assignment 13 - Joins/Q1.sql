# Assignment 13 - Joins 

/*
 Question 1: 

 Understanding INNER JOIN
Problem Statement:
Consider the following tables:
Employees
emp_id emp_name dept_id
1 Alice 101
2 Bob 102
3 Charlie 103
4 David 101

Departments
dept_id  dept_name
101      HR
102     IT
104     Finance

Tasks:

Write a query to display employees and their corresponding department names using INNER JOIN.
Modify the query to display only employees who belong to the "HR" department.


 Question 2:  LEFT JOIN Practice

Using the same Employees and Departments tables, answer the following:
Tasks:
Write a query using LEFT JOIN to display all employees and their department names, including employees with no department.
Modify the query to count how many employees are without a department.



 Question 3:  RIGHT JOIN Practice

Problem Statement:
Consider the same tables.
Tasks:
Write a query using RIGHT JOIN to display all departments and their employees, including departments with no employees.
Find the names of departments that have no employees assigned.
Assignment 4: FULL OUTER JOIN Simulation
Problem Statement:
Since MySQL does not support FULL OUTER JOIN directly, use a combination of LEFT JOIN and RIGHT JOIN to display all employees and departments, ensuring that unmatched records are also included.

*/

create database Joins;

use Joins;

create table employees (emp_id int, emp_name varchar(50), dept_id int);

create table departments (dept_id int, dept_name varchar(50));

insert into employees values (1, 'alice', 101), (2, 'bob', 102), (3, 'charlie', 103), (4, 'david', 101);

insert into departments values (101, 'hr'), (102, 'it'), (104, 'finance');

select employees.emp_id, employees.emp_name, departments.dept_name from employees inner join departments on employees.dept_id = departments.dept_id;

select employees.emp_id, employees.emp_name, departments.dept_name from employees inner join departments on employees.dept_id = departments.dept_id where departments.dept_name = 'hr';

select employees.emp_id, employees.emp_name, departments.dept_name from employees left join departments on employees.dept_id = departments.dept_id;

select count(*) as employees_without_department from employees left join departments on employees.dept_id = departments.dept_id where departments.dept_id is null;

select employees.emp_id, employees.emp_name, departments.dept_name from employees right join departments on employees.dept_id = departments.dept_id;

select departments.dept_name from employees right join departments on employees.dept_id = departments.dept_id where employees.emp_id is null;

select employees.emp_id, employees.emp_name, departments.dept_name from employees left join departments on employees.dept_id = departments.dept_id union select employees.emp_id, employees.emp_name, departments.dept_name from employees right join departments on employees.dept_id = departments.dept_id;