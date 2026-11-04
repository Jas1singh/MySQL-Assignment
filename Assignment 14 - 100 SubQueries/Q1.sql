# Assignment 14 - 100 SubQueries 

/*
 Question 1: 

============================================================
          MYSQL SUBQUERY –  ASSIGNMENT
============================================================

CASE STUDY: EMPLOYEE MANAGEMENT SYSTEM

ABC Technologies wants to develop an Employee Management System.
The company wants to perform different salary, department and
employee analysis using MySQL Subqueries.

You are given the following tables and data.


============================================================
TABLE 1: DEPARTMENT
============================================================

Table Name: department

Structure:

Column Name     Data Type          Description
------------------------------------------------------------
dept_id         INT                Department ID
dept_name       VARCHAR(30)        Department Name
location        VARCHAR(30)        Department Location


Data:

dept_id    dept_name       location
------------------------------------------------
1          HR              Indore
2          IT              Pune
3          Finance         Mumbai
4          Sales           Indore
5          Admin           Delhi
6          Research        Bangalore


============================================================
TABLE 2: EMPLOYEE
============================================================

Table Name: employee

Structure:

Column Name     Data Type          Description
------------------------------------------------------------
emp_id          INT                Employee ID
emp_name        VARCHAR(30)        Employee Name
salary          DECIMAL(10,2)      Employee Salary
dept_id         INT                Department ID


Data:

emp_id    emp_name     salary       dept_id
------------------------------------------------
101       Amit         30000        1
102       Rahul        50000        2
103       Priya        40000        2
104       Neha         60000        3
105       Rohit        35000        3
106       Sneha        45000        4
107       Karan        55000        4
108       Pooja        28000        1
109       Vijay        70000        2
110       Ankit        32000        5
111       Meena        65000        3
112       Arjun        25000        5


NOTE:
Department 6 currently has no employees.


============================================================
QUESTIONS
============================================================


Q1.
Display all employees whose salary is greater than the average
salary of all employees.


Q2.
Display the employee or employees who receive the highest salary
in the company.


Q3.
Display the employee or employees who receive the lowest salary
in the company.


Q4.
Display all employees whose salary is greater than the salary
of Amit.


Q5.
Display all employees whose salary is less than the salary
of Rahul.


Q6.
Display employees who work in departments located in Indore.

Expected columns:

emp_id
emp_name
salary
dept_id


Q7.
Display employees who work in the IT or Finance departments.

Do not directly specify department IDs such as 2,3.
Obtain the department IDs using a subquery.


Q8.
Display employees who do not work in departments located in
Indore.


Q9.
Display departments that currently have no employees.


Q10.
Display employees whose salary is greater than the average salary
of the IT department.


Q11.
Display employees whose salary is greater than the average salary
of the Finance department.


Q12.
Display employees whose salary is equal to the highest salary
in the IT department.


Q13.
Display employees whose salary is less than the lowest salary
in the Sales department.


Q14.
Display employees whose salary is greater than at least one
employee working in the HR department.


Q15.
Display employees whose salary is greater than every employee
working in the HR department.


Q16.
Display employees whose salary is less than at least one
employee working in the IT department.


Q17.
Display employees whose salary is greater than every employee
working in the Finance department.


Q18.
Display employees whose salary is below the salary of every
employee working in the IT department.


Q19.
Display employees whose salary is greater than their own
department's average salary.


Q20.
Display employees whose salary is less than their own
department's average salary.


Q21.
Display employees whose salary is exactly equal to their own
department's average salary.


Q22.
Display the employee or employees who receive the highest salary
in each department.

Expected columns:

emp_id
emp_name
salary
dept_id


Q23.
Display the employee or employees who receive the lowest salary
in each department.


Q24.
Display employees who are not the highest-paid employees of
their respective departments.


Q25.
Display employees who are not the lowest-paid employees of
their respective departments.


Q26.
Display the second-highest salary in the company.

Do not use LIMIT.


Q27.
Display the employee or employees having the second-highest
salary.

Do not use LIMIT.


Q28.
Display the third-highest salary in the company.

Do not use LIMIT.


Q29.
Display the employee or employees having the third-highest
salary.


Q30.
Display all departments for which at least one employee exists.


Q31.
Display all departments for which no employee exists.


Q32.
Display departments where at least one employee earns more
than 60000.


Q33.
Display departments where no employee earns more than 60000.


Q34.
Display departments where at least one employee earns less
than 30000.


Q35.
Display departments where no employee earns less than 30000.


Q36.
Display employees who belong to a department that exists in
the department table.


Q37.
Display employees whose salary is greater than their own
department's average salary.

Use a correlated subquery.


Q38.
Display employees whose salary is the maximum salary of their
department.

Use a correlated subquery.


Q39.
Display employees whose salary is the minimum salary of their
department.

Use a correlated subquery.


Q40.
Display each employee along with the average salary of his/her
department.

Expected columns:

emp_id
emp_name
salary
dept_id
department_average_salary


Q41.
Display each employee along with the highest salary in his/her
department.

Expected columns:

emp_id
emp_name
salary
dept_id
department_highest_salary


Q42.
Display each employee along with the lowest salary in his/her
department.

Expected columns:

emp_id
emp_name
salary
dept_id
department_lowest_salary


Q43.
Display each employee along with the company's overall average
salary.

Expected columns:

emp_id
emp_name
salary
company_average_salary


Q44.
Display each employee along with the difference between his/her
salary and the company's average salary.

Expected columns:

emp_id
emp_name
salary
salary_difference


Q45.
Display each employee along with the name of his/her department.

The department name must be obtained using a subquery.

Expected columns:

emp_id
emp_name
salary
dept_name


Q46.
Display departments whose average salary is greater than the
average salary of the entire company.


Q47.
Display departments whose average salary is less than the
average salary of the entire company.


Q48.
Display the department having the highest average salary.


Q49.
Display the department having the lowest average salary.


Q50.
Display employees who work in the department having the
highest average salary.


Q51.
Display employees who work in the department having the
lowest average salary.


Q52.
Display departments having more employees than the average
number of employees per department.


Q53.
Display departments where every employee earns more than 30000.


Q54.
Display departments where at least one employee earns more
than 50000 and at least one employee earns less than 35000.


Q55.
Display departments where every employee earns less than 70000.


Q56.
Display employees whose salary is greater than the average of
all department average salaries.


Q57.
Display the department whose maximum employee salary is the
highest among all departments.


Q58.
Display the department whose minimum employee salary is the
lowest among all departments.


Q59.
Display employees whose salary is greater than the maximum
salary of the HR department.


Q60.
Display employees whose salary is less than the minimum salary
of the Finance department.


Q61.
Display employees whose salary is greater than every employee
in HR but less than the salary of at least one employee in IT.


Q62.
Display employees whose salary is greater than at least one
employee in Finance but less than every employee in IT.


Q63.
Display employees who work in departments where the department's
average salary is greater than 40000.


Q64.
Display departments where the average salary is greater than
40000 and at least one employee earns more than 60000.


Q65.
Display employees whose salary is greater than their department
average salary but less than the company's overall average salary.


Q66.
Display employees whose salary is less than their department
average salary but greater than the company's overall average
salary.


Q67.
Display the highest-paid employee from each department without
using GROUP BY to directly select the employee.


Q68.
Display the second-highest salary employee from each department.


Q69.
Display departments that have at least two employees.


Q70.
Display employees working in departments that have more employees
than the HR department.


Q71.
Display employees working in departments that have fewer employees
than the IT department.


Q72.
Display the department(s) having the same average salary as the
Finance department.


Q73.
Display employees whose salary is equal to the highest salary
of any department other than their own department.


Q74.
Display employees whose salary is greater than the average salary
of every department.


Q75.
Display employees whose salary is greater than the average salary
of at least one department.


Q76.
Display the employee whose salary is closest to the company's
average salary.


Q77.
Display the department whose average salary is closest to the
company's overall average salary.


Q78.
Display employees who are earning more than the average salary
of all employees but are not the highest-paid employee.


Q79.
Display employees who earn more than the average salary of their
department and whose department has at least two employees.


Q80.
Find employees who satisfy ALL of the following conditions:

1. Salary is greater than the company average salary.
2. Salary is greater than their department average salary.
3. Their department has at least two employees.
4. They are not the highest-paid employee in the company.


============================================================
CHALLENGE QUESTIONS
============================================================


Q81.
Find the department having the second-highest average salary.


Q82.
Find the employee working in the department having the
second-highest average salary.


Q83.
Find the second-highest salary employee from every department.


Q84.
Find the department having the second-highest maximum salary.


Q85.
Find employees whose salary is greater than the average salary
of the department having the second-highest average salary.


Q86.
Find the employee(s) whose salary is closest to the highest
salary in the company without being the highest-paid employee.


Q87.
Find departments where the difference between the highest and
lowest salary is greater than 30000.


Q88.
Find employees whose salary is above their department average
and whose salary difference from the department average is
greater than 10000.


Q89.
Find the department(s) where the highest-paid employee earns
more than the highest-paid employee of the HR department.


Q90.
Find employees who earn more than every employee in HR,
Finance, and Sales.


============================================================
FINAL INTERVIEW CHALLENGE
============================================================


Q91.
Without using:

JOIN
LIMIT
WINDOW FUNCTIONS

Find the employee having the third-highest distinct salary.


Q92.
Without using LIMIT or Window Functions, find the employee
having the second-highest salary in each department.


Q93.
Find the department(s) in which every employee earns more than
the company's average salary.


Q94.
Find the department(s) in which at least one employee earns more
than the company's average salary and at least one employee earns
less than the company's average salary.


Q95.
Find employees whose salary satisfies all the following:

1. Greater than their department average.
2. Greater than the company average.
3. Less than the highest salary in the company.


Q96.
Find the department having the highest average salary and then
display all employees belonging to that department along with
their salary.


Q97.
Find the department having the lowest average salary and then
display all employees belonging to that department.


Q98.
Find the department with the highest number of employees and
display all employees belonging to that department.


Q99.
Find the department with the lowest number of employees,
excluding departments having zero employees, and display its
employees.


Q100.
Find employees who satisfy ALL of the following conditions:

1. Salary is above their department average.
2. Salary is above the company average.
3. Employee is not the highest-paid employee of the department.
4. Employee works in a department having at least 2 employees.

Display:

emp_id
emp_name
salary
dept_id


============================================================
*/


