# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0033_auto_20160714_1943'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='area_kitchen',
            field=models.IntegerField(null=True, verbose_name='\u041a\u0443\u0445\u043d\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
    ]
