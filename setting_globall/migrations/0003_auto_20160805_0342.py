# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_globall', '0002_franshisesity'),
    ]

    operations = [
        migrations.AlterField(
            model_name='franshisesity',
            name='sity',
            field=models.CharField(max_length=100, null=True, verbose_name='\u0413\u043e\u0440\u043e\u0434', blank=True),
        ),
    ]
