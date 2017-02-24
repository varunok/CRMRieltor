# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0012_addressfacilitydata_literal'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='price_day',
            field=models.IntegerField(default=0, verbose_name='\u0426\u0435\u043d\u0430(\u043f\u043e\u0441\u0443\u0442\u043e\u0447\u043d\u043e)'),
        ),
    ]
