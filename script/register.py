#!C:/Users/Jem/AppData/Local/Programs/Python/Python31/python
import cgi 
import cgitb
import mysql.connector

cgitb.enable(display=1)

form = cgi.FieldStorage()

name = form.getvalue("name")
email = form.getvalue("email")
password = form.getvalue("password")

con = mysql.connector.connect(user="root", password="", host="localhost", database="db_quizard")
query = con.cursor()

statement="INSERT INTO `tbl_users` (`fld_userId`, `fld_userName`, `fld_userPass`, `fld_userEmail`) VALUES (NULL, '%s', '%s', '%s')"

query.execute(statement,(name, password, email))

con.commit()

query.close()
con.close()