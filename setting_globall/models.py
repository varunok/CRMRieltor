# -*- coding: utf-8 -*-


from django.db import models

# Create your models here.

class ListNationalCarrency(models.Model):
    class Meta(object):
        verbose_name = u'Список национальной валюты'
        verbose_name_plural = u'Списки национальной валюты'

    currency_glob = models.CharField(max_length=50)

    def __unicode__(self):
        return '%s' % (self.currency_glob)


class NationalCarrency(models.Model):
    class Meta(object):
        verbose_name = u'Тип национальной валюты'
        verbose_name_plural = u'Тип национальной валюты'

    currency = models.CharField(max_length=50)

    def __unicode__(self):
        return '%s' % (self.currency)


class FranshiseSity(models.Model):
    class Meta:
        verbose_name = u'Город франшизи'

    sity = models.CharField(max_length=100, verbose_name=u'Город', blank=True, null=True)


class Franshise(models.Model):
    class Meta:
        verbose_name = u'Франшиза'

    franshise = models.CharField(max_length=100, verbose_name=u'Франшиза', blank=True, null=True)