# -*- coding: utf-8 -*-


from django.db import models
from arendator.models import Arendator
from single_object.models import TypeShows
from facility.models import ContactOwner

# Create your models here.


class SingleArendatorComments(models.Model):
    class Meta(object):
        verbose_name = u'Коментарий обекта'
        verbose_name_plural = u'Коментарии объектов'

    obj_comments = models.ForeignKey(Arendator,
                                     verbose_name=u'Обьект',
                                     on_delete=models.PROTECT)

    comment = models.TextField(verbose_name='Коментарий')

    date_comment = models.DateTimeField(auto_now_add=True,
                                        verbose_name=u'Дата коментария')

    author_comment = models.CharField(verbose_name=u'Автор коментария',
                                      max_length=100)

    image = models.CharField(max_length=100,
                             default='0')

    type_tabs = models.CharField(max_length=20, verbose_name=u'Какая вкладка?')

    def __unicode__(self):
        return self.comment


class Shows(models.Model):
    class Meta(object):
        verbose_name = u'Показ владельцу'
        verbose_name_plural = u'Покази владельцам'

    type_shows_arendator = models.ForeignKey(TypeShows, verbose_name=u"Покази владельцу",
                                             null=True, default=1)

    array_arendator = models.ForeignKey(Arendator, null=True)

    array_cont_ower = models.ForeignKey(ContactOwner, null=True)

    def __unicode__(self):
        return '%s' % self.id
