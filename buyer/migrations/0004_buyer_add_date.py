# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('buyer', '0003_auto_20160922_0325'),
    ]

    operations = [
        migrations.AddField(
            model_name='buyer',
            name='add_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 9, 25, 17, 55, 6, 989711), verbose_name='\u0414\u0430\u0442\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u044f', auto_now_add=True),
            preserve_default=False,
        ),
    ]
