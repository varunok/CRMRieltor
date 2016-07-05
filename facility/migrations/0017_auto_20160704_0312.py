# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0016_auto_20160704_0305'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='review_time',
            field=models.TimeField(auto_now_add=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0412\u0440\u0435\u043c\u044f', null=True),
        ),
        migrations.AlterField(
            model_name='contactowner',
            name='review_date',
            field=models.DateField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0414\u0430\u0442\u0430'),
        ),
    ]
