# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0010_auto_20160709_0555'),
    ]

    operations = [
        migrations.AddField(
            model_name='imagesfacility',
            name='cover',
            field=models.BooleanField(default=0, verbose_name='\u041e\u0431\u043b\u043e\u0436\u043a\u0430'),
        ),
    ]
