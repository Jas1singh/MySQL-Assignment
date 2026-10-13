# Assignment 50 - MySQL 2 
/* Question 7: 

Create and Insert into products Table
Columns:

product_id INT

product_name VARCHAR(100)

category VARCHAR(50)

price DECIMAL(7,2)

stock_quantity INT

supplier_name VARCHAR(100)

manufacture_date DATE

expiry_date DATE

Task:

Insert 6 products (some with expiry dates, some without)

*/


CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(7,2),
    stock_quantity INT,
    supplier_name VARCHAR(100),
    manufacture_date DATE,
    expiry_date DATE
);


INSERT INTO products
(product_id, product_name, category, price, stock_quantity,
 supplier_name, manufacture_date, expiry_date)
VALUES
(1, 'Milk', 'Dairy', 60.00, 100,
 'Fresh Dairy Ltd', '2026-09-01', '2026-09-10'),

(2, 'Biscuits', 'Snacks', 30.00, 200,
 'Tasty Foods', '2026-08-15', '2027-02-15'),

(3, 'Rice', 'Grocery', 80.00, 150,
 'Grain Suppliers', '2026-07-01', NULL),

(4, 'Notebook', 'Stationery', 50.00, 300,
 'Paper World', '2026-06-10', NULL),

(5, 'Yogurt', 'Dairy', 40.00, 80,
 'Fresh Dairy Ltd', '2026-09-05', '2026-09-20'),

(6, 'Cooking Oil', 'Grocery', 150.00, 120,
 'Golden Oils', '2026-08-01', NULL);
 

SELECT * FROM products;