# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('parsings', '0003_delete_configparserolx'),
    ]

    operations = [
        migrations.AddField(
            model_name='configparserolxsolo',
            name='SELECTOR_PRICE',
            field=models.CharField(max_length=250, null=True, verbose_name='SELECTOR_PRICE', blank=True),
        ),
    ]
