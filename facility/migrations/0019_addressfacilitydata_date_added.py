# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0018_addressfacilitydata_date_of_renovation'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='date_added',
            field=models.DateTimeField(default=datetime.datetime(2016, 7, 10, 2, 33, 51, 887866), verbose_name='\u0414\u0430\u0442\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u044f', auto_now_add=True),
            preserve_default=False,
        ),
    ]
