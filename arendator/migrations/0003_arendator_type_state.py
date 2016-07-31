# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0002_auto_20160725_0222'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='type_state',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name=b'\xd0\xa1\xd0\xbe\xd1\x81\xd1\x82\xd0\xbe\xd1\x8f\xd0\xbd\xd0\xb8\xd0\xb5', blank=True, to='arendator.TypeState', null=True),
        ),
    ]
