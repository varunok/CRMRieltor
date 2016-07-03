# -*- coding: utf-8 -*-


from django.db import models
from setting_street.models import Street, District, Subway


# Create your models here.


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
                                     blank=False,
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
                                             blank=True)

    def __unicode__(self):
        return '%s' % (self.id)

class ContactOwner(AddressFacilityData):
    class Meta(object):
        verbose_name = u'Контакты владельца'
        verbose_name_plural = u'Контакты владельца'

    contact_owner = models.ForeignKey(TypeContactOwner,
                                      blank=False,
                                      null=False,
                                      on_delete=models.PROTECT)
