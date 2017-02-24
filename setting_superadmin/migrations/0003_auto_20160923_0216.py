# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_superadmin', '0002_alltoconnect'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alltocall',
            name='phone',
            field=models.CharField(max_length=13, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
        ),
    ]
