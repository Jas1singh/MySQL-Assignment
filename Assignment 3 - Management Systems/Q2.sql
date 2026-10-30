# Assignment 3 - Management Systems 

/*
 Question 2: 

Library Management System

Design and create a Library Management System database in MySQL.

In this assignment, you have to think and decide everything.

You will be given only the requirements. You must decide:

Database name
Table names
Column names
Data types
Primary keys
Auto-increment
Default values
Appropriate constraints/data types
Scenario

A college wants to develop a Library Management System to maintain information about books, students, and book transactions.

The system should store the following information:

1. Books

The library wants to maintain:

Unique identification of every book
Book title
Author name
ISBN number
Price
Number of available copies
Book category
Publication date
Whether the book is currently available
A short description of the book
2. Students

The library wants to maintain:

Unique identification of every student
Student name
Enrollment/registration number
Age
Gender
Date of birth
Contact number
Email
Whether the student is currently active
Student registration date
3. Book Issue/Return

Whenever a student takes a book from the library, the system should record:

Which student took the book
Which book was issued
Issue date
Expected return date
Actual return date
Fine amount, if applicable
Whether the book has been returned
Any additional remarks
Date and time when the transaction was created
Requirements
Decide how many tables are required.
Decide the name of each table.
Decide all column names yourself.
Select the most appropriate MySQL data type for every column.
Decide which columns should be PRIMARY KEY.
Decide where AUTO_INCREMENT is appropriate.
Decide where UNSIGNED is appropriate.
Decide which fields should use ENUM, BOOLEAN, DATE, DATETIME, DECIMAL, etc.
Create all tables using DDL.
Insert at least 10 books, 10 students and 15 issue/return transactions.

*/


CREATE DATABASE library_management_system;

USE library_management_system;


