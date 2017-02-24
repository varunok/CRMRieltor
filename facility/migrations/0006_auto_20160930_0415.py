# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0005_auto_20160930_0404'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='panorama',
            field=models.TextField(null=True, verbose_name='\u041f\u0430\u043d\u043e\u0440\u0430\u043c\u0430', blank=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='youtube',
            field=models.TextField(null=True, verbose_name='YouTube', blank=True),
        ),
    ]
