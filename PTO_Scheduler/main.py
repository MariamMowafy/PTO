import json
import pymysql as pymysql
import requests
from flask import Flask, jsonify, request
from flask_cors import CORS
import re

#method to get pool and level of user by id //done
#we get id from savelist //done
#minus from correct pool and level
#update db on chosen sat id
def fetch_pto():
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT date,pto,public FROM month"
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    connection_2.close()
    return my_table_2

def insert_PTO(date,pto):
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string_1 = "INSERT INTO month (date, pto,public) VALUES (%s, %s,8)"
    val = (date, pto)
    print("Sending Request as follows: " + check_string_1)
    myCursor_l.execute(check_string_1, val)
    connection_l.commit()
    connection_l.close()

def insert_public(date,public):
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string_1 = "INSERT INTO month (date, pto,public) VALUES (%s, 8,%s)"
    val = (date, public)
    print("Sending Request as follows: " + check_string_1)
    myCursor_l.execute(check_string_1, val)
    connection_l.commit()
    connection_l.close()

def update_PTO(date,record):
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string_1 = "UPDATE `month` SET `pto`= %s WHERE `date` = %s"
    val = (record,date)
    print("Sending Request as follows: " + check_string_1)
    myCursor_l.execute(check_string_1, val)
    connection_l.commit()
    connection_l.close()

def update_public(date,record):
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string_1 = "UPDATE `month` SET `public`= %s WHERE `date` = %s"
    val = (record,date)
    print("Sending Request as follows: " + check_string_1)
    myCursor_l.execute(check_string_1, val)
    connection_l.commit()
    connection_l.close()

def getSatudayByDate(date):
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT * FROM saturday_req where date = %s"
    val=(date)
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2,val)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    connection_2.close()
    return my_table_2

def getPTOByDate(date):
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT * FROM month where date = %s"
    val=(date)
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2,val)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    connection_2.close()
    return my_table_2

def getUserById(id):
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT pool , level FROM userlogin where id = %s"
    val=(id)
    #val = (id)
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2,val)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    return(my_table_2)
    connection_2.close()

def updateRequirements(a1,a2,b1,b2,date):
    connection_3 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_3 = connection_3.cursor()
    print("Ready To pass value to DB")
    #check_string = "INSERT INTO saturday_req (date, pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2) VALUES (%s, %s, %s, %s, %s)"
    check_string = "UPDATE `saturday_req` SET `pool_a_level_1`= %s,`pool_a_level_2`= %s,`pool_b_level_1`= %s,`pool_b_level_2`= %s WHERE `date` = %s"
    #check_string = "SELECT * FROM pto_record WHERE timestamp BETWEEN '12/01/2022' AND '12/07/2022'"
    val = (a1,a2,b1,b2,date)
    print("Sending Request as follows: " + check_string)
    myCursor_3.execute(check_string,val)
    my_table_l = myCursor_3.fetchall()
    print(my_table_l)
    connection_3.commit()
    connection_3.close()

def sendToDB(ownerID, ownerName, ptolist):
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string_1 = "INSERT INTO pto_record (ownerID, ownerName, ptolist) VALUES (%s, %s, %s)"
    val = (ownerID, ownerName, json.dumps(ptolist))
    print("Sending Request as follows: " + check_string_1)
    myCursor_l.execute(check_string_1, val)
    connection_l.commit()
    connection_l.close()
    for record in ptolist:
        if record['title']=="Saturday":
            x=re.split('(|, |)|,',str(getUserById(ownerID)))
            #need to check on the date to fetch saturday requirements from tht date
            req = getSatudayByDate(str(record['date']))
            pool=x[6]
            level=x[12]
            if pool=='0':
                if level=='0':
                    if req[0][2]>0:
                        updateRequirements(req[0][2]-1,req[0][3],req[0][4],req[0][5],str(record['date']))
                        #print(req[2])
                else:
                    if req[0][3]>0:
                        updateRequirements(req[0][2],req[0][3]-1,req[0][4],req[0][5],str(record['date']))
                        # print(req[3])
            elif level =='0':
                if req[0][4]>0:
                    updateRequirements(req[0][2],req[0][3],req[0][4]-1,req[0][5],str(record['date']))
                    # print(req[4])
            else:
                if req[0][5]>0:
                    updateRequirements(req[0][2],req[0][3],req[0][4],req[0][5]-1,str(record['date']))
                    # print(req[5])
        else:
            if record['title']=="PTO":
            # x=re.split('(|, |)|,',str(getUserById(ownerID)))
            #need to check on the date to fetch saturday requirements from tht date
                req = getPTOByDate(str(record['date']))
                # print(req[0])
                if len(req) != 0:
                    update_PTO(str(record['date']),req[0][2]-1)
                            #print(req[2])
                else:
                    insert_PTO(str(record['date']),7)
            else:
                if record['title']=="Public":
            # x=re.split('(|, |)|,',str(getUserById(ownerID)))
            #need to check on the date to fetch saturday requirements from tht date
                    req = getPTOByDate(str(record['date']))
                    # print(req[0])
                    if len(req) != 0:
                        update_public(str(record['date']),req[0][3]-1)
                                #print(req[2])
                    else:
                        insert_public(str(record['date']),7)

