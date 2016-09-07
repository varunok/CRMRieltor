# -*- coding: utf-8 -*-


# import mysql.connector
# from mysql.connector import errorcode
#
#
# class InsertData():
#     def __init__(self, textusername, textpassword, texthostname, database, data):
#         self.textusername = textusername
#         self.textpassword = textpassword
#         self.texthostname = texthostname
#         self.database = database
#         self.data = data
#         try:
#             db = mysql.connector.connect(user=self.textusername,
#                                          password=self.textpassword,
#                                          host=self.texthostname,
#                                          database=self.database)
#             cursor = db.cursor()
#             stmt = "INSERT INTO Object_Daily (description) VALUES (%s)"
#             cursor.executemany(stmt, self.data)
#             db.commit()
#         except mysql.connector.Error as err:
#             if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
#                 print("Something is wrong with your user name or password")
#             elif err.errno == errorcode.ER_BAD_DB_ERROR:
#                 print("Database does not exist")
#             else:
#                 print(err)
#         finally:
#             cursor.close()
#             db.close()


import MySQLdb

class InsertData():
    def __init__(self, textusername, textpassword, texthostname, database, data):
        self.textusername = textusername
        self.textpassword = textpassword
        self.texthostname = texthostname
        self.database = database
        self.data = data
        # print((str(self.data.street_obj).decode('utf-8')))
        # print((unicode(self.data.street_obj)))
        # print((u'oki'))

        db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
        db.use_unicode = True
        c = db.cursor()
        query = "INSERT INTO Object_Live (code, address)" \
                "VALUES ('"+unicode(self.data.id)+"', '"+unicode(self.data.street_obj)+"')"
        print(query)
        c.execute(query)
        # c.commit()
