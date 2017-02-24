# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import arendator.models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0006_auto_20161006_1401'),
    ]

    operations = [
        migrations.AlterField(
            model_name='arendator',
            name='phone_first',
            field=models.CharField(default=0, max_length=15, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d - 1', validators=[arendator.models.validate_isnumber]),
            preserve_default=False,
        ),
    ]
