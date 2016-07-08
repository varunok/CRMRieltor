# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0006_auto_20160707_2242'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='district_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0430\u0439\u043e\u043d', to_field=b'district', blank=True, to='setting_street.District', null=True),
        ),
    ]
