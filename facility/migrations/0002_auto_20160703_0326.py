# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('setting_street', '0001_initial'),
        ('facility', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='subway_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041c\u0435\u0442\u0440\u043e', to_field=b'subway', to='setting_street.Subway', null=True),
        ),
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='district_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0430\u0439\u043e\u043d', to_field=b'district', to='setting_street.District', null=True),
        ),
    ]
