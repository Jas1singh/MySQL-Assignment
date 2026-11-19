# Assignment 16 - Product Inventory Management System 


import mysql.connector

con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="shop_db"
)

cur = con.cursor()

while True:

    print("\n===== product inventory management system =====")
    print("1. add product")
    print("2. display all products")
    print("3. search product by name")
    print("4. update product price")
    print("5. delete product")
    print("6. display electronics products")
    print("7. display stationery products")
    print("8. search products containing 'oo'")
    print("9. search products starting with 'm'")
    print("10. search products ending with 'e'")
    print("11. display products with price greater than 1000")
    print("12. display products with quantity less than 20")
    print("13. update product quantity")
    print("14. update product category")
    print("15. delete product by id")
    print("16. display category containing 'tron'")
    print("17. search products by price range")
    print("18. exit")

    ch = int(input("\nenter your choice: "))


    # 1. add product
    if ch == 1:

        pid = int(input("enter product id: "))
        pname = input("enter product name: ")
        category = input("enter category: ")
        price = float(input("enter price: "))
        quantity = int(input("enter quantity: "))

        q = """
        insert into product_pdbc
        values (%s, %s, %s, %s, %s)
        """

        cur.execute(q, (pid, pname, category, price, quantity))
        con.commit()

        print("record inserted successfully.")


    # 2. display all products
    elif ch == 2:

        cur.execute("select * from product_pdbc")

        rows = cur.fetchall()

        if rows:

            print("\nid   name       category       price       quantity")
            print("------------------------------------------------------------")

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 3. search product by name using like
    elif ch == 3:

        search_name = input("enter product name to search: ")

        q = "select * from product_pdbc where pname like %s"

        cur.execute(q, ('%' + search_name + '%',))

        rows = cur.fetchall()

        if rows:

            print("\nmatching products:")

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no matching product found.")


    # 4. update product price
    elif ch == 4:

        pid = int(input("enter product id: "))
        price = float(input("enter new price: "))

        q = "update product_pdbc set price = %s where pid = %s"

        cur.execute(q, (price, pid))
        con.commit()

        if cur.rowcount > 0:
            print("record updated successfully.")
        else:
            print("no record found for the given id.")


    # 5. delete product
    elif ch == 5:

        pid = int(input("enter product id: "))

        q = "delete from product_pdbc where pid = %s"

        cur.execute(q, (pid,))
        con.commit()

        if cur.rowcount > 0:
            print("record deleted successfully.")
        else:
            print("no record found for the given id.")


    # 6. display electronics products
    elif ch == 6:

        q = """
        select * from product_pdbc
        where category = %s
        """

        cur.execute(q, ('Electronics',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 7. display stationery products
    elif ch == 7:

        q = """
        select * from product_pdbc
        where category = %s
        """

        cur.execute(q, ('Stationery',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 8. search products containing 'oo'
    elif ch == 8:

        q = "select * from product_pdbc where pname like %s"

        cur.execute(q, ('%oo%',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 9. search products starting with 'm'
    elif ch == 9:

        q = "select * from product_pdbc where pname like %s"

        cur.execute(q, ('M%',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 10. search products ending with 'e'
    elif ch == 10:

        q = "select * from product_pdbc where pname like %s"

        cur.execute(q, ('%e',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 11. display products with price greater than 1000
    elif ch == 11:

        q = """
        select * from product_pdbc
        where price > %s
        """

        cur.execute(q, (1000,))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 12. display products with quantity less than 20
    elif ch == 12:

        q = """
        select * from product_pdbc
        where quantity < %s
        """

        cur.execute(q, (20,))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 13. update product quantity
    elif ch == 13:

        pid = int(input("enter product id: "))
        quantity = int(input("enter new quantity: "))

        q = """
        update product_pdbc
        set quantity = %s
        where pid = %s
        """

        cur.execute(q, (quantity, pid))
        con.commit()

        if cur.rowcount > 0:
            print("record updated successfully.")
        else:
            print("no record found for the given id.")


    # 14. update product category
    elif ch == 14:

        pid = int(input("enter product id: "))
        category = input("enter new category: ")

        q = """
        update product_pdbc
        set category = %s
        where pid = %s
        """

        cur.execute(q, (category, pid))
        con.commit()

        if cur.rowcount > 0:
            print("record updated successfully.")
        else:
            print("no record found for the given id.")


    # 15. delete product by id
    elif ch == 15:

        pid = int(input("enter product id: "))

        q = "delete from product_pdbc where pid = %s"

        cur.execute(q, (pid,))
        con.commit()

        if cur.rowcount > 0:
            print("record deleted successfully.")
        else:
            print("no record found for the given id.")


    # 16. display category containing 'tron'
    elif ch == 16:

        q = """
        select * from product_pdbc
        where category like %s
        """

        cur.execute(q, ('%tron%',))

        rows = cur.fetchall()

        if rows:

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 17. search products by user-provided price range
    elif ch == 17:

        min_price = float(input("enter minimum price: "))
        max_price = float(input("enter maximum price: "))

        q = """
        select * from product_pdbc
        where price between %s and %s
        """

        cur.execute(q, (min_price, max_price))

        rows = cur.fetchall()

        if rows:

            print("\nmatching products:")

            for r in rows:
                print(r)

            print("records displayed successfully.")

        else:
            print("no records found.")


    # 18. exit
    elif ch == 18:

        print("thank you for using the system.")
        break


    # invalid choice
    else:

        print("invalid choice. please try again.")


cur.close()
con.close()

