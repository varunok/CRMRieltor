# -*- coding: utf-8 -*-


from django.db import models
from setting_street.models import Street, District, Subway
from django.contrib.auth.models import User
from extuser.models import MyUser
from setting_globall.models import NationalCarrency


# Create your models here.

class UserFullName(User):
    class Meta:
        proxy = True

    def __unicode__(self):
        return self.get_full_name()


class TypeFacility(models.Model):
    class Meta(object):
        verbose_name = u'Тип обекта'
        verbose_name_plural = u'Типы объектов'

    type_facility = models.CharField(max_length=50,
                                     unique=True,
                                     verbose_name=u'Тип обекта')

    def __unicode__(self):
        return self.type_facility


class TypeOperations(models.Model):
    class Meta(object):
        verbose_name = u'Тип операции'
        verbose_name_plural = u'Типы операций'

    type_operations = models.CharField(max_length=50,
                                       unique=True,
                                       blank=True,
                                       null=True,
                                       verbose_name=u'Тип операции')

    def __unicode__(self):
        return self.type_operations


class TypeContactOwner(models.Model):
    class Meta(object):
        verbose_name = u'Тип контакта владельца'
        verbose_name_plural = u'Типы контактов владельца'

    type_contact_owner = models.CharField(max_length=50,
                                          unique=True,
                                          blank=False,
                                          null=True,
                                          verbose_name=u'Тип контакта владельца')

    def __unicode__(self):
        return self.type_contact_owner


class TypeBuilding(models.Model):
    class Meta(object):
        verbose_name = u'Тип строения'
        verbose_name_plural = u'Типы строений'

    type_building = models.CharField(max_length=50,
                                     unique=True,
                                     blank=False,
                                     null=True,
                                     verbose_name=u'Тип строения')

    def __unicode__(self):
        return self.type_building


class TypeRepairs(models.Model):
    class Meta(object):
        verbose_name = u'Тип ремонта'
        verbose_name_plural = u'Типы ремонта'

    type_repairs = models.CharField(max_length=50,
                                    unique=True,
                                    blank=False,
                                    null=True,
                                    verbose_name=u'Тип ремонта')

    def __unicode__(self):
        return self.type_repairs


class TypeActuality(models.Model):
    class Meta(object):
        verbose_name = u'Тип актуальности'
        verbose_name_plural = u'Типы актуальности'

    type_actuality = models.CharField(max_length=50,
                                      unique=True,
                                      blank=False,
                                      null=True,
                                      verbose_name=u'Тип актуальности')

    def __unicode__(self):
        return self.type_actuality


class TypeCondition(models.Model):
    class Meta(object):
        verbose_name = u'Тип состояния'
        verbose_name_plural = u'Типы состояния'

    type_condition = models.CharField(max_length=50,
                                      unique=True,
                                      blank=False,
                                      null=True,
                                      verbose_name=u'Тип состояния')

    def __unicode__(self):
        return self.type_condition