CREATE DATABASE Sub_Query;

USE Sub_Query;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    location VARCHAR(30)
);

INSERT INTO department
(dept_id, dept_name, location)
VALUES
(1, 'HR', 'Indore'),
(2, 'IT', 'Pune'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Indore'),
(5, 'Admin', 'Delhi'),
(6, 'Research', 'Bangalore');


CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


INSERT INTO employee
(emp_id, emp_name, salary, dept_id)
VALUES
(101, 'Amit', 30000, 1),
(102, 'Rahul', 50000, 2),
(103, 'Priya', 40000, 2),
(104, 'Neha', 60000, 3),
(105, 'Rohit', 35000, 3),
(106, 'Sneha', 45000, 4),
(107, 'Karan', 55000, 4),
(108, 'Pooja', 28000, 1),
(109, 'Vijay', 70000, 2),
(110, 'Ankit', 32000, 5),
(111, 'Meena', 65000, 3),
(112, 'Arjun', 25000, 5);


SELECT * FROM department;

SELECT * FROM employee;


-- Q1. Employees whose salary is greater than company average salary
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);


-- Q2. Employee(s) receiving the highest salary
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee);


-- Q3. Employee(s) receiving the lowest salary
SELECT * FROM employee WHERE salary = (SELECT MIN(salary) FROM employee);


