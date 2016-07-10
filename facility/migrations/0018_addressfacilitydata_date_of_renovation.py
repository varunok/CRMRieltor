# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0017_auto_20160710_0154'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='date_of_renovation',
            field=models.DateTimeField(default=datetime.datetime(2016, 7, 10, 2, 27, 26, 786251), verbose_name='\u0414\u0430\u0442\u0430 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f', auto_now=True),
            preserve_default=False,
        ),
    ]
