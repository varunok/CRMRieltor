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
        # print(str(self.data.list_operations.all()[0]))

        db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
        c = db.cursor()
        query = "INSERT INTO Object_Live (code, title, description, address)" \
                "VALUES ('%s', '%s', '%s', '%s')" % \
                (str(self.data.id),
                 self._get_operation_list(),
                 str(self.data.comment),
                 unicode.encode(unicode(self.data.street_obj), "cp1251"))
        print(query)
        c.execute(query)
        # c.commit()

    def _get_operation_list(self):
        operations = ' '
        for elem in self.data.list_operations.all():
            operations += unicode.encode(unicode(elem), "cp1251")
        print(operations)
        return operations
