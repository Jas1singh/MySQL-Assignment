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

    print("\n===== company employee management system =====")
    print("1. add department")
    print("2. add employee")
    print("3. display employees with department")
    print("4. search employee by name")
    print("5. update employee salary")
    print("6. update employee department")
    print("7. delete employee")
    print("8. department-wise employee count")
    print("9. department-wise average salary")
    print("10. employees earning more than average salary")
    print("11. employees earning more than department average")
    print("12. employees working in IT department")
    print("13. departments having more than one employee")
    print("14. employee and manager names")
    print("15. departments with no employees")
    print("16. foreign key constraint test")
    print("17. exit")

    try:

        ch = int(input("\nenter your choice: "))

        # 1. add department
        if ch == 1:

            dept_id = int(input("enter department id: "))
            dept_name = input("enter department name: ")
            location = input("enter location: ")

            q = """
            insert into department_pdbc
            values (%s, %s, %s)
            """

            cur.execute(q, (dept_id, dept_name, location))

            con.commit()

            print("department inserted successfully.")

        # 2. add employee
        elif ch == 2:

            emp_id = int(input("enter employee id: "))
            emp_name = input("enter employee name: ")
            salary = float(input("enter salary: "))
            job_title = input("enter job title: ")
            dept_id = int(input("enter department id: "))

            manager_input = input("enter manager id (or press enter for null): ")

            if manager_input.strip() == "":
                manager_id = None
            else:
                manager_id = int(manager_input)

            q = """
            insert into employee_pdbc
            values (%s, %s, %s, %s, %s, %s)
            """

            cur.execute(
                q,
                (emp_id, emp_name, salary, job_title,
                 dept_id, manager_id)
            )

            con.commit()

            print("employee inserted successfully.")

        # 3. display employees with department using inner join
        elif ch == 3:

            q = """
            select
                e.emp_id,
                e.emp_name,
                e.job_title,
                e.salary,
                d.dept_name,
                d.location

            from employee_pdbc e

            inner join department_pdbc d
            on e.dept_id = d.dept_id
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nemp id | employee name | job title | salary | department | location")

                for r in rows:
                    print(r)

                print("records displayed successfully.")

            else:
                print("no records found.")

        # 4. search employee by name using like
        elif ch == 4:

            search_name = input("enter employee name to search: ")

            q = """
            select emp_id, emp_name, job_title, salary
            from employee_pdbc
            where emp_name like %s
            """

            cur.execute(q, ('%' + search_name + '%',))

            rows = cur.fetchall()

            if rows:

                print("\nmatching employees:")

                for r in rows:
                    print(r)

            else:
                print("no matching employee found.")

        # 5. update employee salary
        elif ch == 5:

            emp_id = int(input("enter employee id: "))
            salary = float(input("enter new salary: "))

            q = """
            update employee_pdbc
            set salary = %s
            where emp_id = %s
            """

            cur.execute(q, (salary, emp_id))

            con.commit()

            if cur.rowcount > 0:
                print("employee salary updated successfully.")
            else:
                print("no record found for the given id.")

        # 6. update employee department
        elif ch == 6:

            emp_id = int(input("enter employee id: "))
            dept_id = int(input("enter new department id: "))

            q = """
            update employee_pdbc
            set dept_id = %s
            where emp_id = %s
            """

            cur.execute(q, (dept_id, emp_id))

            con.commit()

            if cur.rowcount > 0:
                print("employee department updated successfully.")
            else:
                print("no record found for the given id.")

        # 7. delete employee
        elif ch == 7:

            emp_id = int(input("enter employee id: "))

            q = """
            delete from employee_pdbc
            where emp_id = %s
            """

            cur.execute(q, (emp_id,))

            con.commit()

            if cur.rowcount > 0:
                print("employee deleted successfully.")
            else:
                print("no record found for the given id.")

        # 8. department-wise employee count
        elif ch == 8:

            q = """
            select
                d.dept_name,
                count(e.emp_id) as employee_count

            from department_pdbc d

            inner join employee_pdbc e
            on d.dept_id = e.dept_id

            group by d.dept_id, d.dept_name
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\ndepartment | employee count")

                for r in rows:
                    print(r)

        # 9. department-wise average salary
        elif ch == 9:

            q = """
            select
                d.dept_name,
                avg(e.salary) as average_salary

            from department_pdbc d

            inner join employee_pdbc e
            on d.dept_id = e.dept_id

            group by d.dept_id, d.dept_name
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\ndepartment | average salary")

                for r in rows:
                    print(r)

        # 10. employees earning more than overall average salary
        elif ch == 10:

            q = """
            select
                emp_id,
                emp_name,
                salary

            from employee_pdbc

            where salary > (
                select avg(salary)
                from employee_pdbc
            )
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nemployees earning more than average salary:")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 11. employees earning more than department average
        elif ch == 11:

            q = """
            select
                e.emp_id,
                e.emp_name,
                d.dept_name,
                e.salary

            from employee_pdbc e

            inner join department_pdbc d
            on e.dept_id = d.dept_id

            where e.salary > (
                select avg(e2.salary)
                from employee_pdbc e2
                where e2.dept_id = e.dept_id
            )
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nemployees earning more than department average:")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 12. employees working in IT department
        elif ch == 12:

            q = """
            select
                emp_id,
                emp_name,
                salary

            from employee_pdbc

            where dept_id = (
                select dept_id
                from department_pdbc
                where dept_name = 'IT'
            )
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nIT department employees:")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 13. departments having more than one employee
        elif ch == 13:

            q = """
            select
                d.dept_name,
                count(e.emp_id) as employee_count

            from department_pdbc d

            inner join employee_pdbc e
            on d.dept_id = e.dept_id

            group by d.dept_id, d.dept_name

            having count(e.emp_id) > 1
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\ndepartments having more than one employee:")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 14. employee and manager names using self join
        elif ch == 14:

            q = """
            select
                e.emp_name as employee_name,
                m.emp_name as manager_name

            from employee_pdbc e

            inner join employee_pdbc m
            on e.manager_id = m.emp_id
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\nemployee name | manager name")

                for r in rows:
                    print(r)

            else:
                print("no records found.")

        # 15. departments with no employees
        elif ch == 15:

            q = """
            select
                d.dept_id,
                d.dept_name

            from department_pdbc d

            left join employee_pdbc e
            on d.dept_id = e.dept_id

            where e.emp_id is null
            """

            cur.execute(q)

            rows = cur.fetchall()

            if rows:

                print("\ndepartments with no employees:")

                for r in rows:
                    print(r)

            else:
                print("all departments have employees.")

        # 16. foreign key constraint test
        elif ch == 16:

            print("\n===== foreign key constraint test =====")
            print("1. insert employee with invalid department")
            print("2. update employee to invalid department")
            print("3. delete department referenced by employees")
            print("4. insert employee with invalid manager")

            test = int(input("enter test choice: "))

            if test == 1:

                emp_id = int(input("enter employee id: "))
                emp_name = input("enter employee name: ")
                salary = float(input("enter salary: "))
                job_title = input("enter job title: ")
                dept_id = int(input("enter invalid department id: "))
                manager_id = None

                q = """
                insert into employee_pdbc
                values (%s, %s, %s, %s, %s, %s)
                """

                cur.execute(
                    q,
                    (emp_id, emp_name, salary, job_title,
                     dept_id, manager_id)
                )

                con.commit()

            elif test == 2:

                emp_id = int(input("enter employee id: "))
                dept_id = int(input("enter invalid department id: "))

                q = """
                update employee_pdbc
                set dept_id = %s
                where emp_id = %s
                """

                cur.execute(q, (dept_id, emp_id))

                con.commit()

            elif test == 3:

                dept_id = int(input("enter department id to delete: "))

                q = """
                delete from department_pdbc
                where dept_id = %s
                """

                cur.execute(q, (dept_id,))

                con.commit()

            elif test == 4:

                emp_id = int(input("enter employee id: "))
                emp_name = input("enter employee name: ")
                salary = float(input("enter salary: "))
                job_title = input("enter job title: ")
                dept_id = int(input("enter valid department id: "))
                manager_id = int(input("enter invalid manager id: "))

                q = """
                insert into employee_pdbc
                values (%s, %s, %s, %s, %s, %s)
                """

                cur.execute(
                    q,
                    (emp_id, emp_name, salary, job_title,
                     dept_id, manager_id)
                )

                con.commit()

            else:
                print("invalid test choice.")
                continue

            print("operation completed successfully.")

        # 17. exit
        elif ch == 17:

            print("thank you for using company employee management system.")
            break

        else:

            print("invalid choice. please try again.")

    except mysql.connector.IntegrityError as e:

        con.rollback()

        print("foreign key or integrity constraint error.")
        print("operation could not be completed.")
        print(e)

    except ValueError:

        print("please enter valid input.")

    except mysql.connector.Error as e:

        con.rollback()

        print("database error:", e)

cur.close()
con.close()
