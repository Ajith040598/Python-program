import random
from string import ascii_uppercase
import mysql.connector



mydb = mysql.connector.connect(

host="localhost",
user="root",
password="Ajithkumar@1",
database="DB2"

)



cursor = mydb.cursor()



for i in range(1,101):
    for j in range(1,11):
        cursor.execute("INSERT INTO orders (order_id, product_id ,order_amount) VALUES (%s, %s, %s)", (i, str(i).zfill(3), random.randrange(100,200)))



mydb.commit()



for i in range(len(ascii_uppercase)):
    cursor.execute("INSERT INTO inventory (productID, productName) VALUES (%s, %s)", (str(i+1).zfill(3), ascii_uppercase[i]))



mydb.commit()