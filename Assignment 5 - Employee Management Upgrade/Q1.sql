# Assignment 5 - Employee Management Continue 

/*
 Question 1: Employee Management System

Use the `employees` table and sample data given below.

Create an `employees` table with the following columns:

* `employee_id`
* `employee_name`
* `department`
* `city`
* `salary`
* `joining_date`
* `experience`
* `age`
* `gender`
* `employment_type`
* `skills`
* `email`
* `manager_id`

### Data Type Requirements

Use:

* `ENUM` for `gender`
* `ENUM` for `employment_type`
* `SET` for `skills`
* `DATE` for `joining_date`
* `DATE` for any other date column if required
* Allow appropriate columns such as `email` and `manager_id` to contain `NULL`


Insert **at least 10 employees** with different values.

Your data must include:

* At least SOME different departments
* At least SOME different cities
* Some employees with `NULL` email
* Some employees with `NULL` manager_id
* Different employment types such as `FULL_TIME`, `PART_TIME`, `CONTRACT`, `INTERN`
* Different combinations of skills using `SET`
* Employees who joined before 2022
* Employees who joined between 2022 and 2024
* Employees who joined after 2024
* Different salary ranges
* Different experience levels
* Both male and female employees

---

## Write SQL queries for the following questions:

Find employees from IT, Finance, or HR who joined after '2023-01-01', have salary between ₹40,000 and ₹90,000, and have experience greater than 3 years.
Find employees whose email is NULL, salary is greater than ₹50,000, and joining date is after '2022-01-01'.
Find employees whose manager_id is NOT NULL, department is not HR, and salary is either below ₹40,000 or above ₹80,000.
Find employees from Indore, Pune, or Delhi who joined between '2022-01-01' and '2025-12-31', have salary greater than ₹45,000, and experience of at least 3 years.
Find employees who are FULL_TIME, have JAVA or PYTHON in their skills, salary greater than ₹50,000, and email is NOT NULL.
Find employees whose name starts with A or S, joining date is after '2023-01-01', salary is between ₹30,000 and ₹80,000, and age is between 25 and 35.
Find employees who belong to IT or Finance, have JAVA in skills, experience greater than 4 years, and salary is NOT between ₹50,000 and ₹80,000.
Find employees whose department is IT, HR, or Marketing, city is not Mumbai, salary is greater than ₹40,000, and either email is NULL or manager_id is NULL.
Find employees who joined after '2022-01-01', are not INTERN, have salary greater than ₹45,000, and have either SQL or PYTHON in their skills.
Find employees whose salary is greater than ₹60,000 OR experience is greater than 7 years, but exclude employees from Mumbai and Bhopal.
Find employees who joined between '2023-01-01' and '2026-12-31', belong to Electronics-related departments? Instead, use: departments IT or Development, salary greater than ₹50,000, and email is NOT NULL.
Find employees whose name contains the letter a, department is not HR, salary is between ₹35,000 and ₹75,000, and joining date is after '2022-06-01'.
Find employees who have both JAVA and SQL skills, salary greater than ₹55,000, experience greater than 3 years, and manager_id is NOT NULL.
Find employees who have PYTHON or REACT skills, belong to IT or Development, joined after '2023-01-01', and salary is greater than ₹50,000.
Find employees whose employment type is CONTRACT or PART_TIME, salary is greater than ₹35,000, joining date is between '2022-01-01' and '2025-12-31', and email is NOT NULL.
Find employees whose gender is FEMALE, department is IT or Finance, salary is greater than ₹45,000, and experience is greater than 2 years.
Find employees whose city is Indore, Pune, or Delhi, department is not HR, joining date is after '2023-01-01', salary is between ₹40,000 and ₹1,00,000, and manager_id is NOT NULL.
Find employees whose salary is NOT between ₹30,000 and ₹60,000, experience is greater than 5 years, and either department is IT or Finance.
Find employees whose email is NULL OR manager_id is NULL, but salary must be greater than ₹40,000 and joining date must be after '2022-01-01'.
Find employees whose name starts with S OR contains a, department is IT or Finance, salary is between ₹40,000 and ₹90,000, and experience is at least 3 years.
Find employees who joined between '2022-01-01' and '2025-12-31', are not from Mumbai or Bhopal, salary is greater than ₹50,000, and have JAVA in their skills.
Find employees who are FULL_TIME, joined after '2023-01-01', have salary greater than ₹60,000, and have either JAVA + SQL or PYTHON + REACT skills.
Find employees from IT, Finance, or Development whose salary is between ₹45,000 and ₹90,000, experience is greater than 3 years, email is NOT NULL, and manager_id is NOT NULL.
Find employees whose joining date is after '2023-01-01', department is not HR, salary is greater than ₹50,000 OR experience is greater than 6 years, and city is not Mumbai.
Find employees whose name starts with A or M, gender is FEMALE, employment type is FULL_TIME, salary is greater than ₹45,000, and email is NOT NULL.
Find employees who have JAVA or SPRING in their skills, joined after '2022-01-01', salary is NOT between ₹40,000 and ₹70,000, and manager_id is NOT NULL.
Find employees from Indore, Pune, or Delhi whose joining date is between '2023-01-01' and '2026-12-31', salary is between ₹40,000 and ₹1,00,000, experience is greater than 2 years, and either email or manager_id is NULL.
Find employees belonging to IT or Development, whose name contains a, skills contain JAVA or PYTHON, salary is greater than ₹50,000, joining date is after '2023-01-01', and email is NOT NULL.
Find employees whose department is IT, Finance, or Development, city is not Mumbai or Bhopal, salary is between ₹40,000 and ₹90,000, experience is greater than 3 years, skills contain SQL, and manager_id is NOT NULL. Display the result ordered by salary in descending order.
Find employees whose name starts with S OR contains a, department is IT or Finance, joining date is between '2023-01-01' and '2026-12-31', salary is between ₹40,000 and ₹1,00,000, experience is greater than 2 years, email is NOT NULL, manager_id is NOT NULL, skills contain JAVA or PYTHON, and city is Indore, Pune, or Delhi. Display the result first by department ascending and then by salary descending.

*/


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL,
    experience INT NOT NULL,
    age INT NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    employment_type ENUM(
        'FULL_TIME',
        'PART_TIME',
        'CONTRACT',
        'INTERN'
    ) NOT NULL,
    skills SET(
        'JAVA',
        'SQL',
        'PYTHON',
        'REACT',
        'SPRING',
        'HTML',
        'CSS',
        'JAVASCRIPT'
    ),
    email VARCHAR(100) NULL,
    manager_id INT NULL
);


