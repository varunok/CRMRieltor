# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('makler', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='makler',
            name='phone_second',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d 2', blank=True),
        ),
        migrations.AddField(
            model_name='makler',
            name='phone_third',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d 3', blank=True),
        ),
    ]
