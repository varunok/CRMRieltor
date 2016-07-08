# -*- coding: utf-8 -*-


from django.db import models

# Create your models here.


class NationalCarrency(models.Model):
    class Meta(object):
        verbose_name = u'Тип национальной валюты'
        verbose_name_plural = u'Тип национальной валюты'

    currency = models.CharField(max_length=50)


    def __unicode__(self):
        return '%s' % (self.currency)