# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0003_auto_20160703_0329'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='number_apartment',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u043a\u0432\u0430\u0440\u0442\u0438\u044b', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='number_home',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u0434\u043e\u043c\u0430', blank=True),
        ),
    ]
