import json
import pymysql as pymysql
import requests
# from flask import Flask, jsonify, request
# from flask_cors import CORS

# connection_3 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
# myCursor_3 = connection_3.cursor()
# print("Ready To pass value to DB")
# #check_string = "INSERT INTO saturday_req (date, pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2) VALUES (%s, %s, %s, %s, %s)"
# #check_string = "UPDATE `saturday_req` SET `pool_a_level_1`=%s,`pool_a_level_2`=%s,`pool_b_level_1`=%s,`pool_b_level_2`=%s WHERE `ID` = %s"
# check_string = "SELECT * FROM pto_record WHERE timestamp BETWEEN '12/01/2022' AND '12/07/2022'"
# val = ( 6,6,6,6,2)
# print("Sending Request as follows: " + check_string)
# myCursor_3.execute(check_string)
# my_table_l = myCursor_3.fetchall()
# print(my_table_l)
# connection_3.commit()
# connection_3.close()


# connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
# myCursor_2 = connection_2.cursor()
# check_string_2 = "SELECT pool , level FROM userlogin where id = %s"
# val = (1)
# print("Sending Request as follows: " + check_string_2)
# myCursor_2.execute(check_string_2,val)
# my_table_2 = myCursor_2.fetchall()
# print(my_table_2)
# connection_2.close()


# def getSatudayByDate(date):
#     connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
#     myCursor_2 = connection_2.cursor()
#     check_string_2 = "SELECT * FROM saturday_req where date = %s"
#     val=(date)
#     print("Sending Request as follows: " + check_string_2)
#     myCursor_2.execute(check_string_2,val)
#     my_table_2 = myCursor_2.fetchall()
#     print(my_table_2)
#     connection_2.close()
#     return my_table_2

# getSatudayByDate("7/1/2023")


# connection_3 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
# myCursor_3 = connection_3.cursor()
# print("Ready To pass value to DB")
# #check_string = "INSERT INTO saturday_req (date, pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2) VALUES (%s, %s, %s, %s, %s)"
# #check_string = "UPDATE `saturday_req` SET `pool_a_level_1`=%s,`pool_a_level_2`=%s,`pool_b_level_1`=%s,`pool_b_level_2`=%s WHERE `date` = %s"
# check_string = "UPDATE `saturday_req` SET `pool_a_level_1`=%s,`pool_a_level_2`=%s,`pool_b_level_1`=%s,`pool_b_level_2`=%s WHERE `date` = %s"
# val = ( 8, 8, 8, 8,"1/14/2023")
# print("Sending Request as follows: " + check_string)
# myCursor_3.execute(check_string, val)
# connection_3.commit()
# connection_3.close()


# connection_3 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
# myCursor_3 = connection_3.cursor()
# print("Ready To pass value to DB")
# #check_string = "INSERT INTO saturday_req (date, pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2) VALUES (%s, %s, %s, %s, %s)"
# check_string = "UPDATE `saturday_req` SET `pool_a_level_1`=1,`pool_a_level_2`=1,`pool_b_level_1`=2,`pool_b_level_2`=1 WHERE `date`=%s"
# val = ("1/21/2023")
# print("Sending Request as follows: " + check_string)
# myCursor_3.execute(check_string,val)
# connection_3.commit()
# connection_3.close()
connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
myCursor_2 = connection_2.cursor()
check_string_2 = "SELECT SUM(ptolist LIKE %s) AS \"1/7/2023\", SUM(ptolist LIKE %s) AS \"1/14/2023\", SUM(ptolist LIKE %s) AS \"1/14/2023\", SUM(ptolist LIKE %s) AS \"1/28/2023\" FROM pto_record;"
val = (("%\"date\": \"1/7/2023\", \"title\": \"Saturday\"%"),("%\"date\": \"1/7/2023\", \"title\": \"Saturday\"%"),("%\"date\": \"1/7/2023\", \"title\": \"Saturday\"%"),("%\"date\": \"1/7/2023\", \"title\": \"Saturday\"%"))
print(val)
print("Sending Request as follows: " + check_string_2)
myCursor_2.execute(check_string_2,val)
my_table_2 = myCursor_2.fetchall()
print(my_table_2)
connection_2.close()