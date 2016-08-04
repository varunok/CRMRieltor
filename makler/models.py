# -*- coding: utf-8 -*-


from django.db import models

# Create your models here.
class TypeCooperations(models.Model):
    class Meta(object):
        verbose_name = u'Тип сотрудничества'
        verbose_name_plural = u'Типи сотрудничества'

    type_cooperation = models.CharField(max_length=50, verbose_name=u'Тип сотрудничества')

    def __unicode__(self):
        return '%s' % self.type_cooperation


class TypeWhiteBlack(models.Model):
    class Meta(object):
        verbose_name = u'Тип маклера'
        verbose_name_plural = u'Типи маклеров'

    type_white_black = models.CharField(max_length=50, verbose_name=u'Тип маклера')

    def __unicode__(self):
        return '%s' % self.type_white_black


class Makler(models.Model):
    class Meta(object):
        verbose_name = u'Маклер'
        verbose_name_plural = u'Маклера'

    name = models.CharField(max_length=30, verbose_name=u'Имя', blank=True, null=True)

    agency = models.CharField(max_length=30, verbose_name=u'Агенство', blank=True, null=True)

    white_black = models.ForeignKey(TypeWhiteBlack,
                                    verbose_name=u'Тип маклера',
                                    blank=False,
                                    null=False,
                                    on_delete=models.PROTECT)

    phone = models.IntegerField(verbose_name=u'Телефон', blank=False, null=True)

    site = models.URLField(verbose_name=u'Сайт', null=True, blank=True)

    email = models.EmailField(verbose_name=u'Email', null=True, blank=True)

    cooperation = models.ForeignKey(TypeCooperations,
                                    verbose_name=u'Тип сотрудничества',
                                    blank=True,
                                    null=True,
                                    on_delete=models.PROTECT)

    def __unicode__(self):
        return '%s' % self.id