-- Q4. Employees earning more than Amit
SELECT * FROM employee WHERE salary > (SELECT salary FROM employee WHERE emp_name = 'Amit');


-- Q5. Employees earning less than Rahul
SELECT * FROM employee WHERE salary < (SELECT salary FROM employee WHERE emp_name = 'Rahul');


-- Q6. Employees working in departments located in Indore
SELECT emp_id, emp_name, salary, dept_id FROM employee WHERE dept_id IN (SELECT dept_id FROM department WHERE location = 'Indore');


-- Q7. Employees working in IT or Finance departments
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department WHERE dept_name IN ('IT', 'Finance'));


-- Q8. Employees not working in departments located in Indore
SELECT * FROM employee WHERE dept_id NOT IN (SELECT dept_id FROM department WHERE location = 'Indore');


-- Q9. Departments having no employees
SELECT * FROM department WHERE dept_id NOT IN (SELECT dept_id FROM employee);


-- Q10. Employees earning more than IT department average salary
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));


-- Q11. Employees earning more than Finance department average salary
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Finance'));


-- Q12. Employees receiving the highest salary in IT
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));


-- Q13. Employees earning less than the lowest salary in Sales
SELECT * FROM employee WHERE salary < (SELECT MIN(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Sales'));


-- Q14. Employees earning more than at least one employee in HR
SELECT * FROM employee WHERE salary > ANY (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR'));


-- Q15. Employees earning more than every employee in HR
SELECT * FROM employee WHERE salary > ALL (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR'));


-- Q16. Employees earning less than at least one employee in IT
SELECT * FROM employee WHERE salary < ANY (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));


-- Q17. Employees earning more than every employee in Finance
SELECT * FROM employee WHERE salary > ALL (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Finance'));


-- Q18. Employees earning less than every employee in IT
SELECT * FROM employee WHERE salary < ALL (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));



-- Q19. Employees earning more than their own department average salary
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q20. Employees earning less than their own department average salary
SELECT * FROM employee e WHERE salary < (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q21. Employees whose salary is equal to their department average salary
SELECT * FROM employee e WHERE salary = (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q22. Highest-paid employee(s) in each department
SELECT emp_id, emp_name, salary, dept_id FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q23. Lowest-paid employee(s) in each department
SELECT emp_id, emp_name, salary, dept_id FROM employee e WHERE salary = (SELECT MIN(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q24. Employees who are not the highest-paid in their department
SELECT * FROM employee e WHERE salary < (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q25. Employees who are not the lowest-paid in their department
SELECT * FROM employee e WHERE salary > (SELECT MIN(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q26. Second-highest distinct salary in the company without LIMIT
SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);


-- Q27. Employee(s) having the second-highest distinct salary
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));


-- Q28. Third-highest distinct salary in the company without LIMIT
SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));


-- Q29. Employee(s) having the third-highest distinct salary
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee)));


-- Q30. Departments having at least one employee
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id);


-- Q31. Departments having no employees
SELECT * FROM department d WHERE NOT EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id);


