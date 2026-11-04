# Assignment 13 - Joins 

/*
 Question 2: 

Customer and Orders
Problem Statement:
A retail store wants to generate a report displaying all customers and their latest order details. The report should include customers who have not placed any orders.

Tables:
Customer (cust_id, cust_name)
Orders (order_id, cust_id, order_date, total_amount)
Query 1:
Write an SQL query using LEFT JOIN to display all customers with their order details, ensuring that customers with no orders are still included in the result.

Query 2:
Problem Statement:
The store wants to generate a report including all orders placed, even if the customer record is missing (i.e., orphan orders due to data inconsistency).

Query 3:
The store wants a comprehensive report showing all customers and all orders, even if some customers have no orders and some orders have missing customer details.

Query 4:
Problem Statement:
The store wants to analyze all possible customer-order pairings, regardless of actual transactions.

*/

use Joins;

create table customer (cust_id int, cust_name varchar(50));

create table orders (order_id int, cust_id int, order_date date, total_amount decimal(10,2));

insert into customer values (1, 'alice'), (2, 'bob'), (3, 'charlie'), (4, 'david');

insert into orders values (101, 1, '2026-10-01', 5000.00), (102, 2, '2026-10-05', 3000.00), (103, 1, '2026-10-10', 7000.00), (104, 5, '2026-10-12', 2000.00);

select customer.cust_id, customer.cust_name, orders.order_id, orders.order_date, orders.total_amount from customer left join orders on customer.cust_id = orders.cust_id;

select customer.cust_id, customer.cust_name, orders.order_id, orders.order_date, orders.total_amount from customer right join orders on customer.cust_id = orders.cust_id;

select customer.cust_id, customer.cust_name, orders.order_id, orders.order_date, orders.total_amount from customer left join orders on customer.cust_id = orders.cust_id union select customer.cust_id, customer.cust_name, orders.order_id, orders.order_date, orders.total_amount from customer right join orders on customer.cust_id = orders.cust_id;

select customer.cust_id, customer.cust_name, orders.order_id, orders.order_date, orders.total_amount from customer cross join orders;




