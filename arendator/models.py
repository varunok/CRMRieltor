# -*- coding: utf-8 -*-


from django.db import models
from setting_street.models import District
from facility.models import TypeRepairs, TypeFacility, TypeRooms, TypeNumberOfPerson
from django.contrib.auth.models import User


# Create your models here.


class UserFullName(User):
    class Meta:
        proxy = True

    def __unicode__(self):
        return self.get_full_name()


class TypeState(models.Model):
    class Meta:
        verbose_name = u'Тип состояния'
        verbose_name_plural = u'Типи состояний'

    state = models.CharField(max_length=150,
                             verbose_name=u'Состояние',
                             blank=True,
                             null=True)

    def __unicode__(self):
        return self.state


class TypeClient(models.Model):
    class Meta:
        verbose_name = u'Тип клиента'
        verbose_name_plural = u'Типи клиентов'

    client = models.CharField(max_length=150,
                              verbose_name=u'Тип клиента',
                              blank=True,
                              null=True)

    def __unicode__(self):
        return self.client


class TypeStage(models.Model):
    class Meta:
        verbose_name = u'Тип Этапа'
        verbose_name_plural = u'Типи Этапов'

    stage = models.CharField(max_length=150,
                             verbose_name=u'Тип Этапа',
                             blank=True,
                             null=True)

    def __unicode__(self):
        return self.stage


class Arendator(models.Model):
    class Meta(object):
        verbose_name = u'Арендатор'
        verbose_name_plural = u'Арендатори'

    rieltor = models.ManyToManyField(UserFullName,
                                     blank=True,
                                     verbose_name=u'Риелтор',
                                     related_name='rielt')

    loyality = models.ManyToManyField(UserFullName,
                                      blank=True,
                                      verbose_name=u'Лояльность',
                                      related_name='loyal')

    commission = models.CharField(max_length=10,
                                  verbose_name=u'Комиссия',
                                  blank=True,
                                  null=True)

    name = models.CharField(max_length=250,
                            verbose_name=u'Имя',
                            blank=True)

    type_state = models.ForeignKey(TypeState,
                                   verbose_name=u'Состояние',
                                   blank=True,
                                   null=True,
                                   on_delete=models.PROTECT)

    type_client = models.ForeignKey(TypeClient,
                                    blank=True,
                                    null=True,
                                    related_name='t_client')

    phone_first = models.IntegerField(verbose_name=u'Телефон - 1',
                                      blank=True,
                                      null=True)

    phone_second = models.IntegerField(verbose_name=u'Телефон - 2',
                                       blank=True,
                                       null=True)

    comment = models.TextField(verbose_name=u'Коментарий',
                               blank=True,
                               null=True)

    email = models.EmailField(verbose_name=u'Електронная почта',
                              blank=True,
                              null=True)

    district_obj = models.ManyToManyField(District,
                                          verbose_name=u'Район',
                                          blank=True,
                                          related_name='districts')

    repairs = models.ManyToManyField(TypeRepairs,
                                     verbose_name=u'Ремонт',
                                     blank=True)

    type_building_data = models.ManyToManyField(TypeFacility,
                                                verbose_name=u'Тип объекта',
                                                blank=True)

    room = models.ManyToManyField(TypeRooms,
                                  blank=True,
                                  verbose_name=u'Комнаты')

    rooms_from = models.IntegerField(verbose_name=u'Комнат От', blank=True, null=True)

    rooms_to = models.IntegerField(verbose_name=u'Комнат До', blank=True, null=True)

    floors_from = models.IntegerField(verbose_name=u'Этажность От', blank=True, null=True)

    floors_to = models.IntegerField(verbose_name=u'Этажность До', blank=True, null=True)

    area_from = models.IntegerField(verbose_name=u'Площадь От', blank=True, null=True)

    area_to = models.IntegerField(verbose_name=u'Площадь До', blank=True, null=True)

    price_from = models.IntegerField(verbose_name=u'Цена От', blank=True, null=True)

    price_to = models.IntegerField(verbose_name=u'Цена До', blank=True, null=True)

    date_term = models.DateField(verbose_name=u'Сроки', blank=True, null=True)

    number_of_persons = models.ForeignKey(TypeNumberOfPerson,
                                          blank=True,
                                          null=True,
                                          on_delete=models.PROTECT,
                                          verbose_name=u'Количество человек')

    type_stage = models.ForeignKey(TypeStage,
                                   blank=True,
                                   null=True,
                                   on_delete=models.PROTECT,
                                   verbose_name=u'Этап')

    review_date = models.DateField(verbose_name=u'Дата обновления',
                                   blank=True,
                                   null=True,
                                   auto_now=True)

    call_date = models.DateField(verbose_name=u'Время звонка',
                                 blank=True,
                                 null=True)

    time_trash = models.DateTimeField(verbose_name=u'Время удаления',
                                      blank=True,
                                      null=True)

    name_user_trash = models.CharField(max_length=100,
                                       blank=True,
                                       null=True,
                                       verbose_name=u'Кто удалил')

    trash = models.BooleanField(verbose_name=u'Корзина', default=False)

    def __unicode__(self):
        return '%s' % self.id
