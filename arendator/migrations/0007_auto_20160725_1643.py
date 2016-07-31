# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0006_arendator_type_client'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='phone_first',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 1', blank=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='phone_second',
            field=models.CharField(max_length=15, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 2', blank=True),
        ),
        migrations.AlterField(
            model_name='arendator',
            name='type_state',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0435', blank=True, to='arendator.TypeState', null=True),
        ),
    ]
