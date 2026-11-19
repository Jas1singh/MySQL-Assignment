from dao.studentdao import StudentDao

class StudentService:

    def addStudent(self,student):
        if student.rollno<=0:
            print("Roll no must be positive")
            return

        if student.name.strip()=="":
            print("Name can not be empty")
            return
        
        if student.age<0 and student.age>100:
            print("Invalid Age")
            return
        
        if student.marks<0 and student.marks>100:
            print("Invalid Marks")
            return

        print("Service : Processing Student")

        dao = StudentDao()
        dao.addStudent(student)


    def displayAllStudent(self):
        dao = StudentDao()
        students = dao.getAll()

        if len(students)==0:
            print("No student found")
            return

        for student in students:
            print("Rollno : ",student.rollno)
            print("Name : ",student.name)
            print("Age : ",student.age)
            print("Marks : ",student.marks)


    def searchStudent(self,name):
        dao = StudentDao()
        student = dao.getByName(name)

        if student is None:
            print("Student not found")

        else:
            print("Rollno : ",student.rollno)
            print("Name : ",student.name)
            print("Age : ",student.age)
            print("Marks : ",student.marks)

            
    def removeStudent(self,name):
        dao = StudentDao()
        affectedrows = dao.deleteByName(name)

        if affectedrows > 0:
            print("Student deleted successfully")

        else:
            print("Student not found")



    def updateStudent(self,student):
        dao = StudentDao()

        if student.name.strip()=="":
            print("Name can not be empty")
            return
        
        if student.age<0 and student.age>100:
            print("Invalid Age")
            return
        
        if student.marks<0 and student.marks>100:
            print("Invalid Marks")
            return

        affectedrows = dao.modifyStudent(student)

        if affectedrows > 0:
            print("Student updated successfully")

        else:
            print("Student not found")

        
