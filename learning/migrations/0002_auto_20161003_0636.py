# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('learning', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='learn',
            name='youtube',
            field=models.CharField(max_length=500, verbose_name='\u0412\u0438\u0434\u0435\u043e'),
        ),
    ]
