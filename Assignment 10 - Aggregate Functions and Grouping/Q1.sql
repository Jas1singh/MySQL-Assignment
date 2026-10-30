# Assignment 10 - Aggregate Functions and Grouping 

/*
 Question 1: 

table salses
=========================================================
| Column         | Data Type                               |
| -------------- | --------------------------------------- |
| sale_id        | INT                                     |
| customer_name  | VARCHAR(50)                             |
| city           | VARCHAR(30)                             |
| category       | VARCHAR(30)                             |
| product        | VARCHAR(50)                             |
| quantity       | INT                                     |
| price          | DECIMAL(10,2)                           |
| discount       | DECIMAL(10,2)                           |
| sale_date      | DATE                                    |
| payment_method | ENUM('UPI','Card','Cash','Net Banking') |
| status         | ENUM('Completed','Pending','Cancelled') |
| customer_type  | ENUM('New','Regular','Premium')         |
=========================================================


INSERT INTO sales
(customer_name, city, category, product, quantity, price, discount, sale_date, payment_method, status, customer_type)
VALUES
('Rahul','Indore','Electronics','Laptop',2,60000,5000,'2026-01-05','Card','Completed','Premium'),
('Priya','Bhopal','Electronics','Mobile',3,25000,3000,'2026-01-07','UPI','Completed','Regular'),
('Amit','Indore','Clothing','Jeans',5,2000,500,'2026-01-10','Cash','Completed','New'),
('Sneha','Mumbai','Beauty','Cream',8,800,400,'2026-01-12','UPI','Completed','Premium'),
('Rohit','Pune','Electronics','Laptop',1,55000,4000,'2026-01-15','Card','Completed','Regular'),
('Neha','Delhi','Clothing','Kurti',6,1800,600,'2026-01-17','UPI','Completed','Premium'),
('Karan','Indore','Sports','Bat',4,3500,700,'2026-01-20','Cash','Completed','Regular'),
('Pooja','Bhopal','Beauty','Lipstick',10,600,300,'2026-01-22','UPI','Completed','New'),
('Vikas','Delhi','Books','SQL Book',7,900,200,'2026-01-25','Net Banking','Completed','Regular'),
('Anjali','Mumbai','Electronics','Watch',3,7000,800,'2026-01-27','Card','Completed','Premium'),
('Saurabh','Pune','Grocery','Rice',12,900,500,'2026-02-01','UPI','Completed','Regular'),
('Riya','Delhi','Electronics','AC',2,45000,5000,'2026-02-03','Card','Completed','Premium'),
('Manish','Indore','Clothing','Shirt',6,1500,300,'2026-02-05','UPI','Completed','New'),
('Komal','Bhopal','Furniture','Chair',3,8000,1000,'2026-02-07','Cash','Completed','Premium'),
('Deepak','Mumbai','Electronics','Speaker',5,3000,500,'2026-02-12','Card','Cancelled','Regular');


Questions===>

Find the total number of completed sales for each city where quantity is greater than 2. Display cities in descending order of sales count.
Find the total quantity sold for each category where discount is greater than 300. Display highest quantity first.
Find the total sales amount for each city for completed sales only. Display highest-selling city first.
Find the average product price for each category where quantity is at least 3. Display categories by average price descending.
Find the number of sales for each customer type where the order amount (quantity * price) is greater than 5000. Sort by number of sales descending.
Find the total discount given for each city for UPI transactions. Display highest discount first.
Find the total quantity sold through each payment method for completed transactions. Sort by total quantity descending.
Find the average discount for each category where quantity is greater than 4. Display highest average discount first.
Find the maximum product price for each city where the status is Completed. Sort by maximum price descending.
Find the minimum product price for each category where discount is greater than 300. Sort by minimum price ascending.
Find cities having more than 2 completed sales. Sort cities by completed sales count descending.
Find categories having total quantity greater than 10. Sort by total quantity descending.
Find cities having total sales greater than 50,000. Sort by total sales descending.
Find customer types having average product price greater than 10,000. Sort by average price descending.
Find categories having average discount greater than 400. Sort by average discount descending.
Find payment methods having more than 2 completed transactions. Sort by transaction count descending.
Find cities where the maximum product price is greater than 20,000. Sort by maximum price descending.
Find categories where the minimum product price is less than 2,000. Sort by minimum price ascending.
Find customer types where total discount is greater than 2,000. Sort by total discount descending.
Find cities where average quantity per transaction is greater than 4. Sort by average quantity descending.
Find each city’s total sales for completed UPI transactions where quantity is greater than 2. Display only cities having total sales greater than 10,000.
Find each category’s total quantity for completed transactions where discount is greater than 300. Display only categories having total quantity greater than 5.
Find each customer type’s average price for completed transactions where quantity >= 2. Display only customer types whose average price exceeds 10,000.
Find each city’s total discount for UPI transactions where quantity > 3. Display cities having total discount greater than 500.
Find each category’s total sales where payment method is UPI or Card and status is Completed. Display categories having total sales greater than 10,000.
Find each city’s transaction count for January 2026 completed transactions. Display cities having at least 2 transactions.
Find each category’s average sales amount where quantity >= 3 and status = Completed. Display categories whose average sales amount is greater than 5,000.
Find each customer type’s maximum price where payment method is Card and status is Completed. Display only customer types whose maximum price exceeds 20,000.
Find each city’s total quantity for Electronics and Clothing products where status is Completed. Display cities having total quantity greater than 5.
Find each payment method’s total sales where status is Completed and discount is greater than 400. Display payment methods having total sales greater than 20,000.
Find cities having more than 2 completed transactions and total sales greater than 50,000. Sort by total sales descending.
Find categories having total quantity greater than 8 and average price greater than 2,000. Sort by total quantity descending.
Find customer types having more than 2 transactions and total discount greater than 2,000. Sort by total discount descending.
Find cities having average quantity greater than 3 and maximum product price greater than 20,000. Sort by average quantity descending.
Find categories having more than 2 completed transactions and total sales greater than 20,000. Sort by total sales descending.
Find payment methods having more than 2 completed transactions and average price greater than 10,000. Sort by average price descending.
Find cities having total quantity greater than 8 and average discount greater than 300. Sort by total quantity descending.
Find customer types having average price greater than 5,000 and total quantity greater than 8. Sort by total quantity descending.
Find categories having minimum price below 2,000 and maximum price above 20,000. Sort by maximum price descending.
Find cities having total discount greater than 1,000 and total sales greater than 30,000. Sort by total sales descending.
Find the top 3 cities based on total sales, considering only completed transactions with quantity greater than 1 and displaying only cities having more than 1 transaction.
Find the top 3 categories based on total quantity where discount is greater than 300 and total quantity is greater than 5.
Find the top 3 customer types based on average sales amount where status is Completed and transaction count is greater than 1.
Find the top 3 cities based on total discount for UPI transactions where status is Completed and total discount is greater than 500.
Find the top 3 categories based on total sales where quantity is greater than 2, average price is greater than 1,000, and total sales exceeds 10,000.
Find the top 3 cities based on average order value where status is Completed, total quantity is greater than 5, and transaction count is greater than 1.
Find the second-highest city based on total sales after considering only completed transactions and cities having at least 2 transactions.
Find the third-highest category based on total quantity where quantity is greater than 2 and total discount exceeds 500.
Find the 2nd and 3rd highest customer types based on total sales where status is Completed and average price is greater than 5,000.
Find the top 3 cities where:
status is Completed
payment method is UPI or Card
quantity is greater than 1
number of transactions is greater than 1
total quantity is greater than 5
total sales is greater than 20,000
*/


