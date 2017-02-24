# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('meeting', '0004_auto_20161006_2200'),
    ]

    operations = [
        migrations.AlterField(
            model_name='meeting',
            name='meet_facility',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='ID(O) \u041e\u0431\u044a\u0435\u043a\u0442', blank=True, to='facility.ContactOwner', null=True),
        ),
    ]
