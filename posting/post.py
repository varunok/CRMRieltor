# -*- coding: utf-8 -*-
import json
import os
import uuid
from datetime import datetime
from shutil import copyfile

from sqlalchemy import create_engine, ForeignKey, text, select
from sqlalchemy import Column, String, Integer, DateTime, Text, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship, aliased

from django.conf import settings

# films = session.query(RieltoeObject)
# films = films.filter_by(title='sdfdsfw').all()
# films = films.filter_by(id='sdfdsf').first()
# print(films.title)
# print(film)
# for film in films:
#     print(film.title)


base = declarative_base()


class BuildingRieltorObject(base):
    __tablename__ = 'rieltor_object_building'

    id = Column(Integer, primary_key=True)
    custom_id = Column(Integer)
    title = Column(String)
    when_create = Column(DateTime)
    updated = Column(DateTime)
    description = Column(Text)
    panorama = Column(Text)
    views = Column(Integer)
    video = Column(Text, default='')
    uuid = Column(String)
    image = Column(String, default='')
    is_short = Column(Boolean, default=False)
    is_vip = Column(Boolean, default=False)
    rooms = Column(Integer, default=None)
    footage = Column(Integer, default=None)
    floor = Column(Integer, default=None)
    address = Column(String, default='')
    layout = Column(String, default=None)
    appointment = Column(String, default='')
    type_deal = Column(String, default='')
    price = Column(Integer)
    name_id = Column(Integer, ForeignKey('rieltor_object_name.id'))
    phone_id = Column(Integer, ForeignKey('rieltor_object_phone.id'))
    district_id = Column(Integer,
                         ForeignKey('rieltor_object_district.id'))


class DailyRieltorObject(base):
    __tablename__ = 'rieltor_object_daily'

    id = Column(Integer, primary_key=True)
    custom_id = Column(Integer)
    title = Column(String)
    when_create = Column(DateTime)
    updated = Column(DateTime)
    description = Column(Text)
    panorama = Column(Text)
    views = Column(Integer)
    video = Column(Text, default='')
    uuid = Column(String)
    image = Column(String, default='')
    address = Column(String, default='')
    price = Column(Integer)
    sleeping_places = Column(Integer, default=None)
    rooms = Column(Integer, default=None)
    floor = Column(Integer, default=None)
    name_id = Column(Integer, ForeignKey('rieltor_object_name.id'))
    phone_id = Column(Integer, ForeignKey('rieltor_object_phone.id'))
    district_id = Column(Integer,
                         ForeignKey('rieltor_object_dailydistrict.id'))

    # def custom_id(self):
    #     return 0000 + self.id


class Name(base):
    __tablename__ = 'rieltor_object_name'

    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)


class Phone(base):
    __tablename__ = 'rieltor_object_phone'

    id = Column(Integer, primary_key=True)
    phone = Column(String, unique=True)


class DailyDistrict(base):
    __tablename__ = 'rieltor_object_dailydistrict'

    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)


class District(base):
    __tablename__ = 'rieltor_object_district'

    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)


class DjangoContentType(base):
    __tablename__ = 'django_content_type'

    id = Column(Integer, primary_key=True)
    app_label = Column(String)
    model = Column(String)


class Photos(base):
    __tablename__ = 'common_photo'

    id = Column(Integer, primary_key=True)
    title = Column(String)
    image = Column(String)
    object_id = Column(Integer)
    content_type_id = Column(Integer)