USE Group_By_Clause;


create table sales (sale_id INT, customer_name VARCHAR(50), city VARCHAR(30), category VARCHAR(30), product VARCHAR(50), quantity int, price DECIMAL(10,2), discount DECIMAL(10,2), sale_date date, payment_method ENUM('UPI','Card','Cash','Net Banking'), status ENUM('Completed','Pending','Cancelled'), customer_type ENUM('New','Regular','Premium'));

INSERT INTO sales
(customer_name, city, category, product, quantity, price, discount,
 sale_date, payment_method, status, customer_type)
VALUES
('Rahul','Indore','Electronics','Laptop',2,60000,5000,'2026-01-05','Card','Completed','Premium'),
('Priya','Bhopal','Electronics','Mobile',3,25000,3000,'2026-01-07','UPI','Completed','Regular'),
('Amit','Indore','Clothing','Jeans',5,2000,500,'2026-01-10','Cash','Completed','New'),
('Sneha','Mumbai','Beauty','Cream',8,800,400,'2026-01-12','UPI','Completed','Premium'),
('Rohit','Pune','Electronics','Laptop',1,55000,4000,'2026-01-15','Card','Completed','Regular'),
('Neha','Delhi','Clothing','Kurti',6,1800,600,'2026-01-17','UPI','Completed','Premium'),
('Karan','Indore','Sports','Bat',4,3500,700,'2026-01-20','Cash','Completed','Regular'),
('Pooja','Bhopal','Beauty','Lipstick',10,600,300,'2026-01-22','UPI','Completed','New'),
('Vikas','Delhi','Books','SQL Book',7,900,200,'2026-01-25','Net Banking','Completed','Regular'),
('Anjali','Mumbai','Electronics','Watch',3,7000,800,'2026-01-27','Card','Completed','Premium'),
('Saurabh','Pune','Grocery','Rice',12,900,500,'2026-02-01','UPI','Completed','Regular'),
('Riya','Delhi','Electronics','AC',2,45000,5000,'2026-02-03','Card','Completed','Premium'),
('Manish','Indore','Clothing','Shirt',6,1500,300,'2026-02-05','UPI','Completed','New'),
('Komal','Bhopal','Furniture','Chair',3,8000,1000,'2026-02-07','Cash','Completed','Premium'),
('Deepak','Mumbai','Electronics','Speaker',5,3000,500,'2026-02-12','Card','Cancelled','Regular');



