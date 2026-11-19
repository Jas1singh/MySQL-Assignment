from database.connection import Database
from modal.student import Student

class StudentDao:
    def addStudent(self,student):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "insert into student (rollno,name,age,marks) values (%s,%s,%s,%s)"
        values = (student.rollno,student.name,student.age,student.marks)

        cursor.execute(query,values)
        connection.commit()
        cursor.close()
        connection.close()

        print("Student saved successfully")


    def getAll(self):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "select rollno,name,age,marks from student"
        
        cursor.execute(query)
        rows = cursor.fetchall()

        students = []
        for row in rows:
            student = Student(row[0],row[1],row[2],row[3])
            students.append(student)

        connection.commit()
        cursor.close()
        connection.close()
        return students

    
    def getByName(self,name):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "select * from student where name=%s"
        
        cursor.execute(query,(name,))
        row = cursor.fetchone()

        connection.commit()
        cursor.close()
        connection.close()

        if row is not None:
            student = Student(row[0],row[1],row[2],row[3])
            return student
        return None

    
    def deleteByName(self,name):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "delete from student where name=%s"
        
        cursor.execute(query,(name,))
        connection.commit()

        affectedrows = cursor.rowcount
        cursor.close()
        connection.close()
        return affectedrows

    
    def modifyStudent(self,student):
        db = Database()
        connection = db.connect()
        cursor = connection.cursor()
        query = "update student set name=%s,age=%s,marks=%s where rollno=%s"
        values = (student.name, student.age, student.marks, student.rollno)
        
        cursor.execute(query,values)
        connection.commit()

        affectedrows = cursor.rowcount
        cursor.close()
        connection.close()
        return affectedrows



