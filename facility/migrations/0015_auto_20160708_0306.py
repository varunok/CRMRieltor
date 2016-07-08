# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0014_auto_20160708_0305'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='currency',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0412\u0430\u043b\u044e\u0442\u0430', blank=True, to='setting_globall.NationalCarrency', null=True),
        ),
    ]
