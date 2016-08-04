# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('makler', '0003_makler_cooperation'),
    ]

    operations = [
        migrations.AlterField(
            model_name='makler',
            name='phone',
            field=models.IntegerField(null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d'),
        ),
    ]
