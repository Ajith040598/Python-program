import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Ajithkumar@1",
    database="newdb"
)
mycursor = mydb.cursor()


#databse

#mycursor.execute("show databases")
#for x in mycursor:
 #   print(x)


##insertingsingle

#sql = "insert into customers(name,address) values(%s,%s)"
#val = ("Ajith","Highway 21")
#mycursor.execute(sql,val)
#mydb.commit()
#print(mycursor.rowcount,"record inserted")


##addcolumn

#mycursor.execute("ALTER TABLE customers ADD COLUMN id int not null auto_increment primary key")


##insertingmany##
#sql="insert into customers (name,address) values(%s,%s)"
#val = [
#    ('ashok','lowstreet 4'),
#    ('peter','apple st 652'),
#    ('hannah','mountain 21'),
#    ('anand','usa dc')
#]

#mycursor.executemany(sql,val)
#mydb.commit()
#print(mycursor.rowcount,"was inserted")



mycursor.execute("select * from customers")
myresult = mycursor.fetchall()
for x in myresult:
    print(x)

#mydb.commit()

