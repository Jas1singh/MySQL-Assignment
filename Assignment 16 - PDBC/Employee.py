# Assignment 16 - Management Systems with PDBC 



import mysql.connector

con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="employee_db"
)

cur = con.cursor()

while True:

    print("\n===== employee management system =====")
    print("1. add employee")
    print("2. display all employees")
    print("3. search employee by name")
    print("4. update employee salary")
    print("5. delete employee")
    print("6. exit")

    ch = int(input("\nenter your choice: "))

    # 1. add employee
    if ch == 1:

        eid = int(input("enter employee id: "))
        ename = input("enter employee name: ")
        department = input("enter department: ")
        salary = float(input("enter salary: "))
        city = input("enter city: ")

        q = """
        insert into employee_pdbc
        values (%s, %s, %s, %s, %s)
        """

        cur.execute(q, (eid, ename, department, salary, city))
        con.commit()

        print("employee inserted successfully.")

    # 2. display all employees
    elif ch == 2:

        cur.execute("select * from employee_pdbc")

        rows = cur.fetchall()

        if rows:
            print("\nid   name       department       salary       city")
            print("----------------------------------------------------")

            for r in rows:
                print(r)

            print("records displayed successfully.")
        else:
            print("no records found.")

    # 3. search employee by name using like
    elif ch == 3:

        search_name = input("enter name to search: ")

        q = "select * from employee_pdbc where ename like %s"

        cur.execute(q, ('%' + search_name + '%',))

        rows = cur.fetchall()

        if rows:
            print("\nmatching employees:")

            for r in rows:
                print(r)
        else:
            print("no matching employee found.")

    # 4. update employee salary
    elif ch == 4:

        eid = int(input("enter employee id: "))
        salary = float(input("enter new salary: "))

        q = "update employee_pdbc set salary = %s where eid = %s"

        cur.execute(q, (salary, eid))
        con.commit()

        if cur.rowcount > 0:
            print("employee salary updated successfully.")
        else:
            print("no record found for the given id.")

    # 5. delete employee
    elif ch == 5:

        eid = int(input("enter employee id: "))

        q = "delete from employee_pdbc where eid = %s"

        cur.execute(q, (eid,))
        con.commit()

        if cur.rowcount > 0:
            print("employee deleted successfully.")
        else:
            print("no record found for the given id.")

    # 6. exit
    elif ch == 6:

        print("thank you for using employee management system.")
        break

    else:
        print("invalid choice. please try again.")

cur.close()
con.close()
