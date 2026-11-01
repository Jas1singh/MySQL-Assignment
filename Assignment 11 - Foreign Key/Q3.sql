# Assignment 11 - Foreign Key 

/*
 Question 3: 
A library maintains a record of books and their authors. If an author is removed, their books should not be deleted, but their author information should be set to NULL.

Tasks:
Create an Authors table:

AuthorID (PRIMARY KEY, AUTO_INCREMENT)
AuthorName (NOT NULL, UNIQUE)
Create a Books table:

BookID (PRIMARY KEY, AUTO_INCREMENT)
BookTitle (NOT NULL, UNIQUE)
AuthorID (FOREIGN KEY )
Insert sample data (at least 3 authors and 5 books).

Delete an author and check if books remain, but the AuthorID is set to NULL.

Update the author of a book to a new author.


*/

CREATE TABLE Authors (AuthorID INT PRIMARY KEY AUTO_INCREMENT, AuthorName VARCHAR(100) NOT NULL UNIQUE);


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(150) NOT NULL UNIQUE,
    AuthorID INT,
    FOREIGN KEY (AuthorID)
    REFERENCES Authors(AuthorID)
    ON DELETE SET NULL
);



INSERT INTO Authors (AuthorName)
VALUES
('Chetan Bhagat'),
('R.K. Narayan'),
('Rabindranath Tagore');


INSERT INTO Books (BookTitle, AuthorID)
VALUES
('Five Point Someone', 1),
('Half Girlfriend', 1),
('Malgudi Days', 2),
('The Guide', 2),
('Gitanjali', 3);


SELECT * FROM Authors;

SELECT * FROM Books;


DELETE FROM Authors WHERE AuthorID = 1;


SELECT * FROM Books;


INSERT INTO Authors (AuthorName) VALUES ('William Shakespeare');


UPDATE Books SET AuthorID = 4 WHERE BookID = 1;