# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0030_addressfacilitydata_room'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='floor',
            field=models.IntegerField(null=True, verbose_name='\u042d\u0442\u0430\u0436', blank=True),
        ),
    ]