SELECT city, COUNT(*) AS total_sales
FROM sales
WHERE status = 'Completed'
AND quantity > 2
GROUP BY city
ORDER BY total_sales DESC;



SELECT category, SUM(quantity) AS total_quantity
FROM sales
WHERE discount > 300
GROUP BY category
ORDER BY total_quantity DESC;


SELECT city, SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_sales DESC;


SELECT category, AVG(price) AS average_price
FROM sales
WHERE quantity >= 3
GROUP BY category
ORDER BY average_price DESC;


SELECT customer_type, COUNT(*) AS total_sales
FROM sales
WHERE quantity * price > 5000
GROUP BY customer_type
ORDER BY total_sales DESC;


SELECT city, SUM(discount) AS total_discount
FROM sales
WHERE payment_method = 'UPI'
GROUP BY city
ORDER BY total_discount DESC;


SELECT payment_method, SUM(quantity) AS total_quantity
FROM sales
WHERE status = 'Completed'
GROUP BY payment_method
ORDER BY total_quantity DESC;


SELECT category, AVG(discount) AS average_discount
FROM sales
WHERE quantity > 4
GROUP BY category
ORDER BY average_discount DESC;


SELECT city, MAX(price) AS maximum_price
FROM sales
WHERE status = 'Completed'
GROUP BY city
ORDER BY maximum_price DESC;


SELECT category, MIN(price) AS minimum_price
FROM sales
WHERE discount > 300
GROUP BY category
ORDER BY minimum_price ASC;


SELECT city, COUNT(*) AS total_sales
FROM sales
WHERE status = 'Completed'
GROUP BY city
HAVING COUNT(*) > 2
ORDER BY total_sales DESC;


SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
HAVING SUM(quantity) > 10
ORDER BY total_quantity DESC;


SELECT city, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY city
HAVING SUM(quantity * price) > 50000
ORDER BY total_sales DESC;


SELECT customer_type, AVG(price) AS average_price
FROM sales
GROUP BY customer_type
HAVING AVG(price) > 10000
ORDER BY average_price DESC;


SELECT category, AVG(discount) AS average_discount
FROM sales
GROUP BY category
HAVING AVG(discount) > 400
ORDER BY average_discount DESC;


