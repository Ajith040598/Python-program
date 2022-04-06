import random
from string import ascii_uppercase
import mysql.connector

mydb = mysql.connector.connect(

host="localhost",
user="root",
password="Ajithkumar@1",
database="retail"

)


cursor = mydb.cursor()


for i in range(1,101):
    for j in range(1,11):
        cursor.execute("INSERT INTO order1 (order_data, order_id, product_id, customer_id, quentity, amount) VALUES (%s, %s, %s, %s, %s, %s)", (i, str(i).zfill(6), random.randrange(100,200)))



mydb.commit()



for i in range(len(ascii_uppercase)):
    cursor.execute("INSERT INTO inventory (productID, productName) VALUES (%s, %s)", (str(i+1).zfill(3), ascii_uppercase[i]))



mydb.commit()