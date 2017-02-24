# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('buyer', '0007_auto_20161006_1526'),
    ]

    operations = [
        migrations.AlterField(
            model_name='buyer',
            name='room',
            field=models.ManyToManyField(to='facility.TypeRooms', verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442\u044b', blank=True),
        ),
    ]
