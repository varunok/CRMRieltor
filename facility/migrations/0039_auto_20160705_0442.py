# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0038_auto_20160705_0428'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='area_extra_room',
            field=models.CharField(max_length=10, null=True, verbose_name='\u0414\u043e\u043f.\u043a\u043e\u043c\u043d\u0430\u0442\u0430 \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='comment',
            field=models.TextField(default=1, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439', blank=True),
            preserve_default=False,
        ),
    ]
