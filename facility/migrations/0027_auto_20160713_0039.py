# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0026_auto_20160710_0354'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='rooms',
            field=models.CharField(max_length=11, null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='total_area',
            field=models.IntegerField(null=True, verbose_name='\u041e\u0431\u0449\u0430\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
    ]
