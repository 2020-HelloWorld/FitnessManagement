import mysql.connector 
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="gb",
  password="password"
)


mycursor = mydb.cursor()
mycursor.execute("show databases")
for x in mycursor:
    print(x)