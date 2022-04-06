import mysql.connector
from mysql.connector import errorcode
try:
    cnx = mysql.connector.connect(user='root',password ='Ajithkumar@1',host = 'localhost',database = 'newdb')
    mycursor = cnx.cursor()
    mycursor.execute("CREATE TABLE customers3(name varchar(250),address varchar(250))")
    mycursor.execute("SHOW TABLES")
    for x in mycursor:
        print(x)
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("something is wrong with your user and password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exit")
    else:
        print(err)
else:
    cnx.close()