def login_db(user, password):
    pool = 0
    level = 0
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To login")
    check_string = "SELECT * FROM userlogin WHERE nt_name='" + user + "';"
    print("Sending Request as follows: " + check_string)
    myCursor_l.execute(check_string)
    my_table_l = myCursor_l.fetchall()
    print(my_table_l)
    isMod = 0
    if len(my_table_l) == 0:
        print("No Record for this Email Please Register")
        connection_l.close()
        return 0, isMod, pool, level
    else:
        real_pass = my_table_l[0][2]
        print("Real Pass is: " + real_pass)
        print("Entered Pass is: " + password)
        if real_pass == password:
            print("LOGIN IS SUCCESSFUL!")
            # global user
            # global user_name
            # global nt_name
            # global isMod
            # nt_name = my_table[0][3]
            # user_name = my_table[0][1]
            # isMod = my_table[0][5]
            # user = User(ident=my_table[0][0], n_t=my_table[0][3], first=my_table[0][1],
            #             last=my_table[0][2], is_mod=my_table[0][5])
            # print(user)
            # login_window.withdraw()
            # need to send ID and name
            user_id = my_table_l[0][0]
            isMod = my_table_l[0][3]
            pool = my_table_l[0][4]
            level = my_table_l[0][5]
            connection_l.commit()
            connection_l.close()
            return user_id, isMod,pool,level
        else:
            print("CREDENTIALS ARE WRONG!!!")
            connection_l.close()
            return 500, isMod, pool, level
    
def fetch_all_data():
    connection_l = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_l = connection_l.cursor()
    print("Ready To pass value to DB")
    check_string = "SELECT * FROM pto_record"
    print("Sending Request as follows: " + check_string)
    myCursor_l.execute(check_string)
    myTable = myCursor_l.fetchall()
    # print(myTable)
    connection_l.commit()
    connection_l.close()
    return myTable

def fetch_saturday():
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT * FROM saturday_req"
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    connection_2.close()
    return my_table_2

def get_dates():
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT date FROM saturday_req"
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2)
    my_table_2 = myCursor_2.fetchall()
    #print(type(my_table_2[0][0]))
    print(my_table_2)
    connection_2.close()
    return my_table_2

def fetch_counts():
    dates_raw = get_dates()
    dates=[]
    for i in range(len(dates_raw)):
        dates.append(dates_raw[i][0])
    print(dates)
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    if (len(dates) == 4):
        check_string_2 = "SELECT SUM(ptolist LIKE %s), SUM(ptolist LIKE %s), SUM(ptolist LIKE %s), SUM(ptolist LIKE %s) FROM pto_record;"
        val = (("%\"date\": \""+dates[0]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[1]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[2]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[3]+"\", \"title\": \"Saturday\"%"))
    if (len(dates) == 5):
        check_string_2 = "SELECT SUM(ptolist LIKE %s) , SUM(ptolist LIKE %s) , SUM(ptolist LIKE %s) , SUM(ptolist LIKE %s) FROM pto_record;"
        val = (("%\"date\": \""+dates[0]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[1]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[2]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[3]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[4]+"\", \"title\": \"Saturday\"%"))
    if (len(dates) == 3):
        check_string_2 = "SELECT SUM(ptolist LIKE %s) , SUM(ptolist LIKE %s), SUM(ptolist LIKE %s) , SUM(ptolist LIKE %s) FROM pto_record;"
        val = (("%\"date\": \""+dates[0]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[1]+"\", \"title\": \"Saturday\"%"),("%\"date\": \""+dates[2]+"\", \"title\": \"Saturday\"%"))
    #print("Sending Request as follows: " + check_string_2)
    print(val)
    myCursor_2.execute(check_string_2,val)
    my_table_2 = myCursor_2.fetchall()
    #print(my_table_2)
    connection_2.close()
    return my_table_2

