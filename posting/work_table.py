# -*- coding: utf-8 -*-


import MySQLdb
from crm.settings import DATABASES_POST
from setting_globall.models import Franshise



class ConnectDatabases(object):
    """docstring for ConnectDatabases"""
    def __init__(self):
        franshise = Franshise.objects.values()
        franshise = franshise[0]['franshise'].replace('.', '')
        DATABASE = ''.join([DATABASES_POST['DATABASE'], franshise])
        self.textusername = DATABASES_POST['USER']
        self.textpassword = DATABASES_POST['PASS']
        self.texthostname = DATABASES_POST['HOST']
        self.database = DATABASE


class SearchData(ConnectDatabases):
    isFind = False
    def __init__(self, data):
        super(SearchData, self).__init__()
        self.code = data
        try:
            db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
            c = db.cursor()
            query = "SELECT id FROM Object_Live WHERE code= %s" % self.code
            c.execute(query)
            self.data = c.fetchall()
            self._isFind()
        except:
            pass
        finally:
            c.close()
            db.close()

    def _isFind(self):
        if self.data:
            self.isFind = True


class InsertData(ConnectDatabases):
    isPost = True

    def __init__(self, data):
            super(InsertData, self).__init__()
            self.data = data

        # try:
            db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
            c = db.cursor()
            query = "INSERT INTO Object_Live (code, title, description, address)" \
                    "VALUES ('%s', '%s', '%s', '%s')" % \
                    (str(self.data.id),
                     unicode.encode(unicode(self.data.title), "cp1251"),
                     str(self.data.comment),
                     unicode.encode(unicode(self.data.street_obj), "cp1251"))
            c.execute(query)
            # c.commit()
        # except:
        #     isPost = False
        # finally:
            c.close()
            db.close()

    def _get_operation_list(self):
        operations = ' '
        for elem in self.data.list_operations.all():
            operations += unicode.encode(unicode(elem), "cp1251")
        return operations


class GetShows(ConnectDatabases):
    def __init__(self, data):
        super(GetShows, self).__init__()
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


class SetShows(ConnectDatabases):
    """docstring for ClassName"""
    def __init__(self, data, active):
        super(SetShows, self).__init__()
        self.code = data
        self.active = active

        try:
            db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
            c = db.cursor()
            query = "UPDATE image20_testokua.Object_Live SET active=%s WHERE code='%s'" % (self.active, self.code)
            c.execute(query)
        except e:
            raise e
        finally:
            c.close()
            db.close()
