# -*- coding: utf-8 -*-


from django.db import models
from facility.models import ContactOwner
# Create your models here.


class SingleObjComments(models.Model):
    class Meta(object):
        verbose_name = u'Коментарий обекта'
        verbose_name_plural = u'Коментарии объектов'

    obj_comments = models.ForeignKey(ContactOwner,
                                     verbose_name=u'Обьект',
                                     on_delete=models.PROTECT)

    comment = models.TextField(verbose_name='Коментарий')

    date_comment = models.DateTimeField(auto_now_add=True,
                                        verbose_name='Дата коментария')

    author_comment = models.CharField(verbose_name='Автор коментария',
                                      max_length=100)

    image = models.CharField(max_length=100,
                             default='0')

    def __unicode__(self):
        return self.comment
