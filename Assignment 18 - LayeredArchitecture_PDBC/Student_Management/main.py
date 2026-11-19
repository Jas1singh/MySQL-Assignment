from services.studentServices import StudentService
from modal.student import Student

print("Welcome to our Software")

service = StudentService()

while True:
    print("1. Add Student ")
    print("2. Display all Students ")
    print("3. Display student by Name ")
    print("4. Delete student by Name ")
    print("5. Update Student ")
    print("6. Exit ")

    choice = int(input("Enter your choice: "))

    if choice ==1:
        rollno = int(input("Enter roll no: "))
        name = input("Enter name: ")
        age = int(input("Enter age: "))
        marks = int(input("Enter marks: "))

        student = Student(rollno,name,age,marks)
        service.addStudent(student)

    elif choice==2:
        service.displayAllStudent()

    elif choice==3:
        name = input("Enter name of Student to search: ")
        service.searchStudent(name)

    elif choice==4:
        name = input("Enter name of Student to delete: ")
        service.removeStudent(name)

    elif choice==5:
        rollno = int(input("Enter roll no: "))
        name = input("Enter name: ")
        age = int(input("Enter age: "))
        marks = int(input("Enter marks: "))

        student = Student(rollno,name,age,marks)
        service.updateStudent(student)

    elif choice==6:
        print("Application closed")
        break


    
