# Assignment 11 - Foreign Key 

/*
 Question 1: 
A company wants to manage its employees and their respective departments. Each employee must belong to a department. If a department is deleted, all employees in that department should also be removed automatically.
Tasks:
1. Create the Departments Table
Each department has a unique ID (DepartmentID).
The department name must be unique.
The department name cannot be NULL.
2. Create the Employees Table
Each employee has a unique ID (EmployeeID).
Each employee has a name and salary, both cannot be NULL.
Each employee must be assigned to a department (DepartmentID), which is a FOREIGN KEY referencing Departments(DepartmentID).
If a department is deleted, all employees in that department should also be deleted.
3. Insert Sample Data
Insert at least 3 departments.
Insert at least 5 employees (make sure at least two employees belong to the same department).
4. Implement Query Constraints (Without Using JOIN)
Write a query to list all employees and their department names (without using JOIN).
Write a query to update an employee's department.
Try deleting a department and observe what happens to the employees under that department.

*/

CREATE TABLE Departments (DepartmentID INT PRIMARY KEY AUTO_INCREMENT, DepartmentName VARCHAR(100) NOT NULL UNIQUE);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
    ON DELETE CASCADE
);


INSERT INTO Departments (DepartmentName)
VALUES
('Computer Science'),
('Mechanical'),
('Electrical');


INSERT INTO Employees
(EmployeeName, Salary, DepartmentID)
VALUES
('Rahul', 30000, 1),
('Amit', 35000, 1),
('Priya', 40000, 2),
('Neha', 32000, 3),
('Rohit', 45000, 2);


SELECT EmployeeID, EmployeeName,Salary,
    (SELECT DepartmentName
     FROM Departments
     WHERE Departments.DepartmentID = Employees.DepartmentID)
    AS DepartmentName 
FROM Employees;


UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 1;


DELETE FROM Departments WHERE DepartmentID = 1;


SELECT * FROM Employees;


