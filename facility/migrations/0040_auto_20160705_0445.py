# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0039_auto_20160705_0442'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='comment',
            field=models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='first_floor',
            field=models.BooleanField(default=0, verbose_name=b'\xd0\x9f\xd0\xb5\xd1\x80\xd0\xb2\xd1\x8b\xd0\xb9'),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='last_floor',
            field=models.BooleanField(default=0, verbose_name=b'\xd0\x9f\xd0\xbe\xd1\x81\xd0\xbb\xd0\xb5\xd0\xb4\xd0\xbd\xd0\xb8\xd0\xb9'),
        ),
    ]
