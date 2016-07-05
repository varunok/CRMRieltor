# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0036_typerepairs'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='repairs',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0435\u043c\u043e\u043d\u0442', to_field=b'type_repairs', blank=True, to='facility.TypeRepairs', null=True),
        ),
    ]
