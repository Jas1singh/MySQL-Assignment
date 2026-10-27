# Assignment 7 - Empployee Payroll And Job Management System 

/* 
A company wants to maintain employee information in MySQL. You have been asked to design an `employee` table that strictly enforces the company's data rules using `NOT NULL`, `UNIQUE`, and `CHECK` constraints.

## 1. CREATE THE EMPLOYEE TABLE

Create a table named `employee` with the following columns.

| Column Name | Data Type | Requirements |
|---|---|---|
| `emp_id` | INT | Primary Key, Auto Increment |
| `emp_name` | VARCHAR(50) | Mandatory |
| `email` | VARCHAR(100) | Mandatory and must be unique |
| `phone` | VARCHAR(15) | Mandatory and must be unique |
| `department` | VARCHAR(30) | Mandatory |
| `designation` | VARCHAR(30) | Mandatory |
| `age` | INT | Mandatory, employee must be between 21 and 60 |
| `salary` | DECIMAL(10,2) | Mandatory, salary must be greater than 15000 |
| `experience` | INT | Mandatory, experience must be between 0 and 35 years |
| `joining_year` | INT | Mandatory |
| `status` | VARCHAR(20) | Mandatory, only `Active`, `Inactive`, or `On Leave` |
| `bonus` | DECIMAL(10,2) | Mandatory, cannot be negative |


## 2. APPLY THE CONSTRAINTS

### 2.1 NOT NULL Constraints

The following columns cannot contain `NULL` values:

- `emp_name`
- `email`
- `phone`
- `department`
- `designation`
- `age`
- `salary`
- `experience`
- `joining_year`
- `status`
- `bonus`

### 2.2 UNIQUE Constraints

The following values must be unique across all employees:

- `email`
- `phone`

**Rule:** Two employees cannot have the same email address or phone number.

### 2.3 CHECK Constraints on Individual Columns

Implement the following rules using `CHECK` constraints:

1. **Age:** Must be between 21 and 60, inclusive.
2. **Salary:** Must be greater than 15000.
3. **Experience:** Must be between 0 and 35 years, inclusive.
4. **Bonus:** Must be greater than or equal to 0.
5. **Status:** Can only be `Active`, `Inactive`, or `On Leave`.



## 3. COMBINATION CHECK CONSTRAINTS

Implement the following business rules using `CHECK` constraints involving multiple columns where required.

### Rule 1: Experience and Age

An employee cannot have more experience than is realistically possible based on their age.

**Condition:** `experience` must be less than or equal to `age - 21`.

Examples:

- Age 25 and Experience 4 → Valid
- Age 25 and Experience 10 → Invalid

### Rule 2: Salary and Experience

Employees with more experience must receive an appropriate minimum salary.

**Condition:** If `experience` is greater than or equal to 10, `salary` must be greater than or equal to 50000.

Examples:

- Experience 12 and Salary 60000 → Valid
- Experience 12 and Salary 35000 → Invalid

### Rule 3: Department and Designation

The company allows only the following department-designation combinations.

| Department | Allowed Designations |
|---|---|
| IT | Developer, Tester, Team Lead |
| HR | HR Executive, HR Manager |
| Finance | Accountant, Finance Manager |
| Sales | Sales Executive, Sales Manager |

Implement this rule using a `CHECK` constraint involving both `department` and `designation`.

Examples:

- IT and Developer → Valid
- IT and HR Manager → Invalid
- HR and Developer → Invalid
- Finance and Accountant → Valid

### Rule 4: Status and Bonus

Apply the following business rules:

1. **Active:** Employees can receive a bonus, subject to the general bonus constraints.
2. **Inactive:** Bonus must be equal to 0.
3. **On Leave:** Bonus cannot exceed 20% of the employee's salary.

Examples:

- Active, Salary 50000, Bonus 10000 → Valid
- Inactive, Salary 50000, Bonus 5000 → Invalid
- Inactive, Salary 50000, Bonus 0 → Valid
- On Leave, Salary 50000, Bonus 10000 → Valid
- On Leave, Salary 50000, Bonus 15000 → Invalid

### Rule 5: Joining Year and Experience

Assume the current year is **2026**.

Apply the following rules:

1. The employee's experience cannot exceed the number of years since joining.
2. `joining_year` cannot be greater than 2026.

Examples:

- Joining Year 2020 and Experience 6 → Valid
- Joining Year 2020 and Experience 10 → Invalid
- Joining Year 2027 → Invalid

## 4. INSERT VALID RECORDS

Insert at least **10 valid employee records** into the `employee` table.

Ensure that all records satisfy every individual and combination constraint simultaneously.

Your records must cover:

- Multiple departments
- Multiple designations
- Different experience levels
- Different salary ranges
- All three statuses: `Active`, `Inactive`, and `On Leave`
- Different bonus values

Ensure that every employee has a unique email address and phone number.



## 5. CONSTRAINT TESTING

After inserting the valid records, deliberately execute at least **12 invalid `INSERT` statements** to verify that the constraints work correctly.

Each invalid insertion should violate the intended constraint while keeping other values valid wherever possible.

### 5.1 NOT NULL Testing

Test the following cases:

1. Try inserting `NULL` into `emp_name`.
2. Try inserting `NULL` into `email`.
3. Try inserting `NULL` into `salary`.

### 5.2 UNIQUE Testing

Test the following cases:

4. Try inserting a duplicate email address.
5. Try inserting a duplicate phone number.

### 5.3 Individual CHECK Testing

Test the following cases:

6. Try inserting an employee with age equal to 18.
7. Try inserting an employee with salary equal to 10000.
8. Try inserting an employee with experience equal to -2.
9. Try inserting an employee with bonus equal to -500.
10. Try inserting an employee with status equal to `Retired`.

### 5.4 Combination CHECK Testing

Test the following cases:

11. Try inserting an employee with age 25 and experience 10.
12. Try inserting an employee with experience 12 and salary 35000.
13. Try inserting an employee with department `IT` and designation `HR Manager`.
14. Try inserting an employee with status `Inactive` and bonus 5000.
15. Try inserting an employee with status `On Leave`, salary 50000, and bonus 15000.
16. Try inserting an employee with joining year 2020 and experience 10.
17. Try inserting an employee with joining year 2027.

### Expected Outcome

- All valid employee records should be inserted successfully.
- Every invalid insertion should be rejected by the appropriate constraint.
- Identify the constraint responsible for rejecting each invalid insertion.
- Verify that the table contains only valid employee records after testing.

*/


