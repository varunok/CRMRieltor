# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0002_auto_20160703_0326'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='subway_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041c\u0435\u0442\u0440\u043e', to_field=b'subway', blank=True, to='setting_street.Subway', null=True),
        ),
    ]
