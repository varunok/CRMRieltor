# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0032_auto_20160714_1929'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='number_home',
            field=models.IntegerField(null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u0434\u043e\u043c\u0430', blank=True),
        ),
    ]