INSERT INTO employees
(employee_id, employee_name, department, city, salary,
 joining_date, experience, age, gender, employment_type,
 skills, email, manager_id)
VALUES
(1, 'Amit Sharma', 'IT', 'Indore', 75000,
 '2021-03-15', 6, 32, 'MALE', 'FULL_TIME',
 'JAVA,SQL,SPRING', 'amit@company.com', 101),

(2, 'Sneha Verma', 'Finance', 'Pune', 65000,
 '2023-06-10', 5, 29, 'FEMALE', 'FULL_TIME',
 'SQL,PYTHON', 'sneha@company.com', 102),

(3, 'Anjali Patel', 'HR', 'Bhopal', 45000,
 '2024-02-20', 3, 27, 'FEMALE', 'PART_TIME',
 'SQL,HTML', NULL, 103),

(4, 'Sameer Khan', 'Development', 'Delhi', 85000,
 '2025-04-12', 7, 34, 'MALE', 'FULL_TIME',
 'JAVA,REACT,SQL', 'sameer@company.com', 101),

(5, 'Meera Joshi', 'IT', 'Pune', 55000,
 '2022-08-05', 4, 28, 'FEMALE', 'CONTRACT',
 'PYTHON,SQL', 'meera@company.com', NULL),

(6, 'Arjun Singh', 'Finance', 'Indore', 95000,
 '2020-11-18', 9, 38, 'MALE', 'FULL_TIME',
 'JAVA,SQL,PYTHON', 'arjun@company.com', 102),

(7, 'Sara Khan', 'IT', 'Delhi', 48000,
 '2024-07-01', 3, 26, 'FEMALE', 'INTERN',
 'PYTHON,HTML,CSS', NULL, NULL),

(8, 'Manish Gupta', 'Development', 'Indore', 70000,
 '2023-09-14', 5, 31, 'MALE', 'FULL_TIME',
 'JAVA,REACT,SPRING', 'manish@company.com', 101),

