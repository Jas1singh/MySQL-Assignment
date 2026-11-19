# Assignment 17 - Management Systems with PDBC 


import mysql.connector

con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="pdbc"
)

cur = con.cursor()

while True:

    print("\n===== online shopping order management =====")
    print("1. add customer")
    print("2. add product")
    print("3. place order")
    print("4. display all orders")
    print("5. search customer by name")
    print("6. update product price")
    print("7. update order status")
    print("8. delete order")
    print("9. customer-wise total purchase amount")
    print("10. products costing more than average price")
    print("11. customers who have placed orders")
    print("12. customers who have not placed orders")
    print("13. foreign key test")
    print("14. exit")

    try:
        ch = int(input("\nenter your choice: "))

        # 1. add customer
        if ch == 1:

            customer_id = int(input("enter customer id: "))
            customer_name = input("enter customer name: ")
            city = input("enter city: ")
            email = input("enter email: ")

            q = """
            insert into customer_order_pdbc
            values (%s, %s, %s, %s)
            """

            cur.execute(
                q,
                (customer_id, customer_name, city, email)
            )

            con.commit()

            print("customer inserted successfully.")

        # 2. add product
        elif ch == 2:

            product_id = int(input("enter product id: "))
            product_name = input("enter product name: ")
            category = input("enter category: ")
            price = float(input("enter price: "))
            stock = int(input("enter stock: "))

            q = """
            insert into product_order_pdbc
            values (%s, %s, %s, %s, %s)
            """

            cur.execute(
                q,
                (product_id, product_name, category, price, stock)
            )

            con.commit()

            print("product inserted successfully.")

        # 3. place order
        elif ch == 3:

            order_id = int(input("enter order id: "))
            customer_id = int(input("enter customer id: "))
            product_id = int(input("enter product id: "))
            quantity = int(input("enter quantity: "))
            order_status = input("enter order status: ")

            q = """
            insert into customer_order_details
            values (%s, %s, %s, %s, %s)
            """

            cur.execute(
                q,
                (order_id, customer_id, product_id,
                 quantity, order_status)
            )

            con.commit()

            print("order placed successfully.")

        # 4. display all orders using inner join
        elif ch == 4:

            q = """
            select
                o.order_id,
                c.customer_name,
                p.product_name,
                o.quantity,
                p.price,
                o.quantity * p.price as amount,
                o.order_status

            from customer_order_details o

            inner join customer_order_pdbc c
            on o.customer_id = c.customer_id

            inner join product_order_pdbc p
            on o.product_id = p.product_id
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\norder id | customer | product | quantity | price | amount | status")

                for r in rows:
                    print(r)

                print("records displayed successfully.")

            else:
                print("no records found.")

        # 5. search customer using like
        elif ch == 5:

            search_name = input("enter customer name to search: ")

            q = """
            select customer_id, customer_name, city
            from customer_order_pdbc
            where customer_name like %s
            """

            cur.execute(q, ('%' + search_name + '%',))

            rows = cur.fetchall()

            if rows:

                print("\nmatching customers:")

                for r in rows:
                    print(r)

            else:
                print("no matching customer found.")

        # 6. update product price
        elif ch == 6:

            product_id = int(input("enter product id: "))
            price = float(input("enter new price: "))

            q = """
            update product_order_pdbc
            set price = %s
            where product_id = %s
            """

            cur.execute(q, (price, product_id))

            con.commit()

            if cur.rowcount > 0:
                print("product price updated successfully.")
            else:
                print("no record found for the given id.")

        # 7. update order status
        elif ch == 7:

            order_id = int(input("enter order id: "))
            status = input("enter new status: ")

            q = """
            update customer_order_details
            set order_status = %s
            where order_id = %s
            """

            cur.execute(q, (status, order_id))

            con.commit()

            if cur.rowcount > 0:
                print("order status updated successfully.")
            else:
                print("no record found for the given id.")

        # 8. delete order
        elif ch == 8:

            order_id = int(input("enter order id: "))

            q = """
            delete from customer_order_details
            where order_id = %s
            """

            cur.execute(q, (order_id,))

            con.commit()

            if cur.rowcount > 0:
                print("order deleted successfully.")
            else:
                print("no record found for the given id.")

        # 9. customer-wise total purchase amount
        elif ch == 9:

            q = """
            select
                c.customer_id,
                c.customer_name,
                sum(o.quantity * p.price) as total_amount

            from customer_order_pdbc c

            inner join customer_order_details o
            on c.customer_id = o.customer_id

            inner join product_order_pdbc p
            on o.product_id = p.product_id

            group by c.customer_id, c.customer_name

            order by c.customer_id
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\ncustomer id | customer name | total purchase")

                for r in rows:
                    print(r)

        # 10. products costing more than average price
        elif ch == 10:

            q = """
            select product_id, product_name, price
            from product_order_pdbc
            where price > (
                select avg(price)
                from product_order_pdbc
            )
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nproducts costing more than average price:")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 11. customers who have placed at least one order
        elif ch == 11:

            q = """
            select customer_id, customer_name
            from customer_order_pdbc
            where customer_id in (
                select customer_id
                from customer_order_details
            )
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 12. customers who have not placed any order
        elif ch == 12:

            q = """
            select
                c.customer_id,
                c.customer_name

            from customer_order_pdbc c

            left join customer_order_details o
            on c.customer_id = o.customer_id

            where o.order_id is null
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                for r in rows:
                    print(r)

            else:
                print("all customers have placed orders.")

        # 13. foreign key test
        elif ch == 13:

            print("foreign key constraint test")

            order_id = int(input("enter order id: "))
            customer_id = int(input("enter customer id: "))
            product_id = int(input("enter product id: "))
            quantity = int(input("enter quantity: "))
            status = input("enter order status: ")

            q = """
            insert into customer_order_details
            values (%s, %s, %s, %s, %s)
            """

            cur.execute(
                q,
                (order_id, customer_id, product_id, quantity, status)
            )

            con.commit()

            print("order placed successfully.")

        # 14. exit
        elif ch == 14:

            print("thank you for using online shopping system.")
            break

        else:
            print("invalid choice. please try again.")

    except mysql.connector.IntegrityError as e:

        con.rollback()

        print("foreign key or integrity constraint error.")
        print("order could not be inserted or updated.")
        print(e)

    except ValueError:

        print("please enter valid input.")

    except mysql.connector.Error as e:

        con.rollback()

        print("database error:", e)

cur.close()
con.close()