SELECT payment_method, COUNT(*) AS total_transactions
FROM sales
WHERE status = 'Completed'
GROUP BY payment_method
HAVING COUNT(*) > 2
ORDER BY total_transactions DESC;


SELECT city, MAX(price) AS maximum_price
FROM sales
GROUP BY city
HAVING MAX(price) > 20000
ORDER BY maximum_price DESC;


SELECT category, MIN(price) AS minimum_price
FROM sales
GROUP BY category
HAVING MIN(price) < 2000
ORDER BY minimum_price ASC;


SELECT customer_type, SUM(discount) AS total_discount
FROM sales
GROUP BY customer_type
HAVING SUM(discount) > 2000
ORDER BY total_discount DESC;


SELECT city, AVG(quantity) AS average_quantity
FROM sales
GROUP BY city
HAVING AVG(quantity) > 4
ORDER BY average_quantity DESC;


SELECT city, SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
AND payment_method = 'UPI'
AND quantity > 2
GROUP BY city
HAVING SUM(quantity * price) > 10000;


SELECT category, SUM(quantity) AS total_quantity
FROM sales
WHERE status = 'Completed'
AND discount > 300
GROUP BY category
HAVING SUM(quantity) > 5;


SELECT customer_type, AVG(price) AS average_price
FROM sales
WHERE status = 'Completed'
AND quantity >= 2
GROUP BY customer_type
HAVING AVG(price) > 10000;


SELECT city, SUM(discount) AS total_discount
FROM sales
WHERE payment_method = 'UPI'
AND quantity > 3
GROUP BY city
HAVING SUM(discount) > 500;


SELECT category, SUM(quantity * price) AS total_sales
FROM sales
WHERE payment_method IN ('UPI', 'Card')
AND status = 'Completed'
GROUP BY category
HAVING SUM(quantity * price) > 10000;


SELECT city, COUNT(*) AS total_transactions
FROM sales
WHERE sale_date BETWEEN '2026-01-01' AND '2026-01-31'
AND status = 'Completed'
GROUP BY city
HAVING COUNT(*) >= 2;


SELECT category, AVG(quantity * price) AS average_sales
FROM sales
WHERE quantity >= 3
AND status = 'Completed'
GROUP BY category
HAVING AVG(quantity * price) > 5000;


SELECT customer_type, MAX(price) AS maximum_price
FROM sales
WHERE payment_method = 'Card'
AND status = 'Completed'
GROUP BY customer_type
HAVING MAX(price) > 20000;


SELECT city, SUM(quantity) AS total_quantity
FROM sales
WHERE category IN ('Electronics', 'Clothing')
AND status = 'Completed'
GROUP BY city
HAVING SUM(quantity) > 5;


SELECT payment_method, SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
AND discount > 400
GROUP BY payment_method
HAVING SUM(quantity * price) > 20000;


SELECT city,
       COUNT(*) AS total_transactions,
       SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
GROUP BY city
HAVING COUNT(*) > 2
AND SUM(quantity * price) > 50000
ORDER BY total_sales DESC;


SELECT category,
       SUM(quantity) AS total_quantity,
       AVG(price) AS average_price
FROM sales
GROUP BY category
HAVING SUM(quantity) > 8
AND AVG(price) > 2000
ORDER BY total_quantity DESC;


SELECT customer_type,
       COUNT(*) AS total_transactions,
       SUM(discount) AS total_discount
FROM sales
GROUP BY customer_type
HAVING COUNT(*) > 2
AND SUM(discount) > 2000
ORDER BY total_discount DESC;


SELECT city,
       AVG(quantity) AS average_quantity,
       MAX(price) AS maximum_price
FROM sales
GROUP BY city
HAVING AVG(quantity) > 3
AND MAX(price) > 20000
ORDER BY average_quantity DESC;



SELECT category,
       COUNT(*) AS total_transactions,
       SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
GROUP BY category
HAVING COUNT(*) > 2
AND SUM(quantity * price) > 20000
ORDER BY total_sales DESC;


SELECT payment_method,
       COUNT(*) AS total_transactions,
       AVG(price) AS average_price
