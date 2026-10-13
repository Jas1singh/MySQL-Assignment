# Assignment 50 - MySQL 2 
/* Question 9: 

You are designing a system to store movie reviews. Start with basic details and then evolve the table structure using ALTER, RENAME, TRUNCATE, and DROP, and perform INSERT operations at each stage.

 Initial Table Creation:
Create a table movie_reviews with the following columns:

review_id INT

movie_title VARCHAR(150)

reviewer_name VARCHAR(100)

rating DECIMAL(2,1)

review_text TEXT

 Insert 3 sample movie reviews

Step 1: Add More Columns (ALTER)
Add the following columns using ALTER:

review_date DATE

platform VARCHAR(50) — (e.g., IMDb, Rotten Tomatoes)

likes INT

 Insert 2 more rows with new columns

 Step 2: Rename a Column
Rename the column reviewer_name to critic_name

 Step 3: Modify Column Types
Modify:

rating to DECIMAL(3,1)

movie_title to VARCHAR(200)

 Step 4: Drop an Unnecessary Column
Drop the likes column

 Step 5: Truncate the Table
Truncate the table so all data is removed

 Step 6: Rename the Table
Rename movie_reviews to archived_reviews

 Step 7: Drop the Table
Finally, drop the archived_reviews table
*/


CREATE TABLE movie_reviews (
    review_id INT,
    movie_title VARCHAR(150),
    reviewer_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_text TEXT
);

INSERT INTO movie_reviews
(review_id, movie_title, reviewer_name, rating, review_text)
VALUES
(1, '3 Idiots', 'Rahul Sharma', 9.0,
 'An inspiring and entertaining movie.'),
(2, 'Dangal', 'Priya Verma', 8.5,
 'A powerful movie about determination.'),
(3, 'Inception', 'Amit Patel', 9.0,
 'An excellent science fiction thriller.');

SELECT * FROM movie_reviews;


ALTER TABLE movie_reviews
ADD review_date DATE,
ADD platform VARCHAR(50),
ADD likes INT;


INSERT INTO movie_reviews
(review_id, movie_title, reviewer_name, rating, review_text,
 review_date, platform, likes)
VALUES
(4, 'Interstellar', 'Neha Singh', 9.5,
 'A visually stunning and emotional film.',
 '2026-09-10', 'IMDb', 150),

(5, 'The Dark Knight', 'Rohan Gupta', 9.0,
 'An outstanding superhero crime drama.',
 '2026-09-12', 'Rotten Tomatoes', 200);


SELECT * FROM movie_reviews;


Rename reviewer_name to critic_name.


ALTER TABLE movie_reviews
RENAME COLUMN reviewer_name TO critic_name;


ALTER TABLE movie_reviews
MODIFY COLUMN rating DECIMAL(3,1);


ALTER TABLE movie_reviews
MODIFY COLUMN movie_title VARCHAR(200);


ALTER TABLE movie_reviews
DROP COLUMN likes;


TRUNCATE TABLE movie_reviews;


RENAME TABLE movie_reviews TO archived_reviews;


DROP TABLE archived_reviews;