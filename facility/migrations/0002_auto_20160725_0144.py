# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='number_apartment',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u043a\u0432\u0430\u0440\u0442\u0438\u0440\u044b', blank=True),
        ),
    ]
