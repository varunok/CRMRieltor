# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0014_addressfacilitydata_number_of_persons'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='equipment',
            field=models.ManyToManyField(to='facility.TypeEquipment', verbose_name='\u0422\u0435\u0445\u043d\u0438\u043a\u0430', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='the_presence_of_hot_water',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0435', blank=True, to='facility.TypeThePresenceOfHotWater', null=True),
        ),
    ]
