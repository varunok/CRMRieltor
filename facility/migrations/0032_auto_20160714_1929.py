# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0031_auto_20160714_1844'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='rooms',
            field=models.IntegerField(null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442', blank=True),
        ),
    ]