CREATE TABLE books (
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(150) NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    ISBN CHAR(13) UNIQUE NOT NULL,
    price DECIMAL(10,2) UNSIGNED NOT NULL,
    available_copies SMALLINT UNSIGNED DEFAULT 0,
    book_category ENUM('FICTION','SCIENCE','TECHNOLOGY','HISTORY','MATHEMATICS','LITERATURE','COMPUTER','BIOGRAPHY') NOT NULL,
    publication_date DATE,
    is_available BOOLEAN DEFAULT TRUE,
    book_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE students (
    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    enrollment_number VARCHAR(20) UNIQUE NOT NULL,
    age TINYINT UNSIGNED,
    gender ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE book_transactions (
    transaction_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    student_id INT UNSIGNED NOT NULL,
    book_id INT UNSIGNED NOT NULL,
    issue_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE,
    fine_amount DECIMAL(8,2) UNSIGNED DEFAULT 0.00,
    is_returned BOOLEAN DEFAULT FALSE,
    remarks VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_transaction_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_transaction_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),

    CONSTRAINT chk_return_date
        CHECK (expected_return_date >= issue_date),

    CONSTRAINT chk_fine_amount
        CHECK (fine_amount >= 0)
);


INSERT INTO books
(book_title, author_name, isbn, price, available_copies,
 book_category, publication_date, is_available, book_description)
VALUES
('The Alchemist', 'Paulo Coelho', '9780061122415', 399.00, 5,
 'FICTION', '1988-01-01', TRUE, 'A novel about dreams and personal destiny.'),

('Wings of Fire', 'A. P. J. Abdul Kalam', '9788173711466', 350.00, 4,
 'BIOGRAPHY', '1999-01-01', TRUE, 'Autobiography of Dr. A. P. J. Abdul Kalam.'),

('Clean Code', 'Robert C. Martin', '9780132350884', 850.00, 3,
 'COMPUTER', '2008-08-01', TRUE, 'A guide to writing maintainable software.'),

('A Brief History of Time', 'Stephen Hawking', '9780553380163', 499.00, 2,
 'SCIENCE', '1988-04-01', TRUE, 'An introduction to cosmology.'),

('The Discovery of India', 'Jawaharlal Nehru', '9780143031031', 450.00, 3,
 'HISTORY', '1946-01-01', TRUE, 'A historical account of Indian civilization.'),

('Introduction to Algorithms', 'Thomas H. Cormen', '9780262046305', 1200.00, 4,
 'TECHNOLOGY', '2022-04-05', TRUE, 'A comprehensive textbook on algorithms.'),

('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 299.00, 6,
 'LITERATURE', '1925-04-10', TRUE, 'A classic American novel.'),

('Engineering Mathematics', 'B. S. Grewal', '9788174091956', 750.00, 5,
 'MATHEMATICS', '2017-01-01', TRUE, 'A textbook covering engineering mathematics.'),

('Harry Potter and the Philosopher''s Stone', 'J. K. Rowling',
 '9780747532699', 550.00, 4,
 'FICTION', '1997-06-26', TRUE, 'A fantasy novel about a young wizard.'),

('The Pragmatic Programmer', 'Andrew Hunt', '9780135957059', 950.00, 3,
 'COMPUTER', '2019-09-13', TRUE, 'Practical guidance for software developers.');


 INSERT INTO students
(student_name, enrollment_number, age, gender, date_of_birth,
 contact_number, email, is_active, registration_date)
VALUES
('Rahul Sharma', 'ENR2024001', 20, 'MALE', '2005-04-12',
 '9876500001', 'rahul.sharma@example.com', TRUE, '2024-07-01'),

('Priya Patel', 'ENR2024002', 21, 'FEMALE', '2004-08-21',
 '9876500002', 'priya.patel@example.com', TRUE, '2024-07-02'),

('Amit Verma', 'ENR2024003', 19, 'MALE', '2006-01-18',
 '9876500003', 'amit.verma@example.com', TRUE, '2024-07-03'),

('Neha Singh', 'ENR2024004', 22, 'FEMALE', '2003-11-05',
 '9876500004', 'neha.singh@example.com', TRUE, '2024-07-04'),

('Arjun Mehta', 'ENR2024005', 20, 'MALE', '2005-03-25',
 '9876500005', 'arjun.mehta@example.com', TRUE, '2024-07-05'),

('Sneha Joshi', 'ENR2024006', 21, 'FEMALE', '2004-06-14',
 '9876500006', 'sneha.joshi@example.com', TRUE, '2024-07-06'),

('Vikram Rao', 'ENR2024007', 23, 'MALE', '2002-09-09',
 '9876500007', 'vikram.rao@example.com', TRUE, '2024-07-07'),

('Ananya Gupta', 'ENR2024008', 19, 'FEMALE', '2006-02-20',
 '9876500008', 'ananya.gupta@example.com', TRUE, '2024-07-08'),

('Karan Shah', 'ENR2024009', 22, 'MALE', '2003-12-11',
 '9876500009', 'karan.shah@example.com', TRUE, '2024-07-09'),

('Meera Nair', 'ENR2024010', 20, 'FEMALE', '2005-07-30',
 '9876500010', 'meera.nair@example.com', TRUE, '2024-07-10');



 INSERT INTO book_transactions
(student_id, book_id, issue_date, expected_return_date,
 actual_return_date, fine_amount, is_returned, remarks)
VALUES
(1, 1, '2025-01-05', '2025-01-19', '2025-01-18', 0.00, TRUE,
 'Returned before due date'),

(2, 3, '2025-01-08', '2025-01-22', '2025-01-25', 30.00, TRUE,
 'Returned three days late'),

(3, 2, '2025-01-10', '2025-01-24', NULL, 0.00, FALSE,
 'Book not yet returned'),

(4, 4, '2025-01-12', '2025-01-26', '2025-01-26', 0.00, TRUE,
 'Returned on due date'),

(5, 5, '2025-01-15', '2025-01-29', NULL, 0.00, FALSE,
 'Currently issued'),

(6, 6, '2025-01-18', '2025-02-01', '2025-02-05', 40.00, TRUE,
 'Late return'),

(7, 7, '2025-01-20', '2025-02-03', '2025-02-02', 0.00, TRUE,
 'Returned early'),

(8, 8, '2025-01-22', '2025-02-05', NULL, 0.00, FALSE,
 'Awaiting return'),

(9, 9, '2025-01-25', '2025-02-08', '2025-02-08', 0.00, TRUE,
 'Returned on time'),

(10, 10, '2025-02-01', '2025-02-15', NULL, 0.00, FALSE,
 'Book currently with student'),

(1, 3, '2025-02-03', '2025-02-17', '2025-02-20', 30.00, TRUE,
 'Returned late'),

(2, 5, '2025-02-05', '2025-02-19', NULL, 0.00, FALSE,
 'Return pending'),

(3, 7, '2025-02-07', '2025-02-21', '2025-02-19', 0.00, TRUE,
 'Returned early'),

(4, 1, '2025-02-10', '2025-02-24', NULL, 0.00, FALSE,
 'Active issue'),

(5, 2, '2025-02-12', '2025-02-26', '2025-03-02', 40.00, TRUE,
 'Returned late');



 SHOW DATABASES;

USE library_management_system;

SHOW TABLES;



DESC books;

DESC students;

DESC book_transactions;



SELECT * FROM books;

SELECT * FROM students;

SELECT * FROM book_transactions;



SELECT COUNT(*) AS total_books FROM books;

SELECT COUNT(*) AS total_students FROM students;

SELECT COUNT(*) AS total_transactions FROM book_transactions;





 
