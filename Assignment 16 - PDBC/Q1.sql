# Assignment 16 - Management Systems with PDBC 

/*
 Question 1: STUDENT MANAGEMENT SYSTEM
=======================================

-------
A coaching institute wants to manage student records using
Python Database Connectivity (PDBC).

TABLE STRUCTURE
===============

Table Name: student_pdbc

Column       Data Type
--------------------------------
sid          INT PRIMARY KEY
sname        VARCHAR(50)
course       VARCHAR(50)
fees         DECIMAL(10,2)
city         VARCHAR(30)


SAMPLE DATA
===========

sid   sname    course    fees       city
------------------------------------------------
101   Amit     Python    15000.00   Indore
102   Priya    Java      18000.00   Bhopal
103   Rahul    Python    15000.00   Indore
104   Neha     Java      18000.00   Ujjain
105   Karan    MERN      20000.00   Indore


MENU
====

===== STUDENT MANAGEMENT SYSTEM =====
1. Add Student
2. Display All Students
3. Search Student by Name
4. Update Student Fees
5. Delete Student
6. Exit

Enter your choice:


TASK 1: ADD STUDENT
===================

INPUT
-----
Enter your choice: 1
Enter Student ID: 106
Enter Student Name: Anjali
Enter Course: Python
Enter Fees: 15000
Enter City: Dewas

OUTPUT
------
Student inserted successfully.


TASK 2: DISPLAY ALL STUDENTS
============================

INPUT
-----
Enter your choice: 2

OUTPUT
------
ID    Name      Course    Fees       City
------------------------------------------------
101   Amit      Python    15000.00   Indore
102   Priya     Java      18000.00   Bhopal
103   Rahul     Python    15000.00   Indore
104   Neha      Java      18000.00   Ujjain
105   Karan     MERN      20000.00   Indore
106   Anjali    Python    15000.00   Dewas


TASK 3: SEARCH STUDENT BY NAME USING LIKE
=========================================

INPUT
-----
Enter your choice: 3
Enter name to search: an

OUTPUT
------
Matching students:

ID    Name      Course    Fees       City
------------------------------------------------
105   Karan     MERN      20000.00   Indore
106   Anjali    Python    15000.00   Dewas

NOTE
----
Use a parameterized query with:
WHERE sname LIKE %s

Pass the search pattern:
'%' + search_name + '%'


TASK 4: UPDATE STUDENT FEES
===========================

INPUT
-----
Enter your choice: 4
Enter Student ID: 101
Enter New Fees: 17000

OUTPUT
------
Student fees updated successfully.


TASK 5: DELETE STUDENT
======================

INPUT
-----
Enter your choice: 5
Enter Student ID: 104

OUTPUT
------
Student deleted successfully.


TASK 6: EXIT
============

INPUT
-----
Enter your choice: 6

OUTPUT
------
Thank you for using Student Management System.



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

create database student_db;

use student_db;

create table student_pdbc (
    sid int primary key,
    sname varchar(50),
    course varchar(50),
    fees decimal(10,2),
    city varchar(30)
);

insert into student_pdbc
(sid, sname, course, fees, city)
values
(101, 'Amit', 'Python', 15000.00, 'Indore'),
(102, 'Priya', 'Java', 18000.00, 'Bhopal'),
(103, 'Rahul', 'Python', 15000.00, 'Indore'),
(104, 'Neha', 'Java', 18000.00, 'Ujjain'),
(105, 'Karan', 'MERN', 20000.00, 'Indore');