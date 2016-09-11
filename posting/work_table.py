# -*- coding: utf-8 -*-


import os
import shutil
import uuid
import MySQLdb
from crm.settings import DATABASES_POST
from setting_globall.models import Franshise
from facility.models import ImagesFacility



class ConnectDatabases(object):
    """docstring for ConnectDatabases"""
    def __init__(self):
        self.franshise = Franshise.objects.values()
        self.franshise_colaps = self.franshise[0]['franshise'].replace('.', '')
        DATABASE = ''.join([DATABASES_POST['DATABASE'], self.franshise_colaps])
        self.textusername = DATABASES_POST['USER']
        self.textpassword = DATABASES_POST['PASS']
        self.texthostname = DATABASES_POST['HOST']
        self.database = DATABASE


class SavePhoto(ConnectDatabases):
    """docstring for SavePhoto"""
    def __init__(self, objectId, objectCode, districtId):
        super(SavePhoto, self).__init__()
        self.objectId = objectId
        self.objectCode = objectCode
        self.districtId = districtId

        db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
        c = db.cursor()
        self.query = "INSERT INTO Object_Photo_Live (objectId, objectCode, photo, districtId) VALUES (%s, %s, %s, %s)"
        self.values = self._get_images()
        c.executemany(self.query, self.values)
        c.close()
        db.close()

    def _get_images(self):
        # try:
        self.abs_path = '/'.join(os.getcwd().split('/')[0:5])
        os.makedirs(''.join([self.abs_path, '/', self.franshise[0]['franshise'], '/data/object/live/', str(self.objectId), '/']))
        # except:
            # pass
        self.images_list = []
        images = ImagesFacility.objects.filter(album=str(self.objectCode))
        for ele in images:
            img_to = self._copy_image(ele.image).split('/')
            print(img_to)
            self.images_list.append((self.objectId, self.objectCode, img_to, self.districtId))
        return self.images_list

    def _copy_image(self, img):
            img_from = ''.join([os.getcwd(), '/media/', str(img)])
            img_to = ''.join([self.abs_path, '/', self.franshise[0]['franshise'], '/data/object/live/', str(self.objectId), '/', str(uuid.uuid1()), '.jpg' ])
            shutil.copy2(img_from, img_to)
            return img_to


class District(ConnectDatabases):
    """docstring for GetDistrict"""
    def __init__(self, arg=None):
        super(District, self).__init__()
        self.arg = arg

        try:
            db = MySQLdb.connect(user=self.textusername, passwd=self.textpassword, host=self.texthostname, db=self.database, autocommit=True)
            c = db.cursor()
            query = "SELECT * FROM District"
            c.execute(query)
            self.data = c.fetchall()
        except:
            pass
        finally:
            c.close()
            db.close()
        
    def get_district(self):
        return self.data


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
            query = "INSERT INTO Object_Live (code, title, operationType, plan," \
                    "description, address, type, districtId, floor, square, totalFloors," \
                    "roomsNumber, priceUSD, price, contactPerson, contactPhone, video, panoramaCode)" \
                    "VALUES ('%s', '%s', '%s', %s, '%s', '%s', '%d', '%s', %s, %s, %s, %s, %s, %s, '%s', '%s', '%s', '%s')" % \
                    (str(self.data.id),
                     self._get_title(unicode.encode(unicode(self.data.title), "cp1251")),
                     self._get_operationType(self.data.list_operations.all()),
                     self._get_room(self.data.room_id),
                     str(self.data.comment),
                     unicode.encode(unicode(self.data.street_obj), "cp1251"),
                     self._get_type(self.data.type_facilit_id),
                     self._get_district_id(self.data.district_obj),
                     self._get_floor(self.data.floor),
                     self._get_total_area(self.data.total_area),
                     self._get_floors_up(self.data.floors_up),
                     self._get_rooms(self.data.rooms),
                     self._get_price_bay(self.data.price_bay),
                     self._get_price_month(self.data.price_month),
                     self._get_name_owner(unicode.encode(unicode(self.data.name_owner), "cp1251")),
                     self._get_phone_owner(unicode.encode(unicode(self.data.phone_owner), "cp1251")),
                     self._get_youtube(unicode.encode(unicode(self.data.youtube), "cp1251")),
                     self._get_panorama(unicode.encode(unicode(self.data.panorama), "cp1251")))
            c.execute(query)
            query = "SELECT id FROM Object_Live WHERE code=%s" % str(self.data.id)
            c.execute(query)
            self.id_obj = c.fetchone()[0]
            SavePhoto(self.id_obj, str(self.data.id), self._get_district_id(self.data.district_obj))
            # c.commit()
        # except:
        #     isPost = False
        # finally:
            c.close()
            db.close()

    def _get_youtube(self, data):
        return self._return_str(data)

    def _get_phone_owner(self, data):
        return self._return_str(data)

    def _get_name_owner(self, data):
        return self._return_str(data)

    def _get_price_month(self, data):
        return self._return_int(data)

    def _get_price_bay(self, data):
        return self._return_int(data)

    def _get_rooms(self, data):
        return self._return_int(data)

    def _get_floors_up(self, data):
        return self._return_int(data)

    def _get_total_area(self, data):
        return self._return_int(data)

    def _get_floor(self, data):
        return self._return_int(data)

    def _get_room(self, data):
        return self._return_int(data)

    def _get_title(self, data):
        return self._return_str(data)

    def _get_panorama(self, data):
        return self._return_str(data)

    def _return_str(self, data):
        if data:
            return data
        else:
            return ' '

    def _return_int(self, data):
        if data:
            return data
        else:
            return 0

    def _get_district_id(self, data):
        list_district = District().get_district()
        for elem in list_district:
            if str(data) in elem:
                return elem[0]
        else:
            return 1

    def _get_type(self, data):
        if data == 1:
            return 3
        elif data == 2:
            return 1
        elif data == 3:
            return 2
        elif data == 4:
            return 4
        else:
            return 1

    def _get_operationType(self, data):
        if len(data) == 1:
            data = unicode.encode(unicode(data[0]), "utf8")
            if data == unicode.encode(u'Аренда', "utf8") or data == unicode.encode(u'Посуточна', "utf8"):
                return 1
            elif data == unicode.encode(u'Продажа', "utf8") or data == unicode.encode(u'Обмен', "utf8"):
                return 2
        else:
            return 1

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
        except:
            pass
        finally:
            c.close()
            db.close()