FROM sales
WHERE status = 'Completed'
GROUP BY payment_method
HAVING COUNT(*) > 2
AND AVG(price) > 10000
ORDER BY average_price DESC;


SELECT city,
       SUM(quantity) AS total_quantity,
       AVG(discount) AS average_discount
FROM sales
GROUP BY city
HAVING SUM(quantity) > 8
AND AVG(discount) > 300
ORDER BY total_quantity DESC;


SELECT customer_type,
       AVG(price) AS average_price,
       SUM(quantity) AS total_quantity
FROM sales
GROUP BY customer_type
HAVING AVG(price) > 5000
AND SUM(quantity) > 8
ORDER BY total_quantity DESC;


SELECT category,
       MIN(price) AS minimum_price,
       MAX(price) AS maximum_price
FROM sales
GROUP BY category
HAVING MIN(price) < 2000
AND MAX(price) > 20000
ORDER BY maximum_price DESC;


SELECT city,
       SUM(discount) AS total_discount,
       SUM(quantity * price) AS total_sales
FROM sales
GROUP BY city
HAVING SUM(discount) > 1000
AND SUM(quantity * price) > 30000
ORDER BY total_sales DESC;


SELECT city,
       SUM(quantity * price) AS total_sales,
       COUNT(*) AS total_transactions
FROM sales
WHERE status = 'Completed'
AND quantity > 1
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY total_sales DESC
LIMIT 3;


SELECT category, SUM(quantity) AS total_quantity
FROM sales
WHERE discount > 300
GROUP BY category
HAVING SUM(quantity) > 5
ORDER BY total_quantity DESC
LIMIT 3;


SELECT customer_type,
       AVG(quantity * price) AS average_sales,
       COUNT(*) AS total_transactions
FROM sales
WHERE status = 'Completed'
GROUP BY customer_type
HAVING COUNT(*) > 1
ORDER BY average_sales DESC
LIMIT 3;


SELECT city, SUM(discount) AS total_discount
FROM sales
WHERE payment_method = 'UPI'
AND status = 'Completed'
GROUP BY city
HAVING SUM(discount) > 500
ORDER BY total_discount DESC
LIMIT 3;


SELECT category,
       SUM(quantity * price) AS total_sales,
       AVG(price) AS average_price
FROM sales
WHERE quantity > 2
GROUP BY category
HAVING AVG(price) > 1000
AND SUM(quantity * price) > 10000
ORDER BY total_sales DESC
LIMIT 3;



SELECT city,
       AVG(quantity * price) AS average_order_value,
       SUM(quantity) AS total_quantity,
       COUNT(*) AS total_transactions
FROM sales
WHERE status = 'Completed'
GROUP BY city
HAVING SUM(quantity) > 5
AND COUNT(*) > 1
ORDER BY average_order_value DESC
LIMIT 3;


SELECT city,
       SUM(quantity * price) AS total_sales,
       COUNT(*) AS total_transactions
FROM sales
WHERE status = 'Completed'
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_sales DESC
LIMIT 1 OFFSET 1;


SELECT category,
       SUM(quantity) AS total_quantity,
       SUM(discount) AS total_discount
FROM sales
WHERE quantity > 2
GROUP BY category
HAVING SUM(discount) > 500
ORDER BY total_quantity DESC
LIMIT 1 OFFSET 2;



SELECT customer_type,
       SUM(quantity * price) AS total_sales,
       AVG(price) AS average_price
FROM sales
WHERE status = 'Completed'
GROUP BY customer_type
HAVING AVG(price) > 5000
ORDER BY total_sales DESC
LIMIT 2 OFFSET 1;



SELECT city,
       COUNT(*) AS total_transactions,
       SUM(quantity) AS total_quantity,
       SUM(quantity * price) AS total_sales
FROM sales
WHERE status = 'Completed'
AND payment_method IN ('UPI', 'Card')
AND quantity > 1
GROUP BY city
HAVING COUNT(*) > 1
AND SUM(quantity) > 5
AND SUM(quantity * price) > 20000
ORDER BY total_sales DESC
LIMIT 3;