# Assignment 3 - Management Systems 

/*
 Question 1: 
Employee Management System

Create an Employee Management System database and design tables that cover the MySQL data types taught so far.

Use all the following data types at least once.

TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT, DECIMAL, FLOAT, DOUBLE, CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT, ENUM,
SET, DATE, TIME, DATETIME, TIMESTAMP, YEAR, BOOLEAN

Also use:

PRIMARY KEY
AUTO_INCREMENT
UNSIGNED
DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP


Part 1 — Create Database

Create a database named:

employee_management

Select the database.

Part 2 — Create employees Table

Create a table named:

employees

Use the following columns:

# Column Name Requirement
1 employee_id Employee unique ID; PRIMARY KEY + AUTO_INCREMENT
2 employee_code Fixed-length employee code
3 employee_name Employee full name
4 age Employee age; should not allow negative values
5 number_of_children Number of children
6 experience_months Total experience in months
7 salary Employee annual salary with exact decimal precision
8 performance_score Employee performance score with approximate decimal value
9 productivity_score Higher-precision approximate decimal value
10 department_id Department identification number
11 employee_status Employment status from predefined values
12 skills Employee can have multiple skills from predefined values
13 gender Employee gender from predefined values
14 date_of_birth Employee date of birth
15 joining_date Date employee joined company
16 login_time Daily office login time
17 interview_datetime Date and time of employee interview
18 birth_year Employee birth year
19 is_active Whether employee is currently active
20 short_note Very small text information
21 employee_description Employee description
22 training_history Larger training-related text
23 employee_profile Very large employee information
24 created_at Automatically store record creation date/time
25 updated_at Automatically update when record is modified

Important

You have to decide the appropriate data type for every column.

Do not blindly use VARCHAR everywhere.

For example:

"Employee can have multiple skills from a predefined list."

You should decide which MySQL datatype is appropriate.

Part 3 — Insert Data

Insert at least 15 employees.

Your data must satisfy the following requirements:

Employee ID

Do not manually provide employee_id.

Let AUTO_INCREMENT generate it.

Employee Code

Use fixed-length codes such as:

EMP001
EMP002
EMP003
Age

Use different realistic ages.

Include employees between approximately 22–55 years.

Numeric Data

Use different values for:

Number of children
Experience in months
Salary
Performance score
Productivity score

Include decimal salary values such as:

52500.50
78500.75
125000.25
Employee Status

Use all predefined statuses that you decide while creating the ENUM.

For example:

ACTIVE
INACTIVE
ON_LEAVE
RESIGNED
Skills

Use multiple combinations.

For example:

JAVA
PYTHON,MYSQL
JAVA,MYSQL
PYTHON,REACT,AWS
JAVA,PYTHON,MYSQL
Gender

Use all values defined in your ENUM.

Dates

Use different:

Birth dates
Joining dates
Time

Use different employee login times.

Date + Time

Insert different interview date/time values.

Year

Use different birth years.

Boolean

Insert both:

TRUE
FALSE
Text

Provide different values for:

Short note
Employee description
Training history
Employee profile
Part 4 — TIMESTAMP Requirement

For created_at:

The employee creation date and time should automatically be captured by MySQL.

For updated_at:

The employee modification date and time should automatically change whenever the employee record is updated.

Then:

Insert an employee.
Check created_at and updated_at.
Update the employee's name.
Check both timestamps again.
Verify that created_at remains unchanged.
Verify that updated_at changes.

This follows the timestamp behavior covered in your notes.

Part 5 — DDL Operations

After creating and inserting data into employees, perform the following operations.

ALTER TABLE
Add a column:
phone_number
Add a column:
email
Modify the size of employee_name.
Modify the size of employee_code.
Rename short_note to:
employee_note
Drop the email column.
Drop the phone_number column.
AUTO_INCREMENT using ALTER

Create another table:

employee_documents

Initially create document_id as a normal integer column.

Then use ALTER TABLE to make document_id an AUTO_INCREMENT column.

CREATE TABLE AS SELECT

Create:

employee_backup

using the existing employees table.

Copy the employee data into it.

TRUNCATE

Create:

employee_test

Insert some records.

Then:

Display the records.
TRUNCATE the table.
Display the records again.
Verify that the table still exists.
DROP

Finally:

Drop employee_test.
Drop employee_documents.
Verify the tables using SHOW TABLES.
Part 6 — Verification

Execute:

SHOW DATABASES;
SHOW TABLES;
DESC employees;
SHOW CREATE TABLE employees;

Then verify that your employees table contains all the required data types.

*/

create DATABASE Employee_Management_System;