def fetch_users():
    connection_2 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_2 = connection_2.cursor()
    check_string_2 = "SELECT * FROM userlogin"
    print("Sending Request as follows: " + check_string_2)
    myCursor_2.execute(check_string_2)
    my_table_2 = myCursor_2.fetchall()
    print(my_table_2)
    connection_2.close()
    return my_table_2

def update_saturday(pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2,date):
    connection_3 = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
    myCursor_3 = connection_3.cursor()
    print("########################### Ready To pass value to DB ###########################")
    # check_string = "INSERT INTO saturday_req (date, pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2) VALUES (%s, %s, %s, %s, %s)"
    check_string = "UPDATE `saturday_req` SET `pool_a_level_1`=%s,`pool_a_level_2`=%s,`pool_b_level_1`=%s,`pool_b_level_2`=%s WHERE `date`=%s"
    val = (pool_a_level_1, pool_a_level_2, pool_b_level_1, pool_b_level_2,date)
    print("########################### Sending Request as follows: " + check_string)
    myCursor_3.execute(check_string,val)
    connection_3.commit()
    connection_3.close()

connection = pymysql.connect(host='localhost', user='root', password='', db='ptodb')
myCursor = connection.cursor()
print("CONNECTED")
connection.close()

app = Flask(__name__)
app.config['CORS_HEADERS'] = 'Content-Type'
tasks = [
    {
        'id': 1,
        'title': u'Buy groceries',
        'description': u'Milk, Cheese, Pizza, Fruit, Tylenol',
        'done': False
    },
    {
        'id': 2,
        'title': u'Learn Python',
        'description': u'Need to find a good Python tutorial on the web',
        'done': False
    }
]
CORS(app)

# cors = CORS(app, resources={r'/savelist': {'origins': '*'}})


@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': tasks})

@app.route('/savelist', methods=['POST'])
def post_list():
    print("dakhalt savelist")
    payload = request.json
    print("****")
    print(payload)
    print("****")
    # if(payload['pto'].contains("Saturday")):
    #     jd
    sendToDB(payload['ownerID'], payload['name'], payload['pto'])
    print("hakhrog men savelist")
    return jsonify({'status': "OK"})
    # wjdata = payload['value']
    # print(wjdata)
    # print(wjdata['ownerID'])
    # print(wjdata['name'])
    # print(wjdata['pto'])

@app.route('/getAll', methods=['GET'])
def get_list():
    fetch_all_data()
    return jsonify(fetch_all_data())

@app.route('/getCount', methods=['GET'])
def get_counts():
    fetch_counts()
    return jsonify(fetch_counts())

@app.route('/getSaturdayRequirements', methods=['GET'])
def get_sat():
    fetch_saturday()
    return jsonify(fetch_saturday())

@app.route('/getPTOReq', methods=['GET'])
def get_pto():
    fetch_pto()
    return jsonify(fetch_pto())

@app.route('/savesat', methods=['POST'])
def post_sat():
    print("########################### dakhalt savesat ###########################")
    payload = request.json
    update_saturday(payload['pool_a_level_1'], payload['pool_a_level_2'], payload['pool_b_level_1'], payload['pool_b_level_2'],payload['date'])
    print("########################### hakhrog men savesat ###########################")
    return jsonify({'status': "OK"})

@app.route('/savepto', methods=['POST'])
def post_pto():
    print("########################### dakhalt pto ###########################")
    payload = request.json
    check_PTO(payload['ptolist'])
    print("########################### hakhrog men pto ###########################")
    return jsonify({'status': "OK"})
 
@app.route('/getUsers', methods=['GET'])
def get_users():
    fetch_users()
    return jsonify(fetch_users())

@app.route('/login', methods=['POST'])
def login():
    print("Request reached Server")
    # print(request.form)
    # print(request.get_json())
    payload = request.json
    print(type(payload))
    user = payload['name']
    password = payload['password']
    print(user)
    print(password)
    # result shall be 0:table is empty, 500:wrong creds, any other integer: id of user
    result_integer,isMod,pool,level = login_db(user, password)
    print(result_integer)
    if result_integer == 0:
        result_integer = "TABLE IS EMPTY"
    elif result_integer == 500:
        result_integer = "WRONG CREDS"
    return jsonify({'status_': result_integer, 'isMod': isMod, 'pool': pool ,'level':level})
    # return jsonify({'status': "OK"})

if __name__ == '__main__':
    print("Starting . . . ")
    app.run(host='localhost', port=8080, debug=True,threaded = True)
