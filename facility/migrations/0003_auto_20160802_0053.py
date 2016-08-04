# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160725_0144'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='first_floor',
            field=models.BooleanField(verbose_name='\u041f\u0435\u0440\u0432\u044b\u0439'),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='last_floor',
            field=models.BooleanField(verbose_name='\u041f\u043e\u0441\u043b\u0435\u0434\u043d\u0438\u0439'),
        ),
    ]
