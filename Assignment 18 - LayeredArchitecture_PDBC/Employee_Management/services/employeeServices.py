from dao.employeedao import EmployeeDao

class EmployeeService:

    def addEmployee(self,employee):
        if employee.id<=0:
            print("ID must be positive")
            return

        if employee.name.strip()=="":
            print("Name can not be empty")
            return

        print("Service : Processing Student")

        dao = EmployeeDao()
        dao.addEmployee(employee)


    def displayAllEmployee(self):
        dao = EmployeeDao()
        employees = dao.getAll()

        if len(employees)==0:
            print("No student found")
            return

        for employee in employees:
            print("ID : ",employee.id)
            print("Name : ",employee.name)
            print("Salary : ",employee.salary)
          


    def searchEmployee(self,name):
        dao = EmployeeDao()
        employee = dao.getByName(name)

        if employee is None:
            print("Student not found")

        else:
            print("ID : ",employee.id)
            print("Name : ",employee.name)
            print("Salary : ",employee.salary)

            
    def removeEmployee(self,name):
        dao = EmployeeDao()
        affectedrows = dao.deleteByName(name)

        if affectedrows > 0:
            print("Employee deleted successfully")

        else:
            print("Employee not found")



    def updateEmployee(self,employee):
        dao = EmployeeDao()

        if employee.name.strip()=="":
            print("Name can not be empty")
            return

        affectedrows = dao.modifyEmployee(employee)

        if affectedrows > 0:
            print("Employee updated successfully")

        else:
            print("Employee not found")