class AddressFacilityData(models.Model):
    class Meta(object):
        verbose_name = u'Адресс обекта'
        verbose_name_plural = u'Адресса объектов'

    type_facilit = models.ForeignKey('TypeFacility',
                                     to_field='type_facility',
                                     verbose_name=u"Тип обекта",
                                     blank=False,
                                     null=True,
                                     on_delete=models.PROTECT)

    street_obj = models.ForeignKey(Street,
                                   to_field='full_street',
                                   verbose_name=u'Улица',
                                   blank=False,
                                   null=True,
                                   on_delete=models.PROTECT)

    district_obj = models.ForeignKey(District,
                                     to_field='district',
                                     verbose_name=u'Район',
                                     blank=True,
                                     null=True,
                                     on_delete=models.PROTECT)

    subway_obj = models.ForeignKey(Subway,
                                   to_field='subway',
                                   verbose_name=u'Метро',
                                   blank=True,
                                   null=True,
                                   on_delete=models.PROTECT)

    number_home = models.CharField(max_length=10,
                                   verbose_name=u'Номер дома',
                                   blank=True,
                                   null=True)

    number_apartment = models.CharField(max_length=10,
                                        verbose_name=u'Номер квартиы',
                                        blank=True,
                                        null=True)

    price_bay = models.IntegerField(default=0,
                                    verbose_name=u'Цена(выкуп)')

    price_month = models.IntegerField(default=0,
                                      verbose_name=u'Цена(месяц)')

    list_operations = models.ManyToManyField(TypeOperations,
                                             verbose_name=u'Тип операции',
                                             blank=False)
    # start Описание объекта
    type_building_data = models.ForeignKey(TypeBuilding,
                                           to_field='type_building',
                                           verbose_name=u'Строение',
                                           blank=True,
                                           null=True,
                                           on_delete=models.PROTECT)

    # поле ремонт
    repairs = models.ForeignKey(TypeRepairs,
                                to_field='type_repairs',
                                verbose_name=u'Ремонт',
                                blank=True,
                                null=True,
                                on_delete=models.PROTECT)
    # Ориентир
    landmark = models.CharField(max_length=500,
                                verbose_name=u'Ориентир',
                                blank=True,
                                null=True)

    number_of_floors = models.CharField(max_length=10,
                                        verbose_name=u'Этажность от',
                                        blank=True,
                                        null=True)

    floors_up = models.CharField(max_length=10,
                                 verbose_name=u'Этажность до',
                                 blank=True,
                                 null=True)
    # Етаж первий
    first_floor = models.BooleanField(verbose_name='Первый')
    # Етаж последний
    last_floor = models.BooleanField(verbose_name='Последний')

    floor = models.CharField(max_length=10,
                             verbose_name=u'Этаж',
                             blank=True,
                             null=True)

    area_badroom = models.CharField(max_length=10,
                                    verbose_name=u'Спальня площадь',
                                    blank=True,
                                    null=True)

    area_kitchen = models.CharField(max_length=10,
                                    verbose_name=u'Кухня площадь',
                                    blank=True,
                                    null=True)

    area_living_room = models.CharField(max_length=10,
                                        verbose_name=u'Гостинная площадь',
                                        blank=True,
                                        null=True)

    area_extra_room = models.CharField(max_length=10,
                                       verbose_name=u'Доп.комната площадь',
                                       blank=True,
                                       null=True)

    total_area = models.CharField(max_length=10,
                                  verbose_name=u'Общая площадь',
                                  blank=True,
                                  null=True)

    payments = models.CharField(max_length=100,
                                verbose_name=u'Платежи',
                                blank=True,
                                null=True)

    rooms = models.CharField(max_length=10,
                             verbose_name=u'Комнат',
                             blank=True,
                             null=True)

    comment = models.TextField(verbose_name=u'Комментарий',
                               blank=False,
                               null=True)

    # end Описание объекта
    # start Состояние объекта
    rieltor = models.ManyToManyField(UserFullName,
                                     blank=True,
                                     verbose_name=u'Риелтор')

    loyality = models.ManyToManyField(UserFullName,
                                      blank=True,
                                      verbose_name=u'Лояльность',
                                      related_name='loyal')

    actuality = models.ForeignKey(TypeActuality,
                                  blank=True,
                                  null=True,
                                  on_delete=models.PROTECT,
                                  verbose_name=u'Актуальность')

    condition = models.ForeignKey(TypeCondition,
                                  blank=True,
                                  null=True,
                                  on_delete=models.PROTECT,
                                  verbose_name=u'Состояние')

    commission = models.CharField(max_length=10,
                                  verbose_name=u'Комиссия',
                                  blank=True,
                                  null=True)

    currency = models.ForeignKey(NationalCarrency,
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT,
                                 verbose_name=u'Валюта',
                                 default=2)

    # end Состояние объекта

    def __unicode__(self):
        return '%s' % (self.id)


class ContactOwner(AddressFacilityData):
    class Meta(object):
        verbose_name = u'Контакты владельца'
        verbose_name_plural = u'Контакты владельцев'

    contact_owner = models.ForeignKey(TypeContactOwner,
                                      blank=True,
                                      null=True,
                                      on_delete=models.PROTECT,
                                      verbose_name=u'Тип контакта владельца')

    agency = models.CharField(max_length=250,
                              verbose_name=u'Агенство',
                              blank=True)

    name_owner = models.CharField(max_length=250,
                                  verbose_name=u'Имя владельца',
                                  blank=True)

    review_date = models.DateField(verbose_name=u'Пересмотр Дата',
                                   blank=True,
                                   null=True)

    review_time = models.TimeField(verbose_name=u'Пересмотр Время',
                                   null=True,
                                   auto_now_add=True)

    call_date = models.DateField(verbose_name=u'Звонок Дата',
                                 blank=True,
                                 null=True)

    call_time = models.TimeField(verbose_name=u'Звонок Время',
                                 null=True,
                                 auto_now_add=True)

    email_owner = models.EmailField(max_length=150,
                                    null=True,
                                    blank=True,
                                    verbose_name=u'E-mail владельца')

    vip_owner = models.BooleanField(verbose_name='Vip')

    phone_owner = models.CharField(verbose_name=u'Телефон',
                                   blank=False,
                                   null=True,
                                   max_length=16)

    phone_owner_plus = models.CharField(verbose_name=u'Допол. Телефон',
                                        blank=True,
                                        null=True,
                                        max_length=16)

    def __unicode__(self):
        return 'O%s %s' % (self.id, self.name_owner)


class PhoneOwner(models.Model):
    class Meta(object):
        verbose_name = u'Телефони владельца'
        verbose_name_plural = u'Телефони владельцев'

    phone = models.ForeignKey(ContactOwner,
                              blank=True,
                              null=True,
                              on_delete=models.PROTECT)

    def __unicode__(self):
        return '%s' % (self.phone.phone_owner)


class DatabasePhoneOwner(models.Model):
    class Meta(object):
        verbose_name = u'Телефони владельца'
        verbose_name_plural = u'Телефони владельцев'

    db_id_owner = models.CharField(verbose_name=u'ID',
                                   blank=True,
                                   null=True,
                                   max_length=16)

    db_phone_owner = models.CharField(verbose_name=u'Телефон',
                                      blank=True,
                                      null=True,
                                      max_length=16)

    def __unicode__(self):
        return '%s => %s' % (self.db_id_owner, self.db_phone_owner)
