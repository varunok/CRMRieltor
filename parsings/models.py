# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from solo.models import SingletonModel

from django.db import models

# Create your models here.


class ConfigParserOLXSolo(SingletonModel):

    CITY = models.CharField(verbose_name=u'Город', blank=True, null=True, max_length=50)

    SITE_URL = models.CharField(verbose_name=u'SITE_URL', blank=True, null=True, max_length=250)

    AJAX_PHONE = models.CharField(verbose_name=u'AJAX_PHONE', blank=True, null=True, max_length=250)

    SELECTOR_GETLINK_CATEGORIES = models.CharField(verbose_name=u'SELECTOR_GETLINK_CATEGORIES', blank=True, null=True,
                                                   max_length=250)

    SELECTOR_GETTEXT_CATEGORIES = models.CharField(verbose_name=u'SELECTOR_GETTEXT_CATEGORIES', blank=True, null=True,
                                                   max_length=250)

    SELECTOR_GETLINK_ARTICLES = models.CharField(verbose_name=u'SELECTOR_GETLINK_ARTICLES', blank=True, null=True,
                                                 max_length=250)

    SELECTOR_SITY = models.CharField(verbose_name=u'SELECTOR_SITY', blank=True, null=True, max_length=250)

    SELECTOR_TITLE = models.CharField(verbose_name=u'SELECTOR_TITLE', blank=True, null=True, max_length=250)

    SELECTOR_DATE = models.CharField(verbose_name=u'SELECTOR_DATE', blank=True, null=True, max_length=250)

    SELECTOR_PRICE = models.CharField(verbose_name=u'SELECTOR_PRICE', blank=True, null=True, max_length=250)

    class Meta:
        verbose_name = u'Настройка парсера'
        verbose_name_plural = u'Настройки парсера'

    def __unicode__(self):
        return u"Site Configuration"

