from database.connection import Database
from modal.employee import Employee

class EmployeeDao:
    def addEmployee(self,employee):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "insert into employee (id,name,salary) values (%s,%s,%s)"
        values = (employee.rollno,employee.name,employee.age,employee.marks)

        cursor.execute(query,values)
        connection.commit()
        cursor.close()
        connection.close()

        print("Employee saved successfully")


    def getAll(self):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "select id,name,salary from employee"
        
        cursor.execute(query)
        rows = cursor.fetchall()

        employees = []
        for row in rows:
            employee = Employee(row[0],row[1],row[2])
            employees.append(employee)

        connection.commit()
        cursor.close()
        connection.close()
        return employees

    
    def getByName(self,name):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "select * from employee where name=%s"
        
        cursor.execute(query,(name,))
        row = cursor.fetchone()

        connection.commit()
        cursor.close()
        connection.close()

        if row is not None:
            employee = Employee(row[0],row[1],row[2],row[3])
            return employee
        return None

    
    def deleteByName(self,name):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "delete from employee where name=%s"
        
        cursor.execute(query,(name,))
        connection.commit()

        affectedrows = cursor.rowcount
        cursor.close()
        connection.close()
        return affectedrows

    
    def modifyEmployee(self,employee):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "update employee set name=%s,salary=%s,where id=%s"
        values = (employee.name, employee.salary, employee.id)
        
        cursor.execute(query,values)
        connection.commit()

        affectedrows = cursor.rowcount
        cursor.close()
        connection.close()
        return affectedrows