(9, 'Simran Kaur', 'Finance', 'Pune', 40000,
 '2025-01-08', 2, 25, 'FEMALE', 'PART_TIME',
 'SQL,PYTHON', 'simran@company.com', 102),

(10, 'Rahul Mehta', 'Marketing', 'Mumbai', 35000,
 '2021-12-11', 2, 30, 'MALE', 'CONTRACT',
 'HTML,CSS', NULL, 104),

(11, 'Ananya Rao', 'IT', 'Indore', 88000,
 '2025-05-19', 6, 33, 'FEMALE', 'FULL_TIME',
 'JAVA,SQL,SPRING', 'ananya@company.com', 101),

(12, 'Mohit Jain', 'Development', 'Delhi', 62000,
 '2022-04-25', 4, 29, 'MALE', 'CONTRACT',
 'PYTHON,REACT,SQL', 'mohit@company.com', NULL),

(13, 'Sonia Das', 'HR', 'Pune', 52000,
 '2026-02-15', 4, 30, 'FEMALE', 'FULL_TIME',
 'SQL,HTML,JAVASCRIPT', 'sonia@company.com', 103),

(14, 'Vikas Nair', 'IT', 'Mumbai', 30000,
 '2023-10-05', 1, 24, 'MALE', 'INTERN',
 'JAVA,HTML', NULL, NULL),

(15, 'Maya Desai', 'Finance', 'Delhi', 78000,
 '2024-12-22', 8, 35, 'FEMALE', 'FULL_TIME',
 'JAVA,SQL,PYTHON,SPRING', 'maya@company.com', 102);



 SELECT * FROM employees;


 SELECT COUNT(*) AS total_employees
FROM employees;


SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'HR')
  AND joining_date > '2023-01-01'
  AND salary BETWEEN 40000 AND 90000
  AND experience > 3;


SELECT * FROM employees
WHERE email IS NULL
  AND salary > 50000
  AND joining_date > '2022-01-01';


SELECT * FROM employees
WHERE manager_id IS NOT NULL
  AND department <> 'HR'
  AND (salary < 40000 OR salary > 80000);


SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
  AND joining_date BETWEEN '2022-01-01' AND '2025-12-31'
  AND salary > 45000
  AND experience >= 3;


SELECT * FROM employees
WHERE employment_type = 'FULL_TIME'
  AND (
      FIND_IN_SET('JAVA', skills) > 0
      OR FIND_IN_SET('PYTHON', skills) > 0
  )
  AND salary > 50000
  AND email IS NOT NULL;


SELECT * FROM employees
WHERE (employee_name LIKE 'A%' OR employee_name LIKE 'S%')
  AND joining_date > '2023-01-01'
  AND salary BETWEEN 30000 AND 80000
  AND age BETWEEN 25 AND 35;


SELECT * FROM employees
WHERE department IN ('IT', 'Finance')
  AND FIND_IN_SET('JAVA', skills) > 0
  AND experience > 4
  AND salary NOT BETWEEN 50000 AND 80000;


SELECT * FROM employees
WHERE department IN ('IT', 'HR', 'Marketing')
  AND city <> 'Mumbai'
  AND salary > 40000
  AND (email IS NULL OR manager_id IS NULL);


SELECT * FROM employees
WHERE joining_date > '2022-01-01'
  AND employment_type <> 'INTERN'
  AND salary > 45000
  AND (
      FIND_IN_SET('SQL', skills) > 0
      OR FIND_IN_SET('PYTHON', skills) > 0
  );


SELECT * FROM employees
WHERE (salary > 60000 OR experience > 7)
  AND city NOT IN ('Mumbai', 'Bhopal');


SELECT * FROM employees
WHERE department IN ('IT', 'Development')
  AND salary > 50000
  AND email IS NOT NULL;


SELECT * FROM employees
WHERE employee_name LIKE '%a%'
  AND department <> 'HR'
  AND salary BETWEEN 35000 AND 75000
  AND joining_date > '2022-06-01';


SELECT * FROM employees
WHERE FIND_IN_SET('JAVA', skills) > 0
  AND FIND_IN_SET('SQL', skills) > 0
  AND salary > 55000
  AND experience > 3
  AND manager_id IS NOT NULL;


SELECT * FROM employees
WHERE (
      FIND_IN_SET('PYTHON', skills) > 0
      OR FIND_IN_SET('REACT', skills) > 0
  )
  AND department IN ('IT', 'Development')
  AND joining_date > '2023-01-01'
  AND salary > 50000;


