from services.employeeServices import EmployeeService
from modal.employee import Employee

print("Welcome to our Software")

service = EmployeeService()

while True:
    print("1. Add Employee ")
    print("2. Display all Employees ")
    print("3. Display employee by Name ")
    print("4. Delete employee by Name ")
    print("5. Update employee ")
    print("6. Exit ")

    choice = int(input("Enter your choice: "))

    if choice ==1:
        id = int(input("Enter ID: "))
        name = input("Enter Name: ")
        salary = int(input("Enter Salary : "))
       

        employee = Employee(id,name,salary)
        service.addEmployee(employee)

    elif choice==2:
        service.displayAllEmployee()

    elif choice==3:
        name = input("Enter name of Student to search: ")
        service.searchEmployee(name)

    elif choice==4:
        name = input("Enter name of Student to delete: ")
        service.removeEmployee(name)

    elif choice==5:
        id = int(input("Enter ID: "))
        name = input("Enter Name: ")
        salary = int(input("Enter Salary: "))
       

        employee = Employee(id,name,salary)
        service.updateEmployee(employee)

    elif choice==6:
        print("Application closed")
        break


    
