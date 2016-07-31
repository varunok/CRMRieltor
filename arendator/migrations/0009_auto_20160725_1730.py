# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160725_0144'),
        ('setting_street', '0001_initial'),
        ('arendator', '0008_auto_20160725_1715'),
    ]

    operations = [
        migrations.AddField(
            model_name='arendator',
            name='district_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0430\u0439\u043e\u043d', to_field=b'district', blank=True, to='setting_street.District', null=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='repairs',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0435\u043c\u043e\u043d\u0442', to_field=b'type_repairs', blank=True, to='facility.TypeRepairs', null=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='room',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442\u044b', blank=True, to='facility.TypeRooms', null=True),
        ),
        migrations.AddField(
            model_name='arendator',
            name='type_building_data',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u0442\u0440\u043e\u0435\u043d\u0438\u0435', to_field=b'type_building', blank=True, to='facility.TypeBuilding', null=True),
        ),
    ]