use Employee_Management_System;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_code CHAR(6),
    employee_name VARCHAR(50),
    age TINYINT UNSIGNED CHECK (age <= 100),
    number_of_children SMALLINT UNSIGNED,
    experience_months MEDIUMINT UNSIGNED,
    salary DECIMAL(10,2),
    performance_score FLOAT,
    productivity_score DOUBLE,
    department_id INT UNSIGNED,
    employee_status ENUM('ACTIVE','INACTIVE','ON_LEAVE','RESIGNED'),
    skills SET('JAVA','PYTHON','MYSQL','REACT','AWS'),
    gender ENUM('MALE', 'FEMALE', 'OTHER'),
    date_of_birth DATE,
    joining_date DATE,
    login_time TIME,
    interview_datetime DATETIME,
    birth_year YEAR,
    is_active BOOLEAN DEFAULT TRUE,
    short_note TINYTEXT,
    employee_description TEXT,
    training_history MEDIUMTEXT,
    employee_profile LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO employees (
    employee_code, employee_name, age,
    number_of_children, experience_months,
    salary, performance_score, productivity_score,
    department_id, employee_status, skills, gender,
    date_of_birth, joining_date, login_time,
    interview_datetime, birth_year, is_active,
    short_note, employee_description,
    training_history, employee_profile
)
VALUES
(
    'EMP001', 'Rahul Sharma', 28, 1, 48,
    52500.50, 8.5, 92.45678, 101,
    'ACTIVE', 'JAVA,MYSQL', 'MALE',
    '1998-04-12', '2022-06-15', '09:00:00',
    '2022-05-20 10:30:00', 1998, TRUE,
    'Excellent performer',
    'Software developer in the engineering department.',
    'Completed Java and MySQL training.',
    'Rahul specializes in backend application development.'
),
(
    'EMP002', 'Priya Patel', 32, 2, 96,
    78500.75, 9.2, 96.78912, 102,
    'ACTIVE', 'PYTHON,MYSQL,AWS', 'FEMALE',
    '1994-08-21', '2018-03-10', '09:15:00',
    '2018-02-15 11:00:00', 1994, TRUE,
    'Team leader',
    'Experienced data engineer and team mentor.',
    'Completed cloud computing and Python training.',
    'Priya leads data engineering projects and supports junior employees.'
),
(
    'EMP003', 'Amit Verma', 25, 0, 24,
    45000.00, 7.8, 85.12345, 103,
    'ON_LEAVE', 'JAVA,REACT', 'MALE',
    '2001-01-18', '2024-01-08', '09:30:00',
    '2023-12-20 14:00:00', 2001, FALSE,
    'On approved leave',
    'Frontend developer working on web applications.',
    'Completed React and UI development training.',
    'Amit develops responsive user interfaces and maintains frontend components.'
),
(
    'EMP004', 'Neha Singh', 35, 2, 120,
    125000.25, 9.7, 98.65432, 104,
    'INACTIVE', 'PYTHON,AWS', 'FEMALE',
    '1991-11-05', '2015-07-01', '08:45:00',
    '2015-06-10 09:30:00', 1991, FALSE,
    'Former employee',
    'Senior cloud engineer with extensive experience.',
    'Completed AWS architecture and security training.',
    'Neha worked on cloud infrastructure and enterprise security projects.'
),
(
    'EMP005', 'Arjun Mehta', 42, 3, 180,
    150000.50, 9.5, 97.98765, 105,
    'RESIGNED', 'JAVA,PYTHON,MYSQL', 'OTHER',
    '1984-03-25', '2010-09-13', '09:05:00',
    '2010-08-25 15:00:00', 1984, FALSE,
    'Resigned employee',
    'Senior software architect.',
    'Completed leadership and advanced database training.',
    'Arjun designed enterprise software systems and mentored development teams.'
);



SELECT employee_id, employee_name, created_at, updated_at FROM employees WHERE employee_code = 'EMP001';


UPDATE employees SET employee_name = 'Rahul Sharma Updated' WHERE employee_code = 'EMP001';


SELECT employee_id, employee_name, created_at, updated_at FROM employees WHERE employee_code = 'EMP001';


ALTER TABLE employees ADD phone_number VARCHAR(15),ADD email VARCHAR(100);


ALTER TABLE employees MODIFY employee_name VARCHAR(150), MODIFY employee_code CHAR(10);


ALTER TABLE employees RENAME COLUMN short_note TO employee_note;


ALTER TABLE employees DROP COLUMN email;


ALTER TABLE employees DROP COLUMN phone_number;


DESC employees;


# AUTO_INCREMENT using ALTER TABLE

CREATE TABLE employee_documents (
    document_id INT PRIMARY KEY,
    employee_id INT,
    document_name VARCHAR(100),
    document_type VARCHAR(50)
);


ALTER TABLE employee_documents MODIFY document_id INT AUTO_INCREMENT;

INSERT INTO employee_documents(employee_id, document_name, document_type) VALUES(1, 'Resume', 'PDF');

SELECT * FROM employee_documents;



CREATE TABLE employee_backup AS SELECT * FROM employees;

SELECT * FROM employee_backup;

SELECT COUNT(*) AS employee_count FROM employees;

SELECT COUNT(*) AS backup_count FROM employee_backup;



CREATE TABLE employee_test (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    test_name VARCHAR(50),
    test_salary DECIMAL(10,2)
);

INSERT INTO employee_test (test_name, test_salary)
VALUES
('Test Employee 1', 25000.00),
('Test Employee 2', 35000.50),
('Test Employee 3', 45000.75);

SELECT * FROM employee_test;



TRUNCATE TABLE employee_test;

SELECT * FROM employee_test;

SHOW TABLES LIKE 'employee_test';



DROP TABLE employee_test;

DROP TABLE employee_documents;

SHOW TABLES;



SHOW DATABASES;

use Employee_Management_System;

SHOW TABLES;

DESC employees;

SHOW CREATE TABLE employees;