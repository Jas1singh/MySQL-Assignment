# Assignment 16 - Product Inventory Management System 

/*
 Question 3: PRODUCT INVENTORY MANAGEMENT SYSTEM
=========================================================

SCENARIO
--------
A retail shop wants to manage product details, prices,
categories, and available stock using Python PDBC.

CONCEPTS TO PRACTICE
--------------------
1. INSERT
2. SELECT
3. UPDATE
4. DELETE
5. LIKE operator
6. Parameterized queries
7. commit()
8. fetchall()
9. Menu-driven programming


TABLE STRUCTURE
===============

Table Name: product_pdbc

Column       Data Type
--------------------------------
pid          INT PRIMARY KEY
pname        VARCHAR(60)
category     VARCHAR(40)
price        DECIMAL(10,2)
quantity     INT


SAMPLE DATA
===========

pid   pname       category       price       quantity
------------------------------------------------------------
301   Laptop      Electronics    55000.00    10
302   Mouse       Electronics      800.00    50
303   Keyboard    Electronics     1500.00    30
304   Notebook    Stationery       100.00   100
305   Pen         Stationery        20.00   200


MENU
====

===== PRODUCT INVENTORY SYSTEM =====
1. Add Product
2. Display All Products
3. Search Product by Name
4. Update Product Price
5. Delete Product
6. Exit

Enter your choice:


TASK 1: ADD PRODUCT
===================

INPUT
-----
Enter your choice: 1
Enter Product ID: 306
Enter Product Name: Monitor
Enter Category: Electronics
Enter Price: 12000
Enter Quantity: 15

OUTPUT
------
Product inserted successfully.


TASK 2: DISPLAY ALL PRODUCTS
============================

INPUT
-----
Enter your choice: 2

OUTPUT
------
ID    Product       Category       Price       Quantity
------------------------------------------------------------
301   Laptop        Electronics     55000.00    10
302   Mouse         Electronics       800.00    50
303   Keyboard      Electronics      1500.00    30
304   Notebook      Stationery        100.00   100
305   Pen           Stationery         20.00   200
306   Monitor       Electronics     12000.00    15


TASK 3: SEARCH PRODUCT BY NAME USING LIKE
=========================================

INPUT
-----
Enter your choice: 3
Enter product name to search: o

OUTPUT
------
Matching products:

ID    Product       Category       Price       Quantity
------------------------------------------------------------
301   Laptop        Electronics     55000.00    10
302   Mouse         Electronics       800.00    50
304   Notebook      Stationery        100.00   100
306   Monitor       Electronics     12000.00    15

NOTE
----
Use:
WHERE pname LIKE %s

Pass:
'%' + search_name + '%'


TASK 4: UPDATE PRODUCT PRICE
============================

INPUT
-----
Enter your choice: 4
Enter Product ID: 302
Enter New Price: 900

OUTPUT
------
Product price updated successfully.


TASK 5: DELETE PRODUCT
======================

INPUT
-----
Enter your choice: 5
Enter Product ID: 305

OUTPUT
------
Product deleted successfully.


TASK 6: EXIT
============

INPUT
-----
Enter your choice: 6

OUTPUT
------
Thank you for using Product Inventory System.




add these scenarios also:--

1. Display all products from Electronics category.
2. Display all products from Stationery category.
3. Search products whose names contain 'oo'.
4. Search products whose names start with 'M'.
5. Search products whose names end with 'e'.
6. Display products whose price is greater than 1000.
7. Display products whose quantity is less than 20.
8. Update product quantity.
9. Update product category.
10. Delete a product by ID.
11. Display products whose category contains 'tron'.
12. Search products by a user-provided price range.



SUGGESTED SUCCESS MESSAGES
==========================

INSERT:
Record inserted successfully.

SELECT:
Records displayed successfully.

UPDATE:
Record updated successfully.

DELETE:
Record deleted successfully.

NOT FOUND:
No record found for the given ID.

INVALID CHOICE:
Invalid choice. Please try again.

EXIT:
Thank you for using the system. give me complete solution
*/

create database pdbc;

use pdbc;

create table product_pdbc (
    pid int primary key,
    pname varchar(60),
    category varchar(40),
    price decimal(10,2),
    quantity int
);

insert into product_pdbc
(pid, pname, category, price, quantity)
values
(301, 'Laptop', 'Electronics', 55000, 10),
(302, 'Mouse', 'Electronics', 800, 50),
(303, 'Keyboard', 'Electronics', 1500, 30),
(304, 'Notebook', 'Stationery', 100, 100),
(305, 'Pen', 'Stationery', 20, 200);