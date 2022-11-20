#https://dev.mysql.com/doc/connector-python/en/connector-python-example-cursor-select.html 
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database = "fitnessmanagement"
)

mycursor = mydb.cursor()
mycursor.execute("select id from user_info")
for id,fname in mycursor:
    print(id,fname)

