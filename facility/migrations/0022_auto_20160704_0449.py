# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0021_auto_20160704_0443'),
    ]

    operations = [
        migrations.AlterField(
            model_name='phoneowner',
            name='phone',
            field=models.IntegerField(max_length=16, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
        migrations.AlterField(
            model_name='phoneowner',
            name='phone_plus',
            field=models.CharField(max_length=16, null=True, verbose_name='\u0414\u043e\u043f. \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
    ]
