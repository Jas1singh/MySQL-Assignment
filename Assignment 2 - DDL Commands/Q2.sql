# Assignment 50 - MySQL 2 

/* Question 2: 

Create and Populate books Table
Columns:

book_id INT

title VARCHAR(150)

author VARCHAR(100)

genre VARCHAR(50)

publication_year INT

price DECIMAL(6,2)

publisher VARCHAR(100)

Task:

Insert 4 book records.
*/

CREATE TABLE books (
    book_id INT,
    title VARCHAR(150),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    price DECIMAL(6,2),
    publisher VARCHAR(100)
);


INSERT INTO books
(book_id, title, author, genre, publication_year, price, publisher)
VALUES
(1, 'Wings of Fire', 'A.P.J. Abdul Kalam',
 'Autobiography', 1999, 350.00, 'Universities Press'),
(2, 'The Alchemist', 'Paulo Coelho',
 'Fiction', 1988, 299.00, 'HarperCollins'),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki',
 'Finance', 1997, 450.00, 'Plata Publishing'),
(4, 'Atomic Habits', 'James Clear',
 'Self-Help', 2018, 399.00, 'Penguin');
 

SELECT * FROM books;