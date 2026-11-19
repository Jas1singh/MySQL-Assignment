import mysql.connector

class Database:
    def connect(self):
        connection = mysql.connector.connect(host="localhost",user="root",password="My@6263249061",database="layered_pdbc")
        return connection