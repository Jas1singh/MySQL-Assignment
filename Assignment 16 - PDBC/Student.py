# Assignment 16 - Management Systems with PDBC 


import mysql.connector

con = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="student_db"
)

cur = con.cursor()

while True:

    print("\n===== student management system =====")
    print("1. add student")
    print("2. display all students")
    print("3. search student by name")
    print("4. update student fees")
    print("5. delete student")
    print("6. exit")

    ch = int(input("\nenter your choice: "))

    # 1. add student
    if ch == 1:

        sid = int(input("enter student id: "))
        sname = input("enter student name: ")
        course = input("enter course: ")
        fees = float(input("enter fees: "))
        city = input("enter city: ")

        q = """
        insert into student_pdbc
        values (%s, %s, %s, %s, %s)
        """

        cur.execute(q, (sid, sname, course, fees, city))
        con.commit()

        print("student inserted successfully.")

    # 2. display all students
    elif ch == 2:

        cur.execute("select * from student_pdbc")

        rows = cur.fetchall()

        if rows:
            print("\nid   name       course       fees       city")
            print("------------------------------------------------")

            for r in rows:
                print(r)

            print("records displayed successfully.")
        else:
            print("no records found.")

    # 3. search student by name using like
    elif ch == 3:

        search_name = input("enter name to search: ")

        q = "select * from student_pdbc where sname like %s"

        cur.execute(q, ('%' + search_name + '%',))

        rows = cur.fetchall()

        if rows:
            print("\nmatching students:")

            for r in rows:
                print(r)
        else:
            print("no matching student found.")

    # 4. update student fees
    elif ch == 4:

        sid = int(input("enter student id: "))
        fees = float(input("enter new fees: "))

        q = "update student_pdbc set fees = %s where sid = %s"

        cur.execute(q, (fees, sid))
        con.commit()

        if cur.rowcount > 0:
            print("student fees updated successfully.")
        else:
            print("no record found for the given id.")

    # 5. delete student
    elif ch == 5:

        sid = int(input("enter student id: "))

        q = "delete from student_pdbc where sid = %s"

        cur.execute(q, (sid,))
        con.commit()

        if cur.rowcount > 0:
            print("student deleted successfully.")
        else:
            print("no record found for the given id.")

    # 6. exit
    elif ch == 6:

        print("thank you for using student management system.")
        break

    else:
        print("invalid choice. please try again.")

cur.close()
con.close()


