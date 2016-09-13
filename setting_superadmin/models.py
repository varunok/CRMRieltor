# -*- coding: utf-8 -*-


from django.db import models

# Create your models here.


class AllToCall(models.Model):
    class Meta:
        verbose_name = u'Всегда на связи'

    phone = models.IntegerField(verbose_name=u'Телефон', blank=True, null=True)

    email = models.EmailField(verbose_name=u'Email', blank=True, null=True)

    skype = models.CharField(max_length=100, verbose_name=u'Skype', blank=True, null=True)

    group_vk = models.CharField(max_length=200, verbose_name=u'Група Вконтакте', blank=True, null=True)


class AllToConnect(models.Model):
    class Meta:
        verbose_name = u'Написать сообщение'

    email = models.EmailField(verbose_name=u'Email', blank=True, null=True)
