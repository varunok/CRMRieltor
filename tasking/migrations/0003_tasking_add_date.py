# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('tasking', '0002_auto_20160922_0309'),
    ]

    operations = [
        migrations.AddField(
            model_name='tasking',
            name='add_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 9, 25, 17, 55, 20, 398232), verbose_name='\u0414\u0430\u0442\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u044f', auto_now_add=True),
            preserve_default=False,
        ),
    ]