class PublishObject(object):

    def __init__(self, single_object, host, post_data):
        self.single_object = single_object
        self.post_data = post_data
        self.admin = host.replace('.', '').replace('-', '')
        self.db_post = host.replace('.', '').replace('-', '')
        self.path_to_file_path = '/home/gek/{0}/site/media_path.json'.format(host)
        self._create_session()

    def _create_session(self):
        db_string = "postgres://{0}:{1}@localhost:5432".format(
            self.admin, self.db_post)
        self.db = create_engine(db_string)

        Session = sessionmaker(self.db)
        self.session = Session()

    def get_show_posts(self):
        type_operation = str(self.single_object.list_operations.all().first())
        custom_id = int(str(self.single_object.id) + '00001')
        if type_operation in ['Аренда', 'Продажа']:
            query = self.session.query(BuildingRieltorObject)
        elif type_operation == 'Посуточна':
            query = self.session.query(DailyRieltorObject)
        query = query.filter_by(custom_id=custom_id).first()

        if hasattr(query, 'views'):
            return query.views

    def delete_public(self):
        type_operation = str(self.single_object.list_operations.all().first())
        custom_id = int(str(self.single_object.id) + '00001')

        if type_operation in ['Аренда', 'Продажа']:
            query = self.session.query(BuildingRieltorObject)
        elif type_operation == 'Посуточна':
            query = self.session.query(DailyRieltorObject)
        query = query.filter_by(custom_id=custom_id).first()

        if hasattr(query, 'id'):
            self.session.delete(query)
            self.session.commit()
            self.single_object.public = False
            self.single_object.save()

    def publish(self):
        publish_object = self.get_publish_obj()
        self.session.add(publish_object)
        self.session.commit()
        self.single_object.public = True
        self.single_object.save()

        self.save_images_to_photo_model(publish_object)

    def get_publish_obj(self):
        print()
        type_operation = str(self.single_object.list_operations.all().first())
        custom_id = int(str(self.single_object.id) + '00001')
        if type_operation in ['Аренда', 'Продажа']:
            return BuildingRieltorObject(
                title=str(self.single_object.type_facilit),
                when_create=datetime.now(),
                updated=datetime.now(),
                description=self.single_object.comment,
                panorama=self.single_object.panorama,
                video=self.single_object.youtube,
                views=0,
                uuid=str(uuid.uuid4()),
                is_vip=self.single_object.vip_owner,
                address=self.get_adress(),
                price=self.get_price(),
                type_deal=self.get_list_operations(),
                appointment=self.get_appointment(),
                name_id=self.get_name(),
                phone_id=self.get_phone(),
                district_id=self.get_district(),
                image=self.get_image(),
                custom_id=custom_id,
                rooms=self.single_object.rooms,
                footage=self.single_object.total_area,
                floor=self.single_object.floor,
                layout=self.get_type_rooms()
            )
        elif type_operation == 'Посуточна':
            return DailyRieltorObject(
                title=str(self.single_object.type_facilit),
                when_create=datetime.now(),
                updated=datetime.now(),
                description=self.single_object.comment,
                views=0,
                uuid=str(uuid.uuid4()),
                address=self.get_adress(),
                price=self.get_price(),
                sleeping_places=self.single_object.sleeps,
                rooms=self.single_object.rooms,
                video=self.single_object.youtube,
                panorama=self.single_object.panorama,
                name_id=self.get_name(),
                phone_id=self.get_phone(),
                district_id=self.get_daily_district(),
                image=self.get_image(),
                custom_id=custom_id,
                floor=self.single_object.floor
            )

    def get_type_rooms(self):
        if not hasattr(self.single_object.room, 'type_rooms'):
            return None

        type_rooms = self.single_object.room.type_rooms.encode('utf8')

        if type_rooms == 'Смежные':
            return 'related'
        elif type_rooms == 'Раздельные':
            return 'separate'
        elif type_rooms == 'Смежно-раздельные':
            return 'related-separate'

    def save_images_to_photo_model(self, rieltor_object):
        content_type_id = self._get_content_object_id(rieltor_object)
        object_id = rieltor_object.id

        try:
            with open(self.path_to_file_path, 'r') as f:
                result = json.load(f, encoding='utf8')
                path = result.get('path')
        except IOError:
            path = '/home/varunok/work/gek/media'

        album = self.single_object.photos.all()
        for image in album:

            path_new = '/'.join([path, 'photos', image.image.name.split('/')[-1]])
            copyfile(image.image.path, path_new)

            publish_photo = Photos(
                image='/'.join(['photos', image.image.name.split('/')[-1]]),
                object_id=object_id,
                content_type_id=content_type_id
            )
            self.session.add(publish_photo)
            self.session.commit()

    def _get_content_object_id(self, rieltor_object):
        data = rieltor_object.__tablename__.split('_')
        app_label = '_'.join(data[:2])
        model = data[-1]
        cont_type = self.session.query(DjangoContentType)
        cont_type = cont_type.filter_by(app_label=app_label,
                                        model=model).first()
        return cont_type.id

    def get_image(self):
        print(settings.BASE_DIR)
        try:
            with open(self.path_to_file_path, 'r') as f:
                result = json.load(f, encoding='utf8')
                path = result.get('path')
        except IOError:
            path ='/home/varunok/work/gek/media'

        album = self.single_object.photos.all()
        for image in album:
            path = '/'.join([path, 'photos', image.image.name.split('/')[-1]])
            copyfile(image.image.path, path)
            return '/'.join(['photos', image.image.name.split('/')[-1]])

    def get_phone(self):
        phone = self.post_data.get('post_phone')
        if not phone:
            return None
        sql = text(
            'SELECT rieltor_object_phone.id AS rieltor_object_phone_id, '
            'rieltor_object_phone.phone AS rieltor_object_phone_phone '
            'FROM rieltor_object_phone '
            'WHERE rieltor_object_phone.phone = \'%s\'' % phone)
        result = self.db.engine.execute(sql)
        result = list(result)
        if not result:
            phone = Phone(
                phone=phone
            )
            self.session.add(phone)
            self.session.commit()
            return phone.id
        else:
            return result[0][0]

    def get_name(self):
        name_owner = self.post_data.get('post_name')
        if not name_owner:
            return None
        name = self.session.query(Name)
        name = name.filter_by(name=name_owner).first()
        if not name:
            name = Name(
                name=name_owner
            )
            self.session.add(name)
            self.session.commit()

        return name.id

    def get_daily_district(self):
        district_name = str(self.single_object.district_obj)
        district_name = district_name.strip(' ')
        if not district_name:
            return None
        district = self.session.query(DailyDistrict).filter_by(
            name=district_name).first()
        if not district:
            district = DailyDistrict(
                name=district_name
            )
            self.session.add(district)
            self.session.commit()

        return district.id

    def get_district(self):
        district_name = str(self.single_object.district_obj)
        if not district_name:
            return None
        district_name = district_name.strip(' ')
        district = self.session.query(District).filter_by(
            name=district_name).first()
        if not district:
            district = District(
                name=district_name
            )
            self.session.add(district)
            self.session.commit()

        return district.id

    def get_adress(self):
        adress = str(self.single_object.street_obj)
        if self.single_object.number_home:
            adress = ', '.join([str(self.single_object.street_obj),
                                str(self.single_object.number_home)])
        if self.single_object.number_apartment:
            adress = '/'.join(
                [adress, str(self.single_object.number_apartment)])
        return adress

    def get_price(self):
        if self.single_object.price_bay > 0:
            return self.single_object.price_bay
        elif self.single_object.price_month > 0:
            return self.single_object.price_month
        elif self.single_object.price_day > 0:
            return self.single_object.price_day
        else:
            return 0

    def get_list_operations(self):
        type_operation = str(self.single_object.list_operations.all().first())
        if type_operation == 'Аренда':
            return 'rent'
        elif type_operation == 'Продажа':
            return 'sale'
        elif type_operation == 'Посуточна':
            return 'sale'

    def get_appointment(self):
        type_facility = str(self.single_object.type_facilit)
        if type_facility == 'Дом':
            return 'house'
        elif type_facility == 'Комната':
            return 'room'
        elif type_facility == 'Квартира':
            return 'apartment'
        else:
            return ''
