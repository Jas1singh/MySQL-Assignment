# Assignment 4 - Management Systems 

/*
 Question 2: Product Management System

Create a products table with:

Product ID
Product Name
Category
Brand
City
Price
Stock
Rating
Manufacturing Date

Data Requirements
Insert at least 8 products.

Your data should include:

Categories: Electronics, Furniture, Clothing, Grocery
At least 5 different brands
Cities: Indore, Bhopal, Pune, Mumbai, Delhi
Price: ₹500 to ₹1,00,000
Stock: 0 to 100
Rating: 1 to 5
Manufacturing dates from 2021 to 2026
Some products with the same category
Some products with the same brand
Some similar prices
Some products with zero stock

SQL Queries
1. Find products whose price is greater than ₹30,000 AND rating is at least 4, but exclude products from Mumbai.

2. Find products whose stock is less than 20 OR price is greater than ₹75,000, and whose category is not Grocery.

3. Find products whose price is between ₹15,000 and ₹60,000 AND rating is between 3 and 5, and which were manufactured after 2022.

4. Find products from Indore, Pune, or Delhi whose price is greater than ₹20,000 AND stock is not 0.

5. Find products belonging to Electronics or Furniture using IN.

6. Find products belonging to Electronics, Clothing, or Grocery using IN.

7. Find products that are not from Indore or Bhopal using NOT IN.

8. Find products whose brand is not Samsung, LG, or Sony.

9. Find products whose price is between ₹10,000 and ₹50,000.

10. Find products whose stock is between 20 and 60.

11. Find products whose rating is between 3 and 5, and whose price is greater than ₹20,000.

12. Find products manufactured between 2023 and 2025, whose category is Electronics or Furniture.

13. Find products whose name starts with S.

14. Find products whose name contains phone anywhere.

15. Find products whose brand ends with a.

16. Find products from Indore or Pune, whose price is between ₹20,000 and ₹70,000, and whose rating is at least 4.

17. Find products belonging to Electronics or Furniture, whose stock is greater than 10, whose price is less than ₹60,000, and whose manufacturing date is after 2022.

18. Find products whose name contains the letter a, whose price is NOT between ₹10,000 and ₹50,000, and whose stock is greater than 5.

19. Find products manufactured between 2022 and 2025, belonging to Electronics, Clothing, or Furniture, having a rating greater than 3, and whose city is not Mumbai.

20. Find products whose name starts with S or M, whose city is not Indore or Mumbai, whose price is between ₹15,000 and ₹80,000, whose rating is at least 4, and whose manufacturing date is after 2023.
*/

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(30),
    brand VARCHAR(50),
    city VARCHAR(30),
    price INT,
    stock INT,
    rating DECIMAL(2,1),
    manufacturing_date DATE
);

INSERT INTO products
(product_id, product_name, category, brand, city, price,
 stock, rating, manufacturing_date)
VALUES
(1, 'Samsung Smartphone', 'Electronics', 'Samsung', 'Indore',
 45000, 25, 4.5, '2024-03-15'),

(2, 'LG Smart TV', 'Electronics', 'LG', 'Bhopal',
 55000, 15, 4.2, '2023-06-10'),

(3, 'Sony Headphones', 'Electronics', 'Sony', 'Pune',
 18000, 40, 4.4, '2025-01-20'),

(4, 'Wooden Dining Table', 'Furniture', 'UrbanLadder', 'Mumbai',
 35000, 10, 4.1, '2022-08-12'),

(5, 'Office Chair', 'Furniture', 'Godrej', 'Delhi',
 12000, 60, 3.8, '2024-04-05'),

(6, 'Cotton Shirt', 'Clothing', 'Zara', 'Indore',
 1500, 80, 4.0, '2023-11-18'),

(7, 'Running Shoes', 'Clothing', 'Puma', 'Pune',
 5000, 35, 4.3, '2025-05-22'),

(8, 'Grocery Package', 'Grocery', 'Natura', 'Mumbai',
 800, 0, 3.5, '2022-02-14'),

(9, 'MacBook Laptop', 'Electronics', 'Apple', 'Delhi',
 95000, 12, 4.8, '2026-01-10'),

(10, 'Smartphone Stand', 'Electronics', 'Samsung', 'Bhopal',
 25000, 0, 4.0, '2021-09-25');



 SELECT * FROM products;


 SELECT * FROM products
WHERE price > 30000
  AND rating >= 4
  AND city <> 'Mumbai';


SELECT * FROM products
WHERE (stock < 20 OR price > 75000)
  AND category <> 'Grocery';


SELECT * FROM products
WHERE price BETWEEN 15000 AND 60000
  AND rating BETWEEN 3 AND 5
  AND manufacturing_date >= '2023-01-01';


SELECT * FROM products
WHERE city IN ('Indore', 'Pune', 'Delhi')
  AND price > 20000
  AND stock <> 0;


SELECT * FROM products
WHERE category IN ('Electronics', 'Furniture');


SELECT * FROM products
WHERE category IN ('Electronics', 'Clothing', 'Grocery');


SELECT * FROM products
WHERE city NOT IN ('Indore', 'Bhopal');


SELECT * FROM products
WHERE brand NOT IN ('Samsung', 'LG', 'Sony');


SELECT * FROM products
WHERE price BETWEEN 10000 AND 50000;


SELECT * FROM products
WHERE stock BETWEEN 20 AND 60;


SELECT * FROM products
WHERE rating BETWEEN 3 AND 5
  AND price > 20000;


SELECT * FROM products
WHERE manufacturing_date BETWEEN '2023-01-01' AND '2025-12-31'
  AND category IN ('Electronics', 'Furniture');


SELECT * FROM products
WHERE product_name LIKE 'S%';


SELECT * FROM products
WHERE product_name LIKE '%phone%';


SELECT * FROM products
WHERE brand LIKE '%a';


SELECT * FROM products
WHERE city IN ('Indore', 'Pune')
  AND price BETWEEN 20000 AND 70000
  AND rating >= 4;


SELECT * FROM products
WHERE category IN ('Electronics', 'Furniture')
  AND stock > 10
  AND price < 60000
  AND manufacturing_date >= '2023-01-01';


SELECT * FROM products
WHERE product_name LIKE '%a%'
  AND price NOT BETWEEN 10000 AND 50000
  AND stock > 5;


SELECT * FROM products
WHERE manufacturing_date BETWEEN '2022-01-01' AND '2025-12-31'
  AND category IN ('Electronics', 'Clothing', 'Furniture')
  AND rating > 3
  AND city <> 'Mumbai';


SELECT * FROM products
WHERE (product_name LIKE 'S%' OR product_name LIKE 'M%')
  AND city NOT IN ('Indore', 'Mumbai')
  AND price BETWEEN 15000 AND 80000
  AND rating >= 4
  AND manufacturing_date >= '2024-01-01';