-- Q32. Departments where at least one employee earns more than 60000
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id AND e.salary > 60000);


-- Q33. Departments where no employee earns more than 60000
SELECT * FROM department d WHERE NOT EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id AND e.salary > 60000);


-- Q34. Departments where at least one employee earns less than 30000
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id AND e.salary < 30000);


-- Q35. Departments where no employee earns less than 30000
SELECT * FROM department d WHERE NOT EXISTS (SELECT 1 FROM employee e WHERE e.dept_id = d.dept_id AND e.salary < 30000);


-- Q36. Employees belonging to an existing department
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department);


-- Q37. Employees earning more than their own department average using correlated subquery
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q38. Employees receiving the maximum salary in their department using correlated subquery
SELECT * FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q39. Employees receiving the minimum salary in their department using correlated subquery
SELECT * FROM employee e WHERE salary = (SELECT MIN(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q40. Each employee with their department average salary
SELECT emp_id, emp_name, salary, dept_id, (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AS department_average_salary FROM employee e;


-- Q41. Each employee along with highest salary in their department
SELECT emp_id, emp_name, salary, dept_id, (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id) AS department_highest_salary FROM employee e;


-- Q42. Each employee along with lowest salary in their department
SELECT emp_id, emp_name, salary, dept_id, (SELECT MIN(salary) FROM employee WHERE dept_id = e.dept_id) AS department_lowest_salary FROM employee e;


-- Q43. Each employee along with company overall average salary
SELECT emp_id, emp_name, salary, (SELECT AVG(salary) FROM employee) AS company_average_salary FROM employee;


-- Q44. Each employee along with difference between salary and company average
SELECT emp_id, emp_name, salary, salary - (SELECT AVG(salary) FROM employee) AS salary_difference FROM employee;


-- Q45. Each employee along with department name using subquery
SELECT emp_id, emp_name, salary, (SELECT dept_name FROM department WHERE dept_id = e.dept_id) AS dept_name FROM employee e;


-- Q46. Departments whose average salary is greater than company average salary
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) > (SELECT AVG(salary) FROM employee);


-- Q47. Departments whose average salary is less than company average salary
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) < (SELECT AVG(salary) FROM employee);


-- Q48. Department having the highest average salary
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp);


-- Q49. Department having the lowest average salary
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MIN(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp);


-- Q50. Employees working in the department having the highest average salary
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp));


-- Q51. Employees working in the department having the lowest average salary
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MIN(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp));


