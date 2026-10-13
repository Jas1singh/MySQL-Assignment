/*
 Assignment 49 - MySQL 1 
''' Question 3: 
PRODUCT MANAGEMENT SYSTEM

Q1. Create a database named shop_db and use the database.

Q2. Create a table named product with:
- product_id – INT, PRIMARY KEY, AUTO_INCREMENT
- product_name – VARCHAR(50)
- category – VARCHAR(50)
- brand – VARCHAR(50)
- price – INT
- quantity – INT

Q3. Insert the following 10 product records:

product_name | category | brand | price | quantity
Laptop | Electronics | Dell | 55000 | 10
Smartphone | Electronics | Samsung | 25000 | 15
Keyboard | Accessories | Logitech | 1500 | 25
Mouse | Accessories | HP | 800 | 30
Monitor | Electronics | LG | 18000 | 12
Headphones | Accessories | Sony | 3000 | 20
Printer | Electronics | Canon | 12000 | 8
Tablet | Electronics | Lenovo | 22000 | 14
Webcam | Accessories | Logitech | 2500 | 18
Speaker | Accessories | JBL | 4500 | 16

Q4. Display the structure of the product table using DESC.

Q5. Display all records from the product table.

*/

-- Q1. Create and use database
CREATE DATABASE shop_db;
USE shop_db;

-- Q2. Create product table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    brand VARCHAR(50),
    price INT,
    quantity INT
);

-- Q3. Insert 10 product records
INSERT INTO product
(product_name, category, brand, price, quantity)
VALUES
('Laptop', 'Electronics', 'Dell', 55000, 10),
('Smartphone', 'Electronics', 'Samsung', 25000, 15),
('Keyboard', 'Accessories', 'Logitech', 1500, 25),
('Mouse', 'Accessories', 'HP', 800, 30),
('Monitor', 'Electronics', 'LG', 18000, 12),
('Headphones', 'Accessories', 'Sony', 3000, 20),
('Printer', 'Electronics', 'Canon', 12000, 8),
('Tablet', 'Electronics', 'Lenovo', 22000, 14),
('Webcam', 'Accessories', 'Logitech', 2500, 18),
('Speaker', 'Accessories', 'JBL', 4500, 16);

-- Q4. Display table structure
DESC product;

-- Q5. Display all records
SELECT * FROM shop_db.product;
