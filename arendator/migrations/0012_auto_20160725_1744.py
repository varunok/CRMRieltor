# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160725_0144'),
        ('arendator', '0011_auto_20160725_1732'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='arendator',
            name='repairs',
        ),
        migrations.AddField(
            model_name='arendator',
            name='repairs',
            field=models.ManyToManyField(to='facility.TypeRepairs', verbose_name='\u0420\u0435\u043c\u043e\u043d\u0442', blank=True),
        ),
        migrations.RemoveField(
            model_name='arendator',
            name='room',
        ),
        migrations.AddField(
            model_name='arendator',
            name='room',
            field=models.ManyToManyField(to='facility.TypeRooms', verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442\u044b', blank=True),
        ),
        migrations.RemoveField(
            model_name='arendator',
            name='type_building_data',
        ),
        migrations.AddField(
            model_name='arendator',
            name='type_building_data',
            field=models.ManyToManyField(to='facility.TypeFacility', verbose_name='\u0421\u0442\u0440\u043e\u0435\u043d\u0438\u0435', blank=True),
        ),
    ]
