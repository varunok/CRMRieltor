from django.db import models
from django.utils import timezone

# Create your models here.


class Notes(models.Model):
    """class Notes"""

    class Meta(object):
        verbose_name = "Нотатка"
        verbose_name_plural = "Нотатки"

    text = models.TextField(verbose_name='Tекст Нотатки')
    name = models.CharField(max_length=50,
                            blank=True,
                            verbose_name='Заголовок')
    date = models.DateTimeField(default=timezone.now,
                                blank=False,
                                null=True,
                                verbose_name='Дата створення')

    def __str__(self):
        return '%s' % (self.name)
