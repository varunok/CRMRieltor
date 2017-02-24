# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0004_auto_20160928_0211'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='youtube',
            field=models.TextField(max_length=250, null=True, verbose_name='YouTube', blank=True),
        ),
    ]