-- Q52. Departments having more employees than the average number of employees per department
SELECT * FROM department d WHERE (SELECT COUNT(*) FROM employee WHERE dept_id = d.dept_id) > (SELECT AVG(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employee GROUP BY dept_id) AS temp);


-- Q53. Departments where every employee earns more than 30000
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id) AND NOT EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary <= 30000);


-- Q54. Departments where at least one employee earns more than 50000 and at least one earns less than 35000
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary > 50000) AND EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary < 35000);


-- Q55. Departments where every employee earns less than 70000
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id) AND NOT EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary >= 70000);


-- Q56. Employees whose salary is greater than the average of all department average salaries
SELECT * FROM employee WHERE salary > (SELECT AVG(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp);


-- Q57. Department whose maximum employee salary is the highest among all departments
SELECT * FROM department d WHERE (SELECT MAX(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(salary) FROM employee);


-- Q58. Department whose minimum employee salary is the lowest among all departments
SELECT * FROM department d WHERE (SELECT MIN(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MIN(salary) FROM employee);


-- Q59. Employees whose salary is greater than the maximum salary of HR department
SELECT * FROM employee WHERE salary > (SELECT MAX(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR'));


-- Q60. Employees whose salary is less than the minimum salary of Finance department
SELECT * FROM employee WHERE salary < (SELECT MIN(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Finance'));


-- Q61. Employees earning more than every employee in HR but less than at least one employee in IT
SELECT * FROM employee WHERE salary > ALL (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR')) AND salary < ANY (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));


-- Q62. Employees earning more than at least one employee in Finance but less than every employee in IT
SELECT * FROM employee WHERE salary > ANY (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Finance')) AND salary < ALL (SELECT salary FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT'));


-- Q63. Employees working in departments where average salary is greater than 40000
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM employee GROUP BY dept_id HAVING AVG(salary) > 40000);


-- Q64. Departments where average salary is greater than 40000 and at least one employee earns more than 60000
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) > 40000 AND EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary > 60000);


-- Q65. Employees earning more than department average but less than company average
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND salary < (SELECT AVG(salary) FROM employee);


-- Q66. Employees earning less than department average but greater than company average
SELECT * FROM employee e WHERE salary < (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND salary > (SELECT AVG(salary) FROM employee);


-- Q67. Highest-paid employee from each department without GROUP BY directly selecting the employee
SELECT * FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id);


-- Q68. Second-highest distinct salary employee from each department
SELECT * FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id AND salary < (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id));


-- Q69. Departments having at least two employees
SELECT * FROM department d WHERE (SELECT COUNT(*) FROM employee WHERE dept_id = d.dept_id) >= 2;


-- Q70. Employees working in departments having more employees than HR
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT COUNT(*) FROM employee WHERE dept_id = d.dept_id) > (SELECT COUNT(*) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR')));


-- Q71. Employees working in departments having fewer employees than IT
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT COUNT(*) FROM employee WHERE dept_id = d.dept_id) < (SELECT COUNT(*) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT')));


-- Q72. Departments having the same average salary as Finance
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT AVG(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'Finance'));


-- Q73. Employees whose salary is equal to the highest salary of any department other than their own
SELECT * FROM employee e WHERE salary = ANY (SELECT MAX(salary) FROM employee WHERE dept_id <> e.dept_id GROUP BY dept_id);


-- Q74. Employees earning more than the average salary of every department
SELECT * FROM employee WHERE salary > ALL (SELECT AVG(salary) FROM employee GROUP BY dept_id);


-- Q75. Employees earning more than the average salary of at least one department
SELECT * FROM employee WHERE salary > ANY (SELECT AVG(salary) FROM employee GROUP BY dept_id);


-- Q76. Employee(s) whose salary is closest to company average salary
SELECT * FROM employee WHERE ABS(salary - (SELECT AVG(salary) FROM employee)) = (SELECT MIN(ABS(salary - (SELECT AVG(salary) FROM employee))) FROM employee);


-- Q77. Department(s) whose average salary is closest to company average salary
SELECT * FROM department d WHERE ABS((SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) - (SELECT AVG(salary) FROM employee)) = (SELECT MIN(ABS(avg_salary - (SELECT AVG(salary) FROM employee))) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp);


-- Q78. Employees earning more than company average but not the highest-paid employee
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee) AND salary < (SELECT MAX(salary) FROM employee);


-- Q79. Employees earning more than department average and working in a department having at least two employees
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND (SELECT COUNT(*) FROM employee WHERE dept_id = e.dept_id) >= 2;


-- Q80. Employees satisfying all four conditions
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee) AND salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND (SELECT COUNT(*) FROM employee WHERE dept_id = e.dept_id) >= 2 AND salary < (SELECT MAX(salary) FROM employee);


