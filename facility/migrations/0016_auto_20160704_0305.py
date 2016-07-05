# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0015_auto_20160704_0251'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contactowner',
            name='review_date',
            field=models.DateTimeField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440'),
        ),
    ]
