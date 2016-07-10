# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0023_auto_20160710_0342'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='lot',
            field=models.IntegerField(null=True, verbose_name='\u0423\u0447\u0430\u0441\u0442\u043e\u043a', blank=True),
        ),
    ]