CREATE DATABASE employee_payroll;

USE employee_payroll;

CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,

    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    department VARCHAR(30) NOT NULL,
    designation VARCHAR(30) NOT NULL,

    age INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    experience INT NOT NULL,
    joining_year INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    bonus DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_age
        CHECK (age BETWEEN 21 AND 60),

    CONSTRAINT chk_salary
        CHECK (salary > 15000),

    CONSTRAINT chk_experience
        CHECK (experience BETWEEN 0 AND 35),

    CONSTRAINT chk_bonus
        CHECK (bonus >= 0),

    CONSTRAINT chk_status
        CHECK (status IN ('Active', 'Inactive', 'On Leave')),

    -- Rule 1: Experience and age
    CONSTRAINT chk_experience_age
        CHECK (experience <= age - 21),

    -- Rule 2: Salary and experience
    CONSTRAINT chk_salary_experience
        CHECK (experience < 10 OR salary >= 50000),

    -- Rule 3: Department and designation
    CONSTRAINT chk_department_designation
        CHECK (
            (department = 'IT'
                AND designation IN
                ('Developer', 'Tester', 'Team Lead'))
            OR
            (department = 'HR'
                AND designation IN
                ('HR Executive', 'HR Manager'))
            OR
            (department = 'Finance'
                AND designation IN
                ('Accountant', 'Finance Manager'))
            OR
            (department = 'Sales'
                AND designation IN
                ('Sales Executive', 'Sales Manager'))
        ),

    -- Rule 4: Status and bonus
    CONSTRAINT chk_status_bonus
        CHECK (
            (status = 'Active')
            OR
            (status = 'Inactive' AND bonus = 0)
            OR
            (status = 'On Leave' AND bonus <= salary * 0.20)
        ),

    -- Rule 5: Joining year and experience
    CONSTRAINT chk_joining_year
        CHECK (
            joining_year <= 2026
            AND experience <= 2026 - joining_year
        )
);



INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES
('Amit Sharma', 'amit@example.com', '9000000001','IT', 'Developer', 25, 30000, 4, 2022, 'Active', 3000),

('Priya Verma', 'priya@example.com', '9000000002','IT', 'Tester', 30, 45000, 8, 2018, 'Active', 5000),

('Rahul Singh', 'rahul@example.com', '9000000003','IT', 'Team Lead', 40, 70000, 15, 2011, 'Active', 10000),

