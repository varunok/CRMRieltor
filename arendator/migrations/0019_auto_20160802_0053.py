# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0018_auto_20160727_2339'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='name_user_trash',
            field=models.CharField(max_length=100, null=True, verbose_name='\u041a\u0442\u043e \u0443\u0434\u0430\u043b\u0438\u043b', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='time_trash',
            field=models.DateTimeField(null=True, verbose_name='\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u044f', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='trash',
            field=models.BooleanField(default=False, verbose_name='\u041a\u043e\u0440\u0437\u0438\u043d\u0430'),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='type_building_data',
            field=models.ManyToManyField(to='facility.TypeFacility', verbose_name='\u0422\u0438\u043f \u043e\u0431\u044a\u0435\u043a\u0442\u0430', blank=True),
        ),
    ]
