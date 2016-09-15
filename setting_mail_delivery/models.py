# -*- coding: utf-8 -*-


from django.db import models


class TemplateSms(models.Model):
    class Meta:
        verbose_name = u'Шаблон SMS рассылки'
        verbose_name_plural = u'Шаблоны рассылок SMS'

    title = models.CharField(max_length=250, verbose_name=u'Заголовок', blank=True, null=True)

    text = models.TextField(verbose_name=u'Текст', blank=True, null=True)

    signature = models.CharField(max_length=250, verbose_name=u'Подпись', blank=True, null=True)

    def __unicode__(self):
        return '%s' % self.title


class TemplateEmail(models.Model):
    class Meta:
        verbose_name = u'Шаблон Email рассылки'
        verbose_name_plural = u'Шаблоны рассылок Email'

    title = models.CharField(max_length=250, verbose_name=u'Тема', blank=True, null=True)

    logo = models.ImageField(verbose_name=u'Логотип', upload_to='temp_email_logo')

    text = models.TextField(verbose_name=u'Текст', blank=True, null=True)

    sender_address = models.EmailField(max_length=150, null=True, blank=True, verbose_name=u'E-mail владельца')

    signature = models.CharField(max_length=250, verbose_name=u'Подпись', blank=True, null=True)

    def __unicode__(self):
        return '%s' % self.title


class SettingSMS(models.Model):

    class Meta:
        verbose_name = u"Настройка рассылок SMS"
        verbose_name_plural = u"Настройка рассылок SMS"

    sender = models.CharField(max_length=150, verbose_name=u'Настройка рассылок SMS', blank=False, null=False)

    login = models.CharField(max_length=150, verbose_name=u'Логин', blank=False, null=False)

    password = models.CharField(max_length=150, verbose_name=u'Пароль', blank=False, null=False)

    def __unicode__(self):
        return '%s' % self.id
