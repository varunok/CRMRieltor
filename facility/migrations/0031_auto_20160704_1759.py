# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0030_phoneowner'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner',
            field=models.CharField(max_length=16, unique=True, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='phone_owner_plus',
            field=models.CharField(max_length=16, unique=True, null=True, verbose_name='\u0414\u043e\u043f\u043e\u043b. \u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
    ]
