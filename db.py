import pymysql

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="123456"
)

cursor = conn.cursor()

cursor.execute("CREATE DATABASE shopdb")

print("Đã tạo database shopdb")