-- Q81. Department having the second-highest average salary
SELECT * FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp WHERE avg_salary < (SELECT MAX(avg_salary) FROM employee GROUP BY dept_id));


-- Q82. Employees working in the department having the second-highest average salary
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp WHERE avg_salary < (SELECT MAX(avg_salary) FROM employee GROUP BY dept_id)));


-- Q83. Second-highest salary employee from every department
SELECT * FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id AND salary < (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id));


-- Q84. Department having the second-highest maximum salary
SELECT * FROM department d WHERE (SELECT MAX(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(max_salary) FROM (SELECT MAX(salary) AS max_salary FROM employee GROUP BY dept_id) AS temp WHERE max_salary < (SELECT MAX(salary) FROM employee));


-- Q85. Employees whose salary is greater than the average salary of the department having the second-highest average salary
SELECT * FROM employee WHERE salary > (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp WHERE avg_salary < (SELECT MAX(avg_salary) FROM employee GROUP BY dept_id));


-- Q86. Employees whose salary is closest to the highest company salary without being the highest-paid employee
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));


-- Q87. Departments where the difference between highest and lowest salary is greater than 30000
SELECT * FROM department d WHERE (SELECT MAX(salary) - MIN(salary) FROM employee WHERE dept_id = d.dept_id) > 30000;


-- Q88. Employees earning above department average with a difference greater than 10000
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) + 10000;


-- Q89. Departments where the highest-paid employee earns more than the highest-paid employee in HR
SELECT * FROM department d WHERE (SELECT MAX(salary) FROM employee WHERE dept_id = d.dept_id) > (SELECT MAX(salary) FROM employee WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'HR'));


-- Q90. Employees earning more than every employee in HR, Finance and Sales
SELECT * FROM employee WHERE salary > ALL (SELECT salary FROM employee WHERE dept_id IN (SELECT dept_id FROM department WHERE dept_name IN ('HR', 'Finance', 'Sales')));


-- Q91. Employee having the third-highest distinct salary without JOIN, LIMIT or window functions
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee)));


-- Q92. Employee having the second-highest salary in each department without LIMIT or window functions
SELECT * FROM employee e WHERE salary = (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id AND salary < (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id));


-- Q93. Departments in which every employee earns more than company average salary
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id) AND NOT EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary <= (SELECT AVG(salary) FROM employee));


-- Q94. Departments where at least one employee earns more than company average and at least one earns less
SELECT * FROM department d WHERE EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary > (SELECT AVG(salary) FROM employee)) AND EXISTS (SELECT 1 FROM employee WHERE dept_id = d.dept_id AND salary < (SELECT AVG(salary) FROM employee));


-- Q95. Employees earning more than department average and company average but less than company highest salary
SELECT * FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND salary > (SELECT AVG(salary) FROM employee) AND salary < (SELECT MAX(salary) FROM employee);


-- Q96. Employees belonging to the department having the highest average salary
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp));


-- Q97. Employees belonging to the department having the lowest average salary
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department d WHERE (SELECT AVG(salary) FROM employee WHERE dept_id = d.dept_id) = (SELECT MIN(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee GROUP BY dept_id) AS temp));


-- Q98. Employees belonging to the department having the highest number of employees
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM employee GROUP BY dept_id HAVING COUNT(*) = (SELECT MAX(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employee GROUP BY dept_id) AS temp));


-- Q99. Employees belonging to the department having the lowest number of employees, excluding departments with zero employees
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM employee GROUP BY dept_id HAVING COUNT(*) = (SELECT MIN(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employee GROUP BY dept_id) AS temp));


-- Q100. Employees earning above department average and company average, not highest-paid in department, and working in a department having at least two employees
SELECT emp_id, emp_name, salary, dept_id FROM employee e WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id) AND salary > (SELECT AVG(salary) FROM employee) AND salary < (SELECT MAX(salary) FROM employee WHERE dept_id = e.dept_id) AND (SELECT COUNT(*) FROM employee WHERE dept_id = e.dept_id) >= 2;

