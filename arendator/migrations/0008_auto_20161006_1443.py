# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0007_auto_20161006_1429'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='phone_first',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 1'),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='phone_second',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 2', blank=True),
        ),
    ]
