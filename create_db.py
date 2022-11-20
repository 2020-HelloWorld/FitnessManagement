# to create db once
import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "password",
)
cursor = mydb.cursor()
cursor.execute("CREATE DATABASE fitnessmanagement")
cursor.execute("SHOW DATABASES")
for db in cursor:
    print(db)