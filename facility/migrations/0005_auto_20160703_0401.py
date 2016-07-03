# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0004_auto_20160703_0340'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='price_bay',
            field=models.IntegerField(default=0, max_length=10, verbose_name='\u0426\u0435\u043d\u0430(\u0432\u044b\u043a\u0443\u043f)'),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='price_month',
            field=models.IntegerField(default=0, max_length=10, verbose_name='\u0426\u0435\u043d\u0430(\u043c\u0435\u0441\u044f\u0446)'),
        ),
    ]
