# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0009_auto_20160708_0032'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addressfacilitydata',
            name='actuality',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0410\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u044c', blank=True, to='facility.TypeActuality', null=True),
        ),
    ]
