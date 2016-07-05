# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0034_typebuilding'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='type_building_data',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u0442\u0440\u043e\u0435\u043d\u0438\u0435', to_field=b'type_building', blank=True, to='facility.TypeBuilding', null=True),
        ),
    ]
