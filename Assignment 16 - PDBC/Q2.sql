# Assignment 16 - Management Systems with PDBC 

/*
 Question 2: EMPLOYEE MANAGEMENT SYSTEM
=========================================================

--------
A company wants to maintain employee details, departments,
salaries, and cities using Python PDBC.

TABLE STRUCTURE
===============

Table Name: employee_pdbc

Column       Data Type
--------------------------------
eid          INT PRIMARY KEY
ename        VARCHAR(50)
department   VARCHAR(40)
salary       DECIMAL(10,2)
city         VARCHAR(30)


SAMPLE DATA
===========

eid   ename    department    salary      city
----------------------------------------------------
201   Amit     IT            45000.00    Indore
202   Priya    HR            40000.00    Bhopal
203   Rahul    IT            55000.00    Indore
204   Neha     Finance       50000.00    Ujjain
205   Karan    IT            60000.00    Indore


MENU
====

===== EMPLOYEE MANAGEMENT SYSTEM =====
1. Add Employee
2. Display All Employees
3. Search Employee by Name
4. Update Employee Salary
5. Delete Employee
6. Exit

Enter your choice:


TASK 1: ADD EMPLOYEE
====================

INPUT
-----
Enter your choice: 1
Enter Employee ID: 206
Enter Employee Name: Anjali
Enter Department: HR
Enter Salary: 42000
Enter City: Dewas

OUTPUT
------
Employee inserted successfully.


TASK 2: DISPLAY ALL EMPLOYEES
=============================

INPUT
-----
Enter your choice: 2

OUTPUT
------
ID    Name      Department    Salary      City
----------------------------------------------------
201   Amit      IT            45000.00    Indore
202   Priya     HR            40000.00    Bhopal
203   Rahul     IT            55000.00    Indore
204   Neha      Finance       50000.00    Ujjain
205   Karan     IT            60000.00    Indore
206   Anjali    HR            42000.00    Dewas


TASK 3: SEARCH EMPLOYEE BY NAME USING LIKE
==========================================

INPUT
-----
Enter your choice: 3
Enter name to search: ra

OUTPUT
------
Matching employees:

ID    Name      Department    Salary      City
----------------------------------------------------
203   Rahul     IT            55000.00    Indore
205   Karan     IT            60000.00    Indore

NOTE
----
Use:
WHERE ename LIKE %s

Pass:
'%' + search_name + '%'


TASK 4: UPDATE EMPLOYEE SALARY
=============================

INPUT
-----
Enter your choice: 4
Enter Employee ID: 201
Enter New Salary: 48000

OUTPUT
------
Employee salary updated successfully.


TASK 5: DELETE EMPLOYEE
=======================

INPUT
-----
Enter your choice: 5
Enter Employee ID: 202

OUTPUT
------
Employee deleted successfully.


TASK 6: EXIT
============

INPUT
-----
Enter your choice: 6

OUTPUT
------
Thank you for using Employee Management System.




add these scenarios also:--

1. Display all products from Electronics category.
2. Display all products from Stationery category.
3. Search products whose names contain 'oo'.
4. Search products whose names start with 'M'.
5. Search products whose names end with 'e'.
6. Display products whose price is greater than 1000.
7. Display products whose quantity is less than 20.
8. Update product quantity.
9. Update product category.
10. Delete a product by ID.
11. Display products whose category contains 'tron'.
12. Search products by a user-provided price range.



SUGGESTED SUCCESS MESSAGES
==========================

INSERT:
Record inserted successfully.

SELECT:
Records displayed successfully.

UPDATE:
Record updated successfully.

DELETE:
Record deleted successfully.

NOT FOUND:
No record found for the given ID.

INVALID CHOICE:
Invalid choice. Please try again.

EXIT:
Thank you for using the system. give me complete solution
*/

create database employee_db;

use employee_db;

create table employee_pdbc (
    eid int primary key,
    ename varchar(50),
    department varchar(40),
    salary decimal(10,2),
    city varchar(30)
);

insert into employee_pdbc
(eid, ename, department, salary, city)
values
(201, 'Amit', 'IT', 45000.00, 'Indore'),
(202, 'Priya', 'HR', 40000.00, 'Bhopal'),
(203, 'Rahul', 'IT', 55000.00, 'Indore'),
(204, 'Neha', 'Finance', 50000.00, 'Ujjain'),
(205, 'Karan', 'IT', 60000.00, 'Indore');