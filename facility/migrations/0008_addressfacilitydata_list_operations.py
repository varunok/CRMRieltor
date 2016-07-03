# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0007_typeoperations'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='list_operations',
            field=models.ManyToManyField(to='facility.TypeOperations', null=True, verbose_name='\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438', blank=True),
        ),
    ]