SELECT * FROM employees
WHERE employment_type IN ('CONTRACT', 'PART_TIME')
  AND salary > 35000
  AND joining_date BETWEEN '2022-01-01' AND '2025-12-31'
  AND email IS NOT NULL;


SELECT * FROM employees
WHERE gender = 'FEMALE'
  AND department IN ('IT', 'Finance')
  AND salary > 45000
  AND experience > 2;


SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
  AND department <> 'HR'
  AND joining_date > '2023-01-01'
  AND salary BETWEEN 40000 AND 100000
  AND manager_id IS NOT NULL;


SELECT * FROM employees
WHERE salary NOT BETWEEN 30000 AND 60000
  AND experience > 5
  AND department IN ('IT', 'Finance');


SELECT * FROM employees
WHERE (email IS NULL OR manager_id IS NULL)
  AND salary > 40000
  AND joining_date > '2022-01-01';


SELECT * FROM employees
WHERE (
      employee_name LIKE 'S%'
      OR employee_name LIKE '%a%'
  )
  AND department IN ('IT', 'Finance')
  AND salary BETWEEN 40000 AND 90000
  AND experience >= 3;


SELECT * FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2025-12-31'
  AND city NOT IN ('Mumbai', 'Bhopal')
  AND salary > 50000
  AND FIND_IN_SET('JAVA', skills) > 0;


SELECT * FROM employees
WHERE employment_type = 'FULL_TIME'
  AND joining_date > '2023-01-01'
  AND salary > 60000
  AND (
      (
          FIND_IN_SET('JAVA', skills) > 0
          AND FIND_IN_SET('SQL', skills) > 0
      )
      OR
      (
          FIND_IN_SET('PYTHON', skills) > 0
          AND FIND_IN_SET('REACT', skills) > 0
      )
  );


SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'Development')
  AND salary BETWEEN 45000 AND 90000
  AND experience > 3
  AND email IS NOT NULL
  AND manager_id IS NOT NULL;


SELECT * FROM employees
WHERE joining_date > '2023-01-01'
  AND department <> 'HR'
  AND (salary > 50000 OR experience > 6)
  AND city <> 'Mumbai';


SELECT * FROM employees
WHERE (employee_name LIKE 'A%' OR employee_name LIKE 'M%')
  AND gender = 'FEMALE'
  AND employment_type = 'FULL_TIME'
  AND salary > 45000
  AND email IS NOT NULL;


SELECT * FROM employees
WHERE (
      FIND_IN_SET('JAVA', skills) > 0
      OR FIND_IN_SET('SPRING', skills) > 0
  )
  AND joining_date > '2022-01-01'
  AND salary NOT BETWEEN 40000 AND 70000
  AND manager_id IS NOT NULL;


SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
  AND joining_date BETWEEN '2023-01-01' AND '2026-12-31'
  AND salary BETWEEN 40000 AND 100000
  AND experience > 2
  AND (email IS NULL OR manager_id IS NULL);


SELECT * FROM employees
WHERE department IN ('IT', 'Development')
  AND employee_name LIKE '%a%'
  AND (
      FIND_IN_SET('JAVA', skills) > 0
      OR FIND_IN_SET('PYTHON', skills) > 0
  )
  AND salary > 50000
  AND joining_date > '2023-01-01'
  AND email IS NOT NULL;


SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'Development')
  AND city NOT IN ('Mumbai', 'Bhopal')
  AND salary BETWEEN 40000 AND 90000
  AND experience > 3
  AND FIND_IN_SET('SQL', skills) > 0
  AND manager_id IS NOT NULL
ORDER BY salary DESC;


SELECT * FROM employees
WHERE (
      employee_name LIKE 'S%'
      OR employee_name LIKE '%a%'
  )
  AND department IN ('IT', 'Finance')
  AND joining_date BETWEEN '2023-01-01' AND '2026-12-31'
  AND salary BETWEEN 40000 AND 100000
  AND experience > 2
  AND email IS NOT NULL
  AND manager_id IS NOT NULL
  AND (
      FIND_IN_SET('JAVA', skills) > 0
      OR FIND_IN_SET('PYTHON', skills) > 0
  )
  AND city IN ('Indore', 'Pune', 'Delhi')
ORDER BY department ASC, salary DESC;




