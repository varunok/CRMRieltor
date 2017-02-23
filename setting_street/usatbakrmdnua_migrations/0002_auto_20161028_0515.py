# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_street', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='street',
            name='street',
            field=models.CharField(max_length=50, verbose_name='\u0423\u043b\u0438\u0446\u0430'),
        ),
    ]
