# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0017_auto_20160704_0312'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='call_date',
            field=models.DateField(null=True, verbose_name='\u0417\u0432\u043e\u043d\u043e\u043a \u0414\u0430\u0442\u0430'),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='call_time',
            field=models.TimeField(auto_now_add=True, verbose_name='\u0417\u0432\u043e\u043d\u043e\u043a \u0412\u0440\u0435\u043c\u044f', null=True),
        ),
    ]
