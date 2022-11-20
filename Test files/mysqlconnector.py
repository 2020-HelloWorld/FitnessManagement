import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="gb",
  password="password",
  database = "FIT_MNG"
)
mycursor = mydb.cursor()
mycursor.execute(f'SELECT * FROM user_info where id like "USR1"')
for i in mycursor:
  print(i[0])