('Neha Patel', 'neha@example.com', '9000000004','HR', 'HR Executive', 27, 28000, 5, 2021, 'Inactive', 0),

('Vikas Gupta', 'vikas@example.com', '9000000005','HR', 'HR Manager', 38, 60000, 12, 2014, 'Active', 8000),

('Sneha Jain', 'sneha@example.com', '9000000006','Finance', 'Accountant', 29, 35000, 6, 2020, 'On Leave', 5000),

('Arjun Mehta', 'arjun@example.com', '9000000007','Finance', 'Finance Manager', 45, 80000, 20, 2006, 'Active', 15000),

('Kavita Rao', 'kavita@example.com', '9000000008','Sales', 'Sales Executive', 24, 25000, 2, 2024, 'Inactive', 0),

('Rohit Das', 'rohit@example.com', '9000000009','Sales', 'Sales Manager', 35, 55000, 10, 2016, 'On Leave', 10000),

('Pooja Nair', 'pooja@example.com', '9000000010','IT', 'Developer', 32, 50000, 9, 2017, 'Active', 6000);


 SELECT * FROM employee;


SELECT status, COUNT(*) AS employee_count FROM employee GROUP BY status;


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES(NULL, 'test1@example.com', '9110000001','IT', 'Developer', 25, 30000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES(NULL, 'test1@example.com', '9110000001','IT', 'Developer', 25, 30000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Test Two', NULL, '9110000002','IT', 'Tester', 25, 30000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Test Three', 'test3@example.com', '9110000003','IT', 'Developer', 25, NULL, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Duplicate Email', 'amit@example.com', '9110000004','IT', 'Developer', 25, 30000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Duplicate Phone', 'test5@example.com', '9000000001','IT', 'Tester', 25, 30000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Invalid Age', 'test6@example.com', '9110000006','IT', 'Developer', 18, 30000, 0, 2025, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Invalid Salary', 'test7@example.com', '9110000007','IT', 'Developer', 25, 10000, 4, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Invalid Experience', 'test8@example.com', '9110000008','IT', 'Developer', 25, 30000, -2, 2022, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Invalid Bonus', 'test9@example.com', '9110000009','IT', 'Developer', 25, 30000, 4, 2022, 'Active', -500);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Invalid Status', 'test10@example.com', '9110000010','IT', 'Developer', 25, 30000, 4, 2022, 'Retired', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Age Experience Error', 'test11@example.com', '9110000011','IT', 'Developer', 25, 60000, 10, 2016, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Salary Experience Error', 'test12@example.com', '9110000012','IT', 'Developer', 40, 35000, 12, 2014, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Department Error', 'test13@example.com', '9110000013','IT', 'HR Manager', 30, 40000, 5, 2021, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Inactive Bonus Error', 'test14@example.com', '9110000014','IT', 'Developer', 30, 50000, 5, 2021, 'Inactive', 5000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Leave Bonus Error', 'test15@example.com', '9110000015','IT', 'Developer', 30, 50000, 5, 2021, 'On Leave', 15000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Joining Experience Error', 'test16@example.com', '9110000016','IT', 'Developer', 40, 60000, 10, 2020, 'Active', 1000);


INSERT INTO employee(emp_name, email, phone, department, designation,age, salary, experience, joining_year, status, bonus)
VALUES('Future Joining Error', 'test17@example.com', '9110000017','IT', 'Developer', 25, 30000, 1, 2027, 'Active', 1000);



# Verify that only valid records remain

SELECT COUNT(*) AS total_employees FROM employee;

SELECT * FROM employee ORDER BY emp_id;

SELECT * FROM employee
WHERE
    age NOT BETWEEN 21 AND 60
    OR salary <= 15000
    OR experience NOT BETWEEN 0 AND 35
    OR bonus < 0
    OR status NOT IN ('Active', 'Inactive', 'On Leave')
    OR experience > age - 21
    OR (experience >= 10 AND salary < 50000)
    OR NOT (
        (department = 'IT'
            AND designation IN ('Developer', 'Tester', 'Team Lead'))
        OR
        (department = 'HR'
            AND designation IN ('HR Executive', 'HR Manager'))
        OR
        (department = 'Finance'
            AND designation IN ('Accountant', 'Finance Manager'))
        OR
        (department = 'Sales'
            AND designation IN ('Sales Executive', 'Sales Manager'))
    )
    OR (status = 'Inactive' AND bonus <> 0)
    OR (status = 'On Leave' AND bonus > salary * 0.20)
    OR joining_year > 2026
    OR experience > 2026 - joining_year;