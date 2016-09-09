# -*- coding: utf-8 -*-


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
        c.close()

    def _get_operation_list(self):
        operations = ' '
        for elem in self.data.list_operations.all():
            operations += unicode.encode(unicode(elem), "cp1251")
        return operations


class GetShows(object):
    def __init__(self, textusername, textpassword, texthostname, database, data):
        self.textusername = textusername
        self.textpassword = textpassword
        self.texthostname = texthostname
        self.database = database
        self.code = data

        try:
            db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
            c = db.cursor()
            query = "SELECT views FROM Object_Live WHERE code= %s" % self.code
            c.execute(query)
            self.data = c.fetchall()
        except:
            pass
        finally:
            c.close()
            db.close()

    def data_return(self):
        if self.data:
            return '%s' % self.data[0]
        else:
            